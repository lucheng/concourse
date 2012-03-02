package com.mywie.operate;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Element;
import org.dom4j.Node;

public class ExtractInfomation {
	
	@SuppressWarnings("unchecked")
	protected List<Element> extract(Element templateRoot, Element extractRoot) {
		
		List<Element> result = new ArrayList<Element>();

		List<Node> elementList = extractRoot.selectNodes("//*[@semantic]");
		
		for (Node node : elementList) {
			if (node instanceof Element) {
				Element element = (Element) node;
				result.add(element);
			}
		}
		
		return result;
	}
}
