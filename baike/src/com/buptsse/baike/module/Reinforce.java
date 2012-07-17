package com.buptsse.baike.module;


public class Reinforce {
	
	private int index;
	private int id;
	private String text;
	
	public Reinforce(int index, int id, String text){
		
		this.index = index;
		this.id = id;
		this.text = text;
	}
	
	public int getIndex() {
		return index;
	}
	
	public void setIndex(int index) {
		this.index = index;
	}
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	/*@Override
	public String toString() {
		
		int beginIndex = url.lastIndexOf("/")+1;
		int endIndex = url.lastIndexOf(".");
		
		if(beginIndex > 0 && endIndex > 0){
			String id = this.url.substring(beginIndex, endIndex);
			if(!id.equals("baike_help")){
				return "("+ this.getText()+","+ this.index+","+ id +")";
			}else {
				return "";
			}
		}
		return "";
	}*/
	
}

