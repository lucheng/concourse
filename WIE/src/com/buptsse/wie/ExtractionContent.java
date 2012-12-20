package com.buptsse.wie;

import org.dom4j.Element;
import org.dom4j.Attribute;

/**
 * ��ҳ��ȡ������
 * 
 * ��Ϊ��ҳ��ȡ�����У��в�ͬ�ı�ǩ����Щ��ǩ�������ı�ǩ���Ը�������һЩ���죬����a��ǩ��
 * ���õ����ݰ���href���ı����ݣ���ҳ��ȡ��������ǽ���Щ���õĳ�ȡ�ڵ����ݽ���ƴ�ӣ���һЩ������
 * �ı�ǩ�����ݽ����������
 */
public class ExtractionContent {
	
	// ��ȡ����������
	private String value;
	// ��ȡ����ʱ�����ӵ�ַ
	private String href;
	
	public String getValue() {
		return value;
	}
	public String getLink(){
		return href;
	}
	
	public void setValue(String value) {
		this.value = value;
	}
	
	public void setLink(String link) {
		this.href = link;
	}
	
	/**
	 * ���췽��
	 * @param value ��ȡ����������
	 * @param link  ��ȡ����ʱ�����ӵ�ַ
	 */
	public ExtractionContent(String value, String link) {
		this.value = value;
		this.href = link;
	}
	
	/**
	 * ��ȡ�ڵ����ݵ�ƴ�ӣ���һЩ������
	 * �ı�ǩ�����ݽ����������
	 * 
	 * @param node dom���Ľڵ�
	 */
	public ExtractionContent(Element node) {
		
		// ���ڵ���ͼƬʱ
		if (node.getName().equalsIgnoreCase("img")) {
			this.value = "[ͼƬ]";
			for (Object obj : node.attributes()) {
				Attribute attr = (Attribute)obj;
				
				if (attr.getName() == "src") {
					this.href = attr.getValue();
				}
			}
		} else if (node.getName().equalsIgnoreCase("a")) {
			// ���ڵ�������ʱ
			this.value = node.getStringValue();
			for (Object obj : node.attributes()) {
				Attribute attr = (Attribute)obj;
				
				if (attr.getName() == "href") {
					this.href = attr.getValue();
				}
			}
		} else {
			// ���ڵ���������һ���Խڵ�ʱ
			this.value = node.getStringValue();
			this.href = null;
		}
	}
}
