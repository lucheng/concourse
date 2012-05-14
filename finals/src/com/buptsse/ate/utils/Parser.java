package com.buptsse.ate.utils;

import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.jsoup.Jsoup;
import org.jsoup.select.Elements;

import com.buptsse.ate.module.Content;
import com.buptsse.ate.module.Link;
import com.buptsse.ate.module.Page;
import com.buptsse.ate.module.Reinforce;


public class Parser {
	
	private static Logger logger = Logger.getLogger(Parser.class);
	
	public static Page parse(String fileName){
		
		Page page = new Page();
		
		org.jsoup.nodes.Document doc = Jsoup.parse(fileName,"UTF-8");
		
		Elements datas = doc.body().select("datas");
		
//		System.out.println(doc.html());
		
		for(org.jsoup.nodes.Element value : datas){
			System.out.println(value.html());
		}
		/*Element root = doc.getRootElement();
		Element data = (Element) root.selectSingleNode("//datas");
		String title = data.element("title").getStringValue();
		String fileId = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.lastIndexOf("."));
		
		page.setTitle(title);
		
		List<Element> elements = data.element("contents").elements();
		
		List<Content> contents = new ArrayList<Content>();
		for(Element e : elements){
			Content content = new Content();
			
			String subTitle  = e.selectSingleNode(".//subtitle").getStringValue();
			String text  = e.selectSingleNode(".//text").getStringValue();
			String summary  = e.selectSingleNode(".//summary").getStringValue();
			
			List<Element> links  = e.selectNodes(".//links//link");
			List<Link> linkList = new ArrayList<Link>();
			for(Element element : links){
				Link link = new Link(Integer.parseInt(element.attributeValue("index")), element.getStringValue(), element.attributeValue("url"));
				linkList.add(link);
			}
			
			List<Element> tagElements  = e.selectNodes(".//tags//tag");
			List<String> tags = new ArrayList<String>();
			for(Element tag : tagElements){
				String tagText = tag.getStringValue();
				tags.add(tagText);
			}
			
			content.setSubTitle(subTitle);
			content.setText(text);
			content.setSummary(summary);
			content.setLinks(linkList);
			content.setTaglist(tags);
			contents.add(content);
		}
		
		page.setContents(contents);
		
		List<Reinforce> reinforceList = new ArrayList<Reinforce>();
		List<Element> reinforces = data.element("reinforces").elements();
		for(int i = 0; i < reinforces.size(); i++){
			String url = reinforces.get(i).attributeValue("url");
			String index = reinforces.get(i).attributeValue("index");
			String text = reinforces.get(i).getStringValue();
			Reinforce reinforce = new Reinforce(Integer.parseInt(index), text, url);
			reinforceList.add(reinforce);
			
		}
		
		page.setReinforces(reinforceList);*/
		
		return page;
	}
	
	public static Page parseXmlFile(String fileName) throws Exception{
		
		Page page = new Page();
		
		Document doc = XmlHelp.getDocument(fileName);
		Element root = doc.getRootElement();
		Element data = (Element) root.selectSingleNode("//datas");
		String title = data.element("title").getStringValue();
		String fileId = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.lastIndexOf("."));
		
		page.setTitle(title);
		
		List<Element> elements = data.element("contents").elements();
		
		List<Content> contents = new ArrayList<Content>();
		for(Element e : elements){
			Content content = new Content();
			
			String subTitle  = e.selectSingleNode(".//subtitle").getStringValue();
			String text  = e.selectSingleNode(".//text").getStringValue();
			String summary  = e.selectSingleNode(".//summary").getStringValue();
			
			List<Element> links  = e.selectNodes(".//links//link");
			List<Link> linkList = new ArrayList<Link>();
			for(Element element : links){
				Link link = new Link(Integer.parseInt(element.attributeValue("index")), element.getStringValue(), element.attributeValue("url"));
				linkList.add(link);
			}
			
			List<Element> tagElements  = e.selectNodes(".//tags//tag");
			List<String> tags = new ArrayList<String>();
			for(Element tag : tagElements){
				String tagText = tag.getStringValue();
				tags.add(tagText);
			}
			
			content.setSubTitle(subTitle);
			content.setText(text);
			content.setSummary(summary);
			content.setLinks(linkList);
			content.setTaglist(tags);
			contents.add(content);
		}
		
		page.setContents(contents);
		
		List<Reinforce> reinforceList = new ArrayList<Reinforce>();
		List<Element> reinforces = data.element("reinforces").elements();
		for(int i = 0; i < reinforces.size(); i++){
			String url = reinforces.get(i).attributeValue("url");
			String index = reinforces.get(i).attributeValue("index");
			String text = reinforces.get(i).getStringValue();
			Reinforce reinforce = new Reinforce(Integer.parseInt(index), text, url);
			reinforceList.add(reinforce);
			
		}
		
		page.setReinforces(reinforceList);
		
		return page;
	}
	
	public static void saveAsXml(Page page, String filePath){
		
		if(page.getTitle().equals("")){
//			logger.info(filePath + "不存在！");
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
				
				Element summaryElement = contentElement.addElement("summary");
				summaryElement.addCDATA(content.getSummary());
				
				Element textElement = contentElement.addElement("text");
				textElement.addText(content.getText());
				
				Element linksElement = contentElement.addElement("links");
				for(Link link : content.getLinks()){
					Element linkElement = linksElement.addElement("link");
					linkElement.addText(link.getText());
					linkElement.addAttribute("url", link.getUrl());
					linkElement.addAttribute("index", link.getIndex()+"");
				}
				
				Element tagsElement = contentElement.addElement("tags");
				for(String key : content.getTaglist()){
					Element tagElement = tagsElement.addElement("tag");
					tagElement.addText(key);
				}
			}
			
			for(Reinforce reinforce : page.getReinforces()){
				Element linkElement = reinforceElement.addElement("reinforce");
				linkElement.addText(reinforce.getText());
				linkElement.addAttribute("url", reinforce.getUrl());
				linkElement.addAttribute("index", reinforce.getIndex()+"");
			}
			
			out.writeOpen(rootElement);
			out.write(titlesElement);
			out.write(contentsElement);
			out.write(reinforceElement);
			out.writeClose(rootElement);
			out.endDocument();
			out.close();
			logger.info("网页已保存：" + filePath);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		
		Page page = parse("\\\\buptsse215-02/data/baidu/1.xml");
//		saveAsXml(page, "1.xml");
	}
}

