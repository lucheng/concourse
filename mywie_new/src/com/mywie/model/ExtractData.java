package com.mywie.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;

import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class ExtractData {
	
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
		@Override
		public String toString() {
//			FileHelp.writeFile("file/block.xml", block.toString());
			String str = null;
			for(String key : block.keySet()){
				for(String s : block.get(key)){
					str += "block: " + s + "\n";
				}
			}
			return str;
		}
		
	}
	private Map<String, List<Element>> datas = new HashMap<String, List<Element>>();
	private List<String> titles = new ArrayList<String>();
	
	public void setExtractData(String filename, List<Element> result){
		datas.put(filename, result);
	}
	
	@SuppressWarnings("unchecked")
	private WieData extractData(String fileName){
		
		List<Element> elements = datas.get(fileName);
		
		WieData wieData = null;
		Map<String, String> semanticList = new HashMap<String, String>();
		Map<String, List<String>> blockMap = new HashMap<String, List<String>>();
		
		for (int i = 1; i < titles.size(); i++) {
			String title = titles.get(i);

			for (Element element : elements) {
				
				if (element.attributeValue("semantic").equals(title)) {

					wieData = new WieData();
					
					String semantic = element.getStringValue();
					semanticList.put(title, semantic);
					
					List<String> blockValueList = new ArrayList<String>();
					
					String blockValue = element.attributeValue("block");

					if(blockValue != null && !blockValue.equals("")){
						FileHelp.writeFile("file/" + blockValue+".xml", element.asXML());
						List<Node> nodes = element.selectNodes(".//" + blockValue);
						for (Node node : nodes){
							if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
								Element temp = (Element) node;
								blockValueList.add(temp.getStringValue());
							}
						}
						
						blockMap.put(title, blockValueList);
					}
					break;
				}
			}
		}
		if(wieData != null){
			wieData.setSemantic(semanticList);
			wieData.setBlock(blockMap);
		}
//		System.out.println(wieData);
		return wieData;
	}
	public void printToXML(String path) {
		Document outdoc = DocumentHelper.createDocument();
		outdoc.addProcessingInstruction("xml-stylesheet", "type='text/xsl' href='extraction.xsl'");
		Element rootElement = outdoc.addElement("extractions");
		Element titlesElement = rootElement.addElement("titles");
		for (String title : titles) {
			Element titleElement = titlesElement.addElement("title");
			titleElement.setText(title);
		}
		
		Element datasElement = rootElement.addElement("datas");
		for (String key : datas.keySet()) {
			Element dataElement = datasElement.addElement("data");
			
			Element fileNameElement = dataElement.addElement("fileName");
			fileNameElement.setText(key);
			
			WieData wieData = extractData(key);
			if(wieData == null){
				continue;
			}
			Map<String, String> semantic = wieData.getSemantic();
			Map<String, List<String>> blockMap = wieData.getBlock();
			
			if(semantic.size() == 0){
				continue;
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
						blockValueElement.setText(blockValue);
					}
				} else {
					Element valueElement = dataElement.addElement("value");
					valueElement.addAttribute("semantic", value);
					String text = semantic.get(value);
					if(text == null){
						text = "";
					}
					valueElement.setText(text);
				}
				
			}
		}
//		System.out.println(outdoc.asXML());
		XmlHelp.writeDocument(path, outdoc);
	}

	public List<String> getTitles() {
		return titles;
	}

	public void setTitles(List<String> titles) {
		this.titles = titles;
	}
	
}
