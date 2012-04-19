package com.buptsse.ate.module;


public class Link {
	
	private int index;
	private String url;
	private String text;
	
	public Link(int index, String url, String text){
		
		this.index = index;
		this.url = url;
		this.text = text;
	}
	
	public int getIndex() {
		return index;
	}
	
	public void setIndex(int index) {
		this.index = index;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	
}

