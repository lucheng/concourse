package com.mywie.model;

import java.util.ArrayList;
import java.util.List;

public class MarkData {
	
	private String semantic;
	private String block;
	private String windowStatus;
	
	private List<String> values = new ArrayList<String>();
	
	public String getSemantic() {
		return semantic;
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
		return "semantic:" + semantic + " block:" + block + " windowStatus:" + windowStatus;
	}
	
	
}