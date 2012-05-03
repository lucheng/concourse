package com.zly.test.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity
@Table(name = "t_newsItem")
public class NewsItem implements Serializable {

	
	private static final long serialVersionUID = -7532888546907495633L;
	
	private Integer id ; 
	
	private String newsTitle ;
	
	private String newsContent;
	
	private Date publishTime;
	
	private String resource;
	
	private NewsType type;
	
	private String editor;
	@Column
	public String getEditor() {
		return editor;
	}

	public void setEditor(String editor) {
		this.editor = editor;
	}
	@ManyToOne
	@JoinColumn(name = "t_newsType_id")
	public NewsType getType() {
		return type;
	}

	public void setType(NewsType type) {
		this.type = type;
	}
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	@Column
	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}
	
	
	@Temporal(value = TemporalType.TIMESTAMP)
	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public String getResource() {
		return resource;
	}

	public void setResource(String resource) {
		this.resource = resource;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}
	
	
}
