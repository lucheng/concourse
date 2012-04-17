package com.buptsse.ate.utils;

import java.io.FileWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.buptsse.ate.module.Content;
import com.buptsse.ate.module.Page;


public class Parser {
	
	public static Page parseXmlFile(String fileName){
		
		Page page = new Page();
		
		Document doc = XmlHelp.getDocument(fileName);
		Element root = doc.getRootElement();
		Element data = (Element) root.selectSingleNode("//datas");
		String title = data.element("title").getStringValue();
		String fileId = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.lastIndexOf("_"));
		
		page.setTitle(title);
		
		List<Element> elements = data.element("contents").elements();
		System.out.println(fileId);
		System.out.println(title);
		
		List<Content> contents = new ArrayList<Content>();
		for(Element e : elements){
			Content content = new Content();
			
			String subTitle  = e.selectSingleNode(".//subtitle").getStringValue();
			String text  = e.selectSingleNode(".//text").getStringValue();
			
			List<Element> links  = e.selectNodes(".//links//link");
			Map<String, String> linkMap = new HashMap<String, String>();
			for(Element link : links){
				String linkText = link.getStringValue();
				String linkUrl = link.attributeValue("url");
				linkMap.put(linkText, linkUrl);
			}
			
			List<Element> tagElements  = e.selectNodes(".//tags//tag");
			List<String> tags = new ArrayList<String>();
			for(Element tag : tagElements){
				String tagText = tag.getStringValue();
				tags.add(tagText);
			}
			
			content.setSubTitle(subTitle);
			content.setText(text);
			content.setLinks(linkMap);
			content.setTaglist(tags);
			contents.add(content);
		}
		
		page.setContents(contents);
		
		Map<String, String> reinforceMap = new HashMap<String, String>();
		List<Element> reinforces = data.element("reinforces").elements();
		for(Element e : reinforces){
			String url = e.attributeValue("url");
			String text = e.getStringValue();
			reinforceMap.put(text, url);
			
		}
		
		page.setReinforce(reinforceMap);
		
		return page;
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
	
	public static void main(String[] args) {
		
		Page page = parseXmlFile("D:/panguso/baidu/xml/1_百度百科.xml");
		saveAsXml(page, "D:/panguso/baidu/xml/1.xml");
	}
}

