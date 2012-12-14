package com.buptsse.wie;

import java.util.ArrayList;
import java.util.List;

/**
 * ��ȡ��ǩ��
 * ����ÿһ����ȡ��ǩ���������������ݼ���
 */
public class ExtractionTag {
	private String name;
	private List<ExtractionContent> contents;
	
	public ExtractionTag(String name) {
		this.name = name;
		contents = new ArrayList<ExtractionContent>();
	}
	
	public String getName() {
		return name;
	}
	
	public List<ExtractionContent> contents() {
		return this.contents;
	}
	
	public void addContent(ExtractionContent content) {
		if (content != null) {
			contents.add(content);
		}
	}
	
	public void clearContents() {
		contents.clear();
	}
	
	public void merge(ExtractionTag tag) {
		for (ExtractionContent content : tag.contents()) {
			this.addContent(content);
		}
	}
}
