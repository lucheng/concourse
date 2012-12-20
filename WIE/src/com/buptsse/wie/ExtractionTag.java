package com.buptsse.wie;

import java.util.ArrayList;
import java.util.List;

/**
 * ��ȡ��ǩ��
 * 
 * ����ÿһ����ȡ��ǩ���������������ݼ��ϣ�����һЩ��ȡ���ݼ��ϵĹ鲢����յȲ���
 */
public class ExtractionTag {
	// ��ȡ��ǩ��
	private String name;
	// ��ȡ��ǩ�����б�
	private List<ExtractionContent> contents;
	
	/**
	 * ���췽�������ݴ���ı�ǩ���ƽ��г�ʼ��
	 * @param name ��ǩ����
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
	 * �����������
	 */
	public void clearContents() {
		contents.clear();
	}
	
	/**
	 * ���ݴ���ĳ�ȡ��ǩ���ϣ�
	 * ����鲢�����еļ�����
	 * 
	 * @param tag ��ȡ�����ı�ǩ����
	 */
	public void merge(ExtractionTag tag) {
		for (ExtractionContent content : tag.contents()) {
			this.addContent(content);
		}
	}
}
