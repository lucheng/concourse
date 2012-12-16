package com.buptsse.wie;

import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

/**
 * ��ȡ�����
 * �����ļ�������ȡ��ǩ���ϡ���ȡ���ݼ���
 */
public class ExtractionResult {
	
	// �ļ���
	private String fileName;
	// ��ȡ���ı�ǩ����
	private Map<String, ExtractionTag> tags;
	// ��ȡ���ı�ǩ��
	private HashSet<String> headers;
	
	/**
	 * ���췽��
	 * @param fileName ��ȡ�ļ����ļ���
	 */
	public ExtractionResult(String fileName) {
		this.fileName = fileName;
		tags = new HashMap<String, ExtractionTag>();
		headers = new HashSet<String>();
	}
	
	// getter ��setter����
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
	// getter ��setter���� ����
	
	
	/**
	 * ����ȡ�����ı�ǩ��ӵ���ǩ������
	 * 
	 * @param tag ��ȡ�������ı�ǩ����
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
	 * ����ȡ�����ı�ǩ���ݣ��鲢��һ��������
	 * @param tagName ��ǩ��
	 * @param content ��ǩ����
	 */
	public void addContent(String tagName, ExtractionContent content) {
		
		if (content == null) {
			return;
		}
		// ƥ���ǩ����������ھͼ�����ͬ��ǩ���ļ�����
		if (!tags.containsKey(tagName)) {
			tags.put(tagName, new ExtractionTag(tagName));
			headers.add(tagName);
		}
		
		ExtractionTag tag = tags.get(tagName);
		
		tag.addContent(content);
	}
	
	/**
	 * ��ձ�ǩ����
	 * 
	 */
	public void clear() {
		tags.clear();
	}
	
	/**
	 * ����ȡ���������ݽ��й鲢����
	 * 
	 * @param result ��ȡ���
	 */
	public void merge(ExtractionResult result) {
		if (result != null) {
			// ѭ����ȡ��ǩ������ǩ���뵽��ǩ������
			for (ExtractionTag tag : result.tags()) {
				for (ExtractionContent content : tag.contents()) {
					this.addContent(tag.getName(), content);
				}
			}
		}
	}
}

