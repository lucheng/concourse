package com.mywie.operate;

import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;

import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class DataFilter {
	
	public static void dataFilter(Element root){
		
		int count = 1;
		List<Element> elements = root.selectNodes("//*[@simantic]");
		
		for(Element element : elements){
			String value = element.attribute("simantic").getValue();
			List<Element> sameNodes = root.selectNodes(element.getPath());
			for(Element e : sameNodes){
				e.addAttribute("simantic", value + (count++));
			}
			System.out.println("-------" + element.attribute("simantic").getValue());
		}
		FileHelp.writeFile("file/test.xml", root.asXML());
		
	}
	
	public static void main(String[] args){
		
		DataFilter filter = new DataFilter();
		Document document = XmlHelp.getDocument("file/test.xml");
		filter.dataFilter(document.getRootElement());
//		System.out.println(document.asXML());
		
	}
}
