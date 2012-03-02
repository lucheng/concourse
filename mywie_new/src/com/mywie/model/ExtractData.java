package com.mywie.model;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.xml.sax.SAXException;

import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;
/**
 * 抽取数据
 * 为了解决outofmemory的情况，必须修改这抽取一个文件为数据写一次xml文件，
 * 类中维护一个写入流。
 * @author Administrator
 *
 */
public class ExtractData {
	
	public ExtractData(){
		
	}
	
	public ExtractData(String directory, String templateFile){
		
		this.directory = directory;
		this.templateFile = templateFile;
		init();
	}
	
	private XMLWriter out;
	private List<String> titles = new ArrayList<String>();
	
	private String destDirectory;
	private Element templateRoot;//模板文件根节点
	private Element rootElement;//xml文件根节点
	
	private String templateFile;
	private String directory;
	
	
	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}

	private class WieData {
		
		private Map<String, String> semantic = new HashMap<String, String>();
		private Map<String, List<String>> block;
		
		public Map<String, List<String>> getBlock() {
			return block;
		}
		public void setBlock(Map<String, List<String>> block) {
			this.block = block;
		}
		
		public Map<String, String> getSemantic() {
			return semantic;
		}
		public void setSemantic(Map<String, String> semantic) {
			this.semantic = semantic;
		}
		
	}
	
	public String getTemplateFile() {
		return templateFile;
	}

	public void setTemplateFile(String templateFile) {
		this.templateFile = templateFile;
	}
	
	public Element getTemplateRoot() {
		return templateRoot;
	}

	public void setTemplateRoot(Element templateRoot) {
		this.templateRoot = templateRoot;
	}
	
	@SuppressWarnings("unchecked")
	private WieData extractData(String fileName, List<Element> elements){
		
		WieData wieData = null;
		Map<String, String> semanticMap = new HashMap<String, String>();
		Map<String, List<String>> blockMap = new HashMap<String, List<String>>();
		
		for (int i = 1; i < titles.size(); i++) {
			String title = titles.get(i);

			for (Element element : elements) {
				
				if (element.attributeValue("semantic").equals(title)) {

					wieData = new WieData();
					//如果是图片
					String semantic = "";
					if(element.getName().equalsIgnoreCase("img")){
						semantic = element.attribute("src").getStringValue();
					}else if(element.getName().equalsIgnoreCase("a")){
						semantic = element.attribute("src").getStringValue();
					}else {
						semantic = element.getStringValue();
					}
					semanticMap.put(title, semantic);
					
					List<String> blockValueList = new ArrayList<String>();
					
					String blockValue = element.attributeValue("block");

					if(blockValue != null && !blockValue.equals("")){
					
						List<Node> nodes = element.selectNodes(".//" + blockValue);
						for (Node node : nodes){
							if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
								Element temp = (Element) node;
								String blockStr = "";
								if(temp.getName().equalsIgnoreCase("img")){
									blockStr = temp.attribute("src").getStringValue();
								}else if(temp.getName().equalsIgnoreCase("a")){
									blockStr = temp.attribute("src").getStringValue();
								}else {
									blockStr = temp.getStringValue();
								}
								blockValueList.add(blockStr);
							}
						}
						
						blockMap.put(title, blockValueList);
					}
					break;
				}
			}
		}
		if(wieData != null){
			wieData.setSemantic(semanticMap);
			wieData.setBlock(blockMap);
		}
		return wieData;
	}
	
	public Element createDataElement(String fileName, List<Element> elements) {
		
		Element dataElement = DocumentHelper.createElement("data");
		
		Element fileNameElement = dataElement.addElement("fileName");
		fileNameElement.setText(fileName);
		
		WieData wieData = extractData(fileName, elements);
		if(wieData == null){
			return null;
		}
		Map<String, String> semantic = wieData.getSemantic();
		Map<String, List<String>> blockMap = wieData.getBlock();
		
		if(semantic.size() == 0){
			return null;
		}
		for(int i = 1; i < titles.size(); i++){
			
			String value = titles.get(i);
			
			List<String> blockList = blockMap.get(value);
			/**
			 * 如果块选择的值不为空
			 */
			if(blockList != null && blockList.size() > 0){
				Element blockElement = dataElement.addElement("block");
				blockElement.addAttribute("semantic", value);
				for(String blockValue : blockMap.get(value)){
					Element blockValueElement = blockElement.addElement("value");
					blockValueElement.addText(blockValue);
				}
			} else {
				Element valueElement = dataElement.addElement("value");
				valueElement.addAttribute("semantic", value);
				String text = semantic.get(value);
				if(text == null){
					text = "";
				}
				valueElement.addText(text);
			}
			
		}
		return dataElement;
	}
	
	private void init(){
		
		this.templateRoot = XmlHelp.getDocument(templateFile).getRootElement();
		
		destDirectory = directory + "/extraction";
		FileHelp.makedir(destDirectory);
		FileHelp.copyJarFile("include/extraction.xsl", destDirectory + "/extraction.xsl");
		
		/*
		 * 创建XMLWriter对象，设置XML编码，解决中文问题。
		 */
		OutputFormat outputFormat = OutputFormat.createPrettyPrint();
		outputFormat.setEncoding("GBK");
		
		try {
			out = new XMLWriter(new FileWriter(destDirectory + "/extraction.xml"), outputFormat);
			out.startDocument();
			out.processingInstruction("xml-stylesheet", "type='text/xsl' href='extraction.xsl'");
			rootElement = DocumentHelper.createElement("extractions");
			Element titlesElement = rootElement.addElement("titles");
			List<Node> titleNodes = templateRoot.selectNodes("//*[@semantic]");

			titles.add("网页名称");
			titlesElement.addElement("title").addText("网页名称");
			for (Node node : titleNodes) {
				if (node instanceof Element) {
					Element element = (Element) node;
					titles.add(element.attributeValue("semantic"));
					Element titleElement = titlesElement.addElement("title");
					titleElement.addText(element.attributeValue("semantic"));
				}
			}
			rootElement.addElement("datas");
			out.writeOpen(rootElement);
			out.write(titlesElement);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	public void close(){
		
		try {
			out.writeClose(rootElement);
			out.endDocument();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		}
		
	}
	
	public boolean extract(String fileName, List<Element> result) {
		
		try{
			/**
			 * 根据模板文件抽取出相应的数据
			 * 将一个文件的抽取数据写入到xml文件中
			 */
			Element data = createDataElement(fileName, result);
			out.write(data);
		}catch(Exception e){
			e.printStackTrace();
		}
		return true;
	}
	

	public List<String> getTitles() {
		return titles;
	}

	public void setTitles(List<String> titles) {
		this.titles = titles;
	}
	
}
