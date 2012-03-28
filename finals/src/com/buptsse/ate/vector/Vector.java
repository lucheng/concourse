package com.buptsse.ate.vector;

import java.util.HashMap;

public class Vector{
	public String name;
	public HashMap<String, Integer> map;
	
	public Vector(){
		name = null;
		map = new HashMap<String, Integer>();
	}
	
	public Vector(String n){
		name = n;
		map = new HashMap<String, Integer>();
	}
	
	public void setName(String n){
		this.name = n;
	}
	
	public void setMap(HashMap<String, Integer> m){
		this.map = m;
	}
}