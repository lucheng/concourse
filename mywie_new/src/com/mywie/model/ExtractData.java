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
 * ��ȡ����
 * Ϊ�˽��outofmemory������������޸����ȡһ���ļ�Ϊ����дһ��xml�ļ���
 * ����ά��һ��д������
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
	private Element templateRoot;//ģ���ļ����ڵ�
	private Element rootElement;//xml�ļ����ڵ�
	
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
					//�����ͼƬ
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
			 * �����ѡ���ֵ��Ϊ��
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
		 * ����XMLWriter��������XML���룬����������⡣
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

			titles.add("��ҳ����");
			titlesElement.addElement("title").addText("��ҳ����");
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
			 * ����ģ���ļ���ȡ����Ӧ������
			 * ��һ���ļ��ĳ�ȡ����д�뵽xml�ļ���
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
