package com.buptsse.ate.vector;

import java.util.HashMap;

public class VectorDouble{
	public String name;
	public HashMap<String, Double> map;
	
	public VectorDouble(){
		name = null;
		map = new HashMap<String, Double>();
	}
	
	public VectorDouble(String n){
		name = n;
		map = new HashMap<String, Double>();
	}
	
	public void setName(String n){
		this.name = n;
	}
	
	public void setMap(HashMap<String, Double> m){
		this.map = m;
	}
}