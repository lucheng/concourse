package com.mywie.control;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;

import com.mywie.operate.TemplateOperate;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class Generater extends TemplateOperate{

	public Generater(String htmlFilePath, double rate){
		FileHelp.makedir(htmlFilePath + "/template");
		this.htmlFilePath = htmlFilePath;
		this.rate = rate;
	}
	
//	private double rate;
	private String htmlFilePath;
	
	
	public double getRate() {
		return rate;
	}


	public void setRate(double rate) {
		this.rate = rate;
	}


	public String getHtmlFilePath() {
		return htmlFilePath;
	}


	public void setHtmlFilePath(String htmlFilePath) {
		this.htmlFilePath = htmlFilePath;
	}


	public int generateTemplates(){
		
		Document rawHtmlDoc = null;
		List<Element> roots = new ArrayList<Element>();// 源代码list
		for (String name : FileHelp.getFiles(htmlFilePath)) {
			System.out.println(name);
			rawHtmlDoc = XmlHelp.getDocumentWithClean(name);
			if(rawHtmlDoc == null){
				continue;
			}
			Element root = rawHtmlDoc.getRootElement();
			setDirectory(htmlFilePath + "/template");
			roots.add(root);
		}
		setRate(rate);
		//生成模板文件
		List<Element> roots1 = XmlHelp.getRootList(roots);
	
		int tempNum = generateTemplate(roots1);
		return tempNum;
	}

}
