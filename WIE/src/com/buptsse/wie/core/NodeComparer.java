package com.buptsse.wie.core;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Element;

/**
 * 节点比较类
 * 用于计算节点之间的相似度
 */
public class NodeComparer {
	public static int DIFFERENT = 0;
	public static int SAME_TAG = 1;
	public static int SAME_CONTENT = 2;

	public static String[] names = { "id", "type", "style", "onsubmit",
			"onchange", "border", "target", "onmouseover", "content", "method",
			"valign" };
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
					return SAME_TAG;
				}
			}
		}

		if (isTitleEqual(node1.getStringValue().trim(), node2.getStringValue().trim())) {
			return SAME_CONTENT;
		}

		return SAME_TAG;

	}

	/**
	 * 对比title是否相同
	 * 
	 * @param text1
	 * @param text2
	 * @return
	 */
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

	public static boolean findAttribute(Attribute attribute,
			List<Attribute> attributeList) {
		for (Attribute a : attributeList) {
			if (attribute.getName().equals(a.getName())
					&& attribute.getValue().trim().equalsIgnoreCase(
							a.getValue().trim())) {
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
}