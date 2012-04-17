package com.buptsse.ate.module;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Content {
	
	private String subTitle;
	private String text;
	private Map<String, String> links = new HashMap<String, String>();
	private List<String> taglist = new ArrayList<String>();
	
	public String getText() {
		return text;
	}


	public void setText(String text) {
		this.text = text;
	}
	
	public String getSubTitle() {
		return subTitle;
	}


	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	
	public Map<String, String> getLinks() {
		return links;
	}


	public void setLinks(Map<String, String> links) {
		this.links = links;
	}


	public List<String> getTaglist() {
		return taglist;
	}


	public void setTaglist(List<String> taglist) {
		this.taglist = taglist;
	}


	/*public void formByPage(){
		
		rootElement = DocumentHelper.createElement("content");
		
		Element subtitleElement = rootElement.addElement("subtitle");
		subtitleElement.addText(this.subTitle);
		
		Element contentElement = rootElement.addElement("html");
		contentElement.addCDATA(this.html);
		
		Element taglistElement = rootElement.addElement("taglist");
		List<Element> list = contentElement.selectNodes(".//dl[@id='viewExtCati']/dd/a");
		System.out.println("list:" + list.size());
		for(Element element : list){
			Element tagElement = taglistElement.addElement("tag");
			tagElement.addText(element.getStringValue());
		}
		
		
	}*/

	
	public static void main(String[] args) {
		
//		Page page = new Page("http://baike.baidu.com/view/2653231.htm");
//		page.saveAsXml("D:/panguso/baidu/page/2653231.xml");
	}
}

