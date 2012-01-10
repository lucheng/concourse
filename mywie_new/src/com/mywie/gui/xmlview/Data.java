package com.mywie.gui.xmlview;

import java.util.ArrayList;
import java.util.List;

public class Data {
	private List<String> values;

	public Data() {
		values = new ArrayList<String>();
	}

	public List<String> getValues() {
		return values;
	}

	public void setValues(List<String> values) {
		this.values = values;
	}
}