package com.buptsse.baike.module;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Content {
	
	private String subTitle;
	private String summary;
	private String text;
	private Map<String, String> attributes = new HashMap<String, String>();
	private List<Link> links = new ArrayList<Link>();
	private List<String> taglist = new ArrayList<String>();
	
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public String getSubTitle() {
		return subTitle;
	}


	public void setSubTitle(String subTitle) {
		this.subTitle = subTitle;
	}
	
	public List<Link> getLinks() {
		return links;
	}

	public void setLinks(List<Link> links) {
		this.links = links;
	}


	public List<String> getTaglist() {
		return taglist;
	}


	public void setTaglist(List<String> taglist) {
		this.taglist = taglist;
	}


	public Map<String, String> getAttributes() {
		return attributes;
	}


	public void setAttributes(Map<String, String> attributes) {
		this.attributes = attributes;
	}


	public static void main(String[] args) {
		
//		Page page = new Page("http://baike.baidu.com/view/2653231.htm");
//		page.saveAsXml("D:/panguso/baidu/page/2653231.xml");
	}
}

