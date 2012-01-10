package com.mywie.operate;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Element;
import org.dom4j.Node;

public class ExtractInfomation {
	
//	private MatchAlign matchAlign = new MatchAlign();
	
	@SuppressWarnings("unchecked")
	protected List<Element> extract(Element templateRoot, Element extractRoot) {
		
		List<Element> result = new ArrayList<Element>();
//		List<Element> matchNodes1 = new ArrayList<Element>();
//		List<Element> matchNodes2 = new ArrayList<Element>();
		
//		matchAlign.match(templateRoot, extractRoot, matchNodes1, matchNodes2);
		
		/*for (int j = 0; j < matchNodes1.size(); j++) {
			if (matchNodes1.get(j).attributeValue("semantic") != null) {
				matchNodes2.get(j).addAttribute("semantic", matchNodes1.get(j).attributeValue("semantic"));
				result.add(matchNodes2.get(j));
			}
		}*/
		
//		List<Element> elementList = extractRoot.elements();
		List<Node> elementList = extractRoot.selectNodes("//*[@semantic]");
		
		for (Node node : elementList) {
			if (node instanceof Element) {
				Element element = (Element) node;
				result.add(element);
			}
		}
		
		/*for (Element element : elementList) {
			System.out.println(element.asXML());
			if (element.attributeValue("semantic") != null) {
				result.add(element);
			}
		}*/
		
		
		/*for(int i = 0; i < matchNodes1.size(); i++){
			matchNodes1.remove(i);
		}
		for(int i = 0; i < matchNodes2.size(); i++){
			matchNodes2.remove(i);
		}
		matchNodes1 = null;
		matchNodes2 = null;*/
		return result;
	}
}
