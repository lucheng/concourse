package com.buptsse.wie;

import java.util.ArrayList;
import java.util.List;

/**
 * 抽取标签类
 * 
 * 描述每一个抽取标签，包含名称与内容集合，还有一些抽取数据集合的归并、清空等操作
 */
public class ExtractionTag {
	// 抽取标签名
	private String name;
	// 抽取标签内容列表
	private List<ExtractionContent> contents;
	
	/**
	 * 构造方法，根据传入的标签名称进行初始化
	 * @param name 标签名称
	 */
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
	
	/**
	 * 清除集合内容
	 */
	public void clearContents() {
		contents.clear();
	}
	
	/**
	 * 根据传入的抽取标签集合，
	 * 将其归并到现有的集合中
	 * 
	 * @param tag 抽取出来的标签集合
	 */
	public void merge(ExtractionTag tag) {
		for (ExtractionContent content : tag.contents()) {
			this.addContent(content);
		}
	}
}
