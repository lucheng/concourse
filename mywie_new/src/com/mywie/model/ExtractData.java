package com.mywie.model;

import java.util.ArrayList;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import com.mywie.utils.XmlHelp;

public class ExtractData {
	
	private List<String> titles = null;
	private List<List<String>> datas = null;
//	private XmlHelp xmlHelp = new XmlHelp();
	
	public List<String> getTitles() {
		if (titles == null) {
			titles = new ArrayList<String>();
		}
		return titles;
	}

	public void setTitles(List<String> titles) {
		this.titles = titles;
	}

	public List<List<String>> getDatas() {
		if (datas == null) {
			datas = new ArrayList<List<String>>();
		}
		return datas;
	}

	public void setDatas(List<List<String>> datas) {
		this.datas = datas;
	}

	public void printToXML(String path) {
		Document outdoc = DocumentHelper.createDocument();
		outdoc.addProcessingInstruction("xml-stylesheet",
				"type='text/xsl'   href='extraction.xsl'");
		Element rootElement = outdoc.addElement("extractions");
		Element titlesElement = rootElement.addElement("titles");
		for (String title : titles) {
			Element titleElement = titlesElement.addElement("title");
			titleElement.setText(title);
		}
		Element datasElement = rootElement.addElement("datas");
		for (List<String> data : datas) {
			Element dataElement = datasElement.addElement("data");
			for (String value : data) {
				Element valuElement = dataElement.addElement("value");
				if(value != null){
					valuElement.setText(value);
				}
			}
		}
		XmlHelp.writeDocument(path, outdoc);
	}
}
