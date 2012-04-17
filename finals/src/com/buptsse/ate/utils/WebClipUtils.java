package com.buptsse.ate.utils;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileWriter;
import java.io.StringWriter;
import java.net.URL;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.PrettyXmlSerializer;
import org.htmlcleaner.TagNode;
import org.htmlcleaner.XmlSerializer;

import com.buptsse.ate.module.Content;
import com.buptsse.ate.module.Page;
import com.thoughtworks.xstream.XStream;

public class WebClipUtils extends Thread{

	public static String getUrlContent(String url) throws Exception {
		HtmlCleaner htmlCleaner = new HtmlCleaner();

		CleanerProperties props = htmlCleaner.getProperties();

		TagNode node = htmlCleaner.clean(new URL(url), "UTF-8");

		XmlSerializer xmlSerializer = new PrettyXmlSerializer(props);
		StringWriter writer = new StringWriter();
		xmlSerializer.writeXml(node, writer, "GB2312");

		return writer.toString();

	}

	public static void saveAsXml(Page page, String filePath){
		
		if(page.getTitle().equals("")){
			System.out.println("网页不存在！");
			return;
		}
		XMLWriter out;
		OutputFormat outputFormat = OutputFormat.createPrettyPrint();
		outputFormat.setEncoding("UTF-8");
		
		try {
			out = new XMLWriter(new FileWriter(filePath), outputFormat);
			out.startDocument();
			
			Element rootElement = DocumentHelper.createElement("datas");
			Element titlesElement = rootElement.addElement("title");
			Element contentsElement = rootElement.addElement("contents");
			Element reinforceElement = rootElement.addElement("reinforces");
			
			titlesElement.addText(page.getTitle());
			
			for(Content content : page.getContents()){
				
				Element contentElement = contentsElement.addElement("content");
				
				Element subtitleElement = contentElement.addElement("subtitle");
				subtitleElement.addText(content.getSubTitle());
				
				Element textElement = contentElement.addElement("text");
				textElement.addText(content.getText());
				
				Element linksElement = contentElement.addElement("links");
				for(String key : content.getLinks().keySet()){
					Element linkElement = linksElement.addElement("link");
					linkElement.addText(key);
					linkElement.addAttribute("url", content.getLinks().get(key));
				}
				
				Element tagsElement = contentElement.addElement("tags");
				for(String key : content.getTaglist()){
					Element tagElement = tagsElement.addElement("tag");
					tagElement.addText(key);
				}
			}
			
			for(String key : page.getReinforce().keySet()){
				Element linkElement = reinforceElement.addElement("reinforce");
				linkElement.addText(key);
				linkElement.addAttribute("url", page.getReinforce().get(key));
			}
			
			out.writeOpen(rootElement);
			out.write(titlesElement);
			out.write(contentsElement);
			out.write(reinforceElement);
			out.writeClose(rootElement);
			out.endDocument();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	public void saveHtml(){
		
	}
	/*public static Document getUrlDoc(String url) throws Exception {
		
		HtmlCleaner htmlCleaner = new HtmlCleaner();
		SAXReader saxReader = new SAXReader();
		
		CleanerProperties props = htmlCleaner.getProperties();

		TagNode node = htmlCleaner.clean(new URL(url), "UTF-8");

		XmlSerializer xmlSerializer = new PrettyXmlSerializer(props);
		StringWriter writer = new StringWriter();
		xmlSerializer.writeXml(node, writer, "UTF-8");
		Document doc = saxReader.read(new ByteArrayInputStream(writer.toString().getBytes()));
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");
		XMLWriter writer1 = new XMLWriter(new FileWriter(new File("cctv.xml")), format);
		writer1.write(doc);
		writer1.close();
		return doc;
	}*/
	
	public static void main(String[] args) throws InterruptedException{
		for(int i = 2796; i < 9999; i++){
			try{
				Page page = new Page("http://baike.baidu.com/view/"+ i +".htm");
				String fileName = "D:/panguso/baidu/xml/"+ i + "_" + page.getTitle().replaceAll("/", "-").replace(":", "^") +".xml";
				if(!new File(fileName).exists()){
					saveAsXml(page, fileName);
					System.out.println(i + "_" + page.getTitle());
				} else {
//					System.out.println(i + "_" + page.getTitle() + "已存在！");
				}
			}catch(Exception e){
				e.printStackTrace();
				sleep(1000);
				i--;
				continue;
			}
		}
		
	}

}
