package com.mywie.control;


import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;

import com.mywie.model.ExtractData;
import com.mywie.operate.MatchAlign;
import com.mywie.utils.XmlHelp;

public class Extracter {
	
	private String templateFile;
	private Element root;
	
	ExtractData ed = null;
	
	private MatchAlign matchAlign = new MatchAlign();
	
	public Extracter(String templateFile){
		
		ed = new ExtractData(templateFile);
		this.templateFile = templateFile;
		this.root = XmlHelp.getDocument(templateFile).getRootElement();
		
		List<Node> titleNodes = root.selectNodes("//*[@semantic]");
		List<String> titles = new ArrayList<String>();
		
		titles.add("网页名称");
		for (Node node : titleNodes) {
			if (node instanceof Element) {
				Element element = (Element) node;
				titles.add(element.attributeValue("semantic"));
			}
		}
		ed.setTitles(titles);
		
	}

	
	public Element extract(String extractFile) {
		
		try{
			
			Document doc = XmlHelp.getDocumentWithClean(extractFile);
			Element root2 = doc.getRootElement();
			List<Element> result = new ArrayList<Element>();
			List<Element> matchNodes1 = new ArrayList<Element>();
			List<Element> matchNodes2 = new ArrayList<Element>();
			
			/**
			 * 进行简单树匹配，得到所要抽取的节点
			 */
			matchAlign.match(root, root2, matchNodes1, matchNodes2);
			
			for (int j = 0; j < matchNodes1.size(); j++) {
				
				if (matchNodes1.get(j).attributeValue("semantic") != null) {
					
					matchNodes2.get(j).addAttribute("semantic", matchNodes1.get(j).attributeValue("semantic"));
					
					if(matchNodes1.get(j).attributeValue("block") != null){
						matchNodes2.get(j).addAttribute("block", matchNodes1.get(j).attributeValue("block"));
					}
					result.add(matchNodes2.get(j));
				}
			}
			System.out.println(result.size());
			for (Element element : result) {
				System.out.println(element.getStringValue());
			}
			return ed.createDataElement(extractFile, result);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}

	public Element getRoot() {
		return root;
	}

	public void setRoot(Element root) {
		this.root = root;
	}


	public static void main(String[] args){
		
		String templateFile = "C:/Users/Administrator/Desktop/hexun/template/hexun.html";
		String extractFile = "C:/Users/Administrator/Desktop/hexun/stockdata.stock.hexun.com^000001.shtml.html";
		
		Extracter extract= new Extracter(templateFile);
		Element element = extract.extract(extractFile);
		System.out.println(element.asXML());
	}

}
