package com.zly.test.entity;

import java.io.Serializable;

public class SearchResultBean implements Serializable {

	private static final long serialVersionUID = -2036234201038468872L;
	
	private String title;
	
	private String content ;
	
	private String id ; 
	
	private String date;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}
