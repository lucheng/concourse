package com.buptsse.wie;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

/**
 * 抽取结果类
 * 包含文件名、抽取标签集合、抽取内容集合
 */
public class ExtractionResult {
	private String fileName;
	private Map<String, ExtractionTag> tags;
	private HashSet<String> headers;
	
	public ExtractionResult(String fileName) {
		this.fileName = fileName;
		tags = new HashMap<String, ExtractionTag>();
		headers = new HashSet<String>();
	}
	
	HashSet<String> getHeaders() {
		return headers;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public Collection<ExtractionTag> tags() {
		return tags.values();
	}
	
	public boolean containsTag(String tagName) {
		return tags.containsKey(tagName);
	}
	
	public ExtractionTag getTag(String tagName) {
		if (tags.containsKey(tagName)) {
			return tags.get(tagName);
		} else {
			return null;
		}
	}
	
	public void addTag(ExtractionTag tag) {
		if (tag != null) {
			if (!tags.containsKey(tag.getName())) {
				tags.put(tag.getName(), tag);
				headers.add(tag.getName());
			} else {
				tags.get(tag.getName()).merge(tag);
			}
		}
	}
	
	public void addContent(String tagName, ExtractionContent content) {
		if (content == null) {
			return;
		}
		
		if (!tags.containsKey(tagName)) {
			tags.put(tagName, new ExtractionTag(tagName));
			headers.add(tagName);
		}
		
		ExtractionTag tag = tags.get(tagName);
		
		tag.addContent(content);
	}
	
	public void clear() {
		tags.clear();
	}
	
	public void merge(ExtractionResult result) {
		if (result != null) {
			for (ExtractionTag tag : result.tags()) {
				for (ExtractionContent content : tag.contents()) {
					this.addContent(tag.getName(), content);
				}
			}
		}
	}
}

