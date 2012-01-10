package com.mywie.gui.xmlview;

import java.util.ArrayList;
import java.util.List;

public class ResultForm {
	private List<String> titles = new ArrayList<String>();
	private List<Data> datas = new ArrayList<Data>();

	public List<String> getTitles() {
		return titles;
	}

	public void setTitles(List<String> titles) {
		this.titles = titles;
	}

	public List<Data> getDatas() {
		return datas;
	}

	public void setDatas(List<Data> datas) {
		this.datas = datas;
	}
}
