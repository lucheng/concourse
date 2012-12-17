package com.buptsse.wie.models;

import java.util.ArrayList;
import java.util.List;

/**
 * 标注标签类
 * 
 * 抽取内容在程序中的表现形式
 */
public class SemanticTag {
	// 标注名
	private String semantic;
	// 块标注
	private String block;
	// 节点编号
	private String windowStatus;
	// 节点性质
	private String behave;
	// 抽取的值
	private List<String> values = new ArrayList<String>();
	
	public SemanticTag() {
		behave = "single";
	}
	
	public String getSemantic() {
		return semantic;
	}
	
	public String getBehavior() {
		return behave;
	}
	
	public void setBehavior(String behave) {
		this.behave = behave;
	}
	
	public void setSemantic(String semantic) {
		this.semantic = semantic;
	}
	public String getBlock() {
		return block;
	}
	public void setBlock(String block) {
		this.block = block;
	}
	public String getWindowStatus() {
		return windowStatus;
	}
	public void setWindowStatus(String windowStatus) {
		this.windowStatus = windowStatus;
	}
	
	public List<String> getValues() {
		return values;
	}
	public void setValues(List<String> values) {
		this.values = values;
	}
	
	/**
	 * 将抽取的数据值转化成字符串后返回
	 * 
	 * @return 转化成字符串后返回
	 */
	public String getXmlFormat(){
		
		StringBuffer sb = new StringBuffer();
		sb.append("<values>");
		for(String value : values){
			sb.append("<value>");
			sb.append(value);
			sb.append("</value>");
		}
		sb.append("</values>");
		return sb.toString();
	}
	
	public void setFileName(String fileName){
		values.add(fileName);
	}
	@Override
	public String toString() {
		return "semantic:" + semantic + " behave:" + behave + " windowStatus:" + windowStatus;
	}
	
	
}