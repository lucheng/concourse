package com.buptsse.wie.core;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Attribute;
import org.dom4j.Element;

/**
 * �ڵ�Ƚ���
 * ���ڼ���ڵ�֮������ƶ�
 * 
 */
public class NodeComparer {
	
	// ��ʾ�ڵ㲻ͬ
	public static int DIFFERENT = 0;
	// ��ʾ�ڵ������ͬ��ǩ��
	public static int SAME_TAG = 1;
	// ��ʾ�ڵ������ͬ��ǩ��������
	public static int SAME_CONTENT = 2;

	// ��Ҫ�Աȵ�һЩ��ǩ������
	public static String[] names = { "id", "type", "style", "onsubmit",
			"onchange", "border", "target", "onmouseover", "content", "method",
			"valign" };
	
	public static List<String> attributes = new ArrayList<String>();
	static {
		for (int i = 0; i < names.length; i++)
			attributes.add(names[i]);
	}

	/**
	 * �Ա������ڵ��Ƿ���ͬ
	 * @param node1		����ڵ�1
	 * @param node2		����ڵ�2
	 * @return			�ڵ�ԱȽ��
	 */
	public static int compare(Element node1, Element node2) {

		// ��ǩ���Ʋ�һ��
		if (node1.getName().equals(node2.getName()) == false)
			return DIFFERENT;

		// ��ǩ���Բ�һ��
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
	 * �Ա�title�Ƿ���ͬ
	 * 
	 * @param text1	title1������
	 * @param text2	title2������
	 * @return	�Ƿ���ͬ
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

	/**
	 * 
	 * @param attribute
	 * @param attributeList
	 * @return
	 */
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