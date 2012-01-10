package com.mywie.control;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;

import com.mywie.operate.TemplateOperate;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class Generater extends TemplateOperate{

	private Document markedFileDoc;
	
	public Generater(){
		
	}
	public Generater(String markedFileName){
		markedFileDoc = XmlHelp.getDocumentWithClean(markedFileName);
	}
	public Document getMarkedFileDoc() {
		return markedFileDoc;
	}
	public void setMarkedFileDoc(Document markedFileDoc) {
		this.markedFileDoc = markedFileDoc;
	}
	/**
	 * 利用预处理的标注文件，生成模板文件
	 * @param htmlFilePath 源码文件目录
	 * 
	 */
	public void generateTemplates(String htmlFilePath){
		
		Document rawHtmlDoc = null;
		List<Element> roots = new ArrayList<Element>();// 源代码list
		for (String name : FileHelp.getFiles(htmlFilePath)) {
			System.out.println(name);
			rawHtmlDoc = XmlHelp.getDocumentWithClean(name);
//			Document doc = preTemplate(markedFileDoc, rawHtmlDoc);
			if(rawHtmlDoc == null){
				continue;
			}
			Element root = rawHtmlDoc.getRootElement();
			setDirectory(htmlFilePath + "/template");
			roots.add(root);
		}
		setRate(0.9);
		//生成模板文件
		List<Element> roots1 = XmlHelp.getRootList(roots);
		generateTemplate(roots1);
	}
	
	
	public static void main(String[] args) {
		
		int count = 0;
		Generater generate = new Generater("C:/360buy/include/1.html");
		for(String name : FileHelp.getFiles("D:/data/360buy")){
			
	//		String name = "C:/360buy/http---www-360buy-com-product-1000062100-html.html";
			Document rawHtmlDoc = XmlHelp.getDocumentWithClean(name);
			Document htmlDoc = generate.preTemplate(generate.getMarkedFileDoc(), rawHtmlDoc);
			FileHelp.writeFile("file/" + (count++) + ".html", htmlDoc.asXML());
			
		}
//		generate.generateTemplates("C:/360buy");
	}
	

}
