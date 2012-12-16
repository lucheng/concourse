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
	
	// 文件名
	private String fileName;
	// 抽取出的标签集合
	private Map<String, ExtractionTag> tags;
	// 抽取出的标签名
	private HashSet<String> headers;
	
	/**
	 * 构造方法
	 * @param fileName 抽取文件的文件名
	 */
	public ExtractionResult(String fileName) {
		this.fileName = fileName;
		tags = new HashMap<String, ExtractionTag>();
		headers = new HashSet<String>();
	}
	
	// getter 和setter方法
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
	// getter 和setter方法 结束
	
	
	/**
	 * 将抽取出来的标签添加到标签集合中
	 * 
	 * @param tag 抽取出现来的标签集合
	 */
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
	
	/**
	 * 将抽取出来的标签数据，归并到一个集合中
	 * @param tagName 标签名
	 * @param content 标签内容
	 */
	public void addContent(String tagName, ExtractionContent content) {
		
		if (content == null) {
			return;
		}
		// 匹配标签名，如果存在就加入相同标签名的集合中
		if (!tags.containsKey(tagName)) {
			tags.put(tagName, new ExtractionTag(tagName));
			headers.add(tagName);
		}
		
		ExtractionTag tag = tags.get(tagName);
		
		tag.addContent(content);
	}
	
	/**
	 * 清空标签集合
	 * 
	 */
	public void clear() {
		tags.clear();
	}
	
	/**
	 * 将抽取出来的数据进行归并操作
	 * 
	 * @param result 抽取结果
	 */
	public void merge(ExtractionResult result) {
		if (result != null) {
			// 循环抽取标签，将标签加入到标签集合中
			for (ExtractionTag tag : result.tags()) {
				for (ExtractionContent content : tag.contents()) {
					this.addContent(tag.getName(), content);
				}
			}
		}
	}
}

