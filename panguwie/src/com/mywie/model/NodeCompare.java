package com.mywie.model;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Element;

import com.mywie.utils.XmlHelp;

public class NodeCompare {
	
	private static RangeDifferencer rangeDifferencer = new RangeDifferencer();
	public static int DIFFERENT = 0;
	public static int SIMILARITY = 1;
	public static int EQUALITY = 2;
	public static String[] names = { "id", "type", "style", "onsubmit",
			"onchange", "border", "target", "onmouseover", "content", "method",
			"valign", "class" };
	public static List<String> attributes = new ArrayList<String>();
	static {
		for (int i = 0; i < names.length; i++)
			attributes.add(names[i]);
	}

	public static int compare(Element node1, Element node2) {

		// 标签名称不一致
		if (node1.getName().equals(node2.getName()) == false)
			return DIFFERENT;

		// 标签属性不一致
		List<Attribute> attributes1 = node1.attributes();
		List<Attribute> attributes2 = node2.attributes();
		for (Attribute attribute : attributes1) {
			if (attributes.contains(attribute.getName().toLowerCase())) {
				if (findAttribute(attribute, attributes2) == false) {
					return SIMILARITY;
				}
			}
		}

		if (isTitleEqual(node1.getStringValue().trim(), node2.getStringValue().trim())) {
			return EQUALITY;
		}

		return SIMILARITY;

	}

	/*public static boolean isElementEqual(Element e1, Element e2) {
		
		if(!e1.getName().equalsIgnoreCase(e2.getName())){
			return false;
		}
		else if(!e1.isRootElement()){
			return isElementEqual(e1.getParent(), e2.getParent());
		}else {
			return true;
		}
	}*/
	
	public static boolean isTitleEqual(String text1, String text2) {
		if ("".endsWith(text1) || "".equals(text2))
			return false;
		if (text1.equalsIgnoreCase(text2))
			return true;
		String[] splits = new String[] { " ", ":", "-", "|" };
		for (String s : splits) {
			int t1 = text1.indexOf(s);
			int t2 = text2.indexOf(s);
			if (t1 > 0
					&& t2 > 0
					&& text1.substring(0, t1).equalsIgnoreCase(
							text2.substring(0, t2))) {
				return true;
			}
		}
		return false;
	}

	
	/*public static boolean simslarAttribute1(List<Attribute> attributes1, List<Attribute> attributes2) {
		
		int count = 0;
		for(int i = 0; i < attributes1.size(); i++){
			for(int j = 0; j < attributes2.size(); j++){
				if(attributes1.get(i).getName().equalsIgnoreCase(attributes2.get(j).getName())){
					String value1 = attributes1.get(i).getValue();
					String value2 = attributes2.get(j).getValue();
					System.out.println(value1);
					System.out.println(value2);
					if(value1.equals(value2) || rangeDifferencer.Comparator(value1, value2)>0 ){
						count++;
					}
				}
				
			}
		}
		if(count > 0){
			System.out.println(count);
			return true;
		}
		return false;
	}*/
	
	public static boolean simslarAttribute(Element e1, Element e2) {
		
		if(e1.isRootElement() && e1.isRootElement() && equalsElement(e1, e2)){
			return true;
		}
		if(equalsElement(e1, e2)){
			return simslarAttribute(e1.getParent(), e2.getParent());
		}
		return false;
	}
	
	/*public static int min(int e1, int e2) {
		if(e1 > e2){
			return e2;
		}else {
			return e1;
		}
	}*/
	
	/**
	 * 判断两个节点是否相似
	 * @param e1
	 * @param e2
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public static boolean equalsElement(Element e1, Element e2) {
		
		List<Attribute> attributes1 = e1.attributes();
		List<Attribute> attributes2 = e2.attributes();
		
		/*for (Attribute attribute : attributes1) {
			if (attributes.contains(attribute.getName().toLowerCase())) {
				if (findAttribute(attribute, attributes2) == false) {
					return SIMILARITY;
				}
			}
		}*/
		/*int count = 0;
		for(int i = 0; i < attributes1.size(); i++){
			for(int j = 0; j < attributes2.size(); j++){
				if(attributes1.get(i).getName().equalsIgnoreCase(attributes2.get(j).getName())){
					String value1 = attributes1.get(i).getValue();
					String value2 = attributes2.get(j).getValue();
					System.out.println(value1);
					System.out.println(value2);
					if(value1.equals(value2) || rangeDifferencer.Comparator(value1, value2) > 0 ){
						count++;
					}
				}
				
			}
		}
		if(count > 0){
			System.out.println(count);
			return true;
		}*/
		
		return false;
	}

	public static boolean findAttribute(Attribute attribute, List<Attribute> attributeList) {
		for (Attribute a : attributeList) {
			if (attribute.getName().equals(a.getName()) && attribute.getValue().trim().equalsIgnoreCase(a.getValue().trim())) {
				return true;
			}
		}
		return false;
	}

	public static boolean isListNode(Element node) {
		if (node.getName().equalsIgnoreCase("ul")
				|| node.getName().equalsIgnoreCase("ol")
				|| node.getName().equalsIgnoreCase("dl")) {
			return true;
		}
		return false;
	}
	
	public static void main(String[] args){
		
		String fileName = "C:/Users/Administrator/Desktop/buptssewie/baike1/http---baike-baidu-com-view-1679-htm#sub5115440-2.html";
		Element root = XmlHelp.getDocumentWithClean(fileName).getRootElement();
//		boolean ff = isElementEqual((Element)root.selectSingleNode("//*[@id='sec-header1']"), (Element)root.selectSingleNode("//*[@id='sec-header0']"));
		boolean ss = simslarAttribute((Element)root.selectSingleNode("//*[@id='sec-header1']"), (Element)root.selectSingleNode("//*[@id='sec-header0']"));
		System.out.println(ss);
	}
}
