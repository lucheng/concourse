package com.mywie.model;

public class MarkData {
	
	private String semantic;
	private String block;
	private String windowStatus;
	
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
	@Override
	public String toString() {
		return "semantic:" + semantic + "\nblock:" + block + "\nwindowStatus:" + windowStatus;
	}
	
	
}