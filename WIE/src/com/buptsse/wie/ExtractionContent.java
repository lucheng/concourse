package com.buptsse.wie;

import org.dom4j.Element;
import org.dom4j.Attribute;

/**
 * 网页抽取内容类
 * 
 * 因为网页抽取内容中，有不同的标签，这些标签所包含的标签属性个数存在一些差异，比如a标签，
 * 有用的内容包括href与文本内容，网页抽取内容类就是将这些有用的抽取节点内容进行拼接，将一些多属性
 * 的标签的内容进行内容组合
 */
public class ExtractionContent {
	
	// 抽取出来的内容
	private String value;
	// 抽取链接时的链接地址
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
	 * 构造方法
	 * @param value 抽取出来的内容
	 * @param link  抽取链接时的链接地址
	 */
	public ExtractionContent(String value, String link) {
		this.value = value;
		this.href = link;
	}
	
	/**
	 * 抽取节点内容的拼接，将一些多属性
	 * 的标签的内容进行内容组合
	 * 
	 * @param node dom树的节点
	 */
	public ExtractionContent(Element node) {
		
		// 当节点是图片时
		if (node.getName().equalsIgnoreCase("img")) {
			this.value = "[图片]";
			for (Object obj : node.attributes()) {
				Attribute attr = (Attribute)obj;
				
				if (attr.getName() == "src") {
					this.href = attr.getValue();
				}
			}
		} else if (node.getName().equalsIgnoreCase("a")) {
			// 当节点是链接时
			this.value = node.getStringValue();
			for (Object obj : node.attributes()) {
				Attribute attr = (Attribute)obj;
				
				if (attr.getName() == "href") {
					this.href = attr.getValue();
				}
			}
		} else {
			// 当节点是其它单一属性节点时
			this.value = node.getStringValue();
			this.href = null;
		}
	}
}
