package com.buptsse.filter;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.xml.transform.TransformerException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.Document.OutputSettings;
import org.jsoup.select.Elements;

import com.mywie.utils.XmlHelp;

public class HtmlFilter {

	private static String charset = "GBK";
	public static void cleanFile(String fileName){
		XmlHelp.cleanHtml(fileName);
	}
	
	public static void intercept(String fileName) {
		try {
			File input = new File(fileName + ".temp");
			Document doc = Jsoup.parse(input, charset);
			Elements codes = doc.body().select("div[id=main_con]");
			System.out.println("------------------");
			FileOutputStream out = new FileOutputStream(new File(fileName + ".xml"));
			out.write(("<?xml version=\"1.0\" encoding=\"UTF-8\"?><html><body>"+codes.html()+"</body></html>").getBytes(charset));
//			out.write(("<html><body>"+codes.html()+"</body></html>").getBytes(charset));
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
			
		}
	}
	
	public static void clear(String fileName){
		try {
			File input = new File(fileName + ".temp");
			Document doc = Jsoup.parse(input, charset);
			Elements nodes = doc.select("*");
			System.out.println(nodes.size());
			FileOutputStream out = new FileOutputStream(new File(fileName + ".html"));
			out.write(("<html><body>").getBytes(charset));
			for(Element e : nodes){
				if(e.select("div[class=content]").size() == 0 ){
					out.write(e.html().getBytes(charset));
				}else {
					
				}
				
			}
			out.write(("</body></html>").getBytes(charset));
		} catch (IOException e) {
			e.printStackTrace();
			
		}
	}
	public static void main(String[] args) throws Exception {
		String fileName = "C:\\Documents and Settings\\linzhe\\×ÀÃæ\\crawl\\wie\\pages\\xinhua/";
//		String fileName = "";
		for(int i = 0; i < 10; i++){
			cleanFile(fileName + i +".html");
			intercept(fileName + i+".html");
			HtmlClear.clear(fileName + i +".html");
			
		}
//		clear(fileName + "2.html");0 (1).htm
//		filter("a.xml", "div.html", "div", "class", "btxt nophoto");
	}

}
