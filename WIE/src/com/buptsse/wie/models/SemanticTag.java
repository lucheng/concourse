package com.buptsse.wie.models;

import java.util.ArrayList;
import java.util.List;

/**
 * ±ê×¢±êÇ©Àà
 */
public class SemanticTag {
	
	private String semantic;
	private String block;
	private String windowStatus;
	private String behave;
	
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