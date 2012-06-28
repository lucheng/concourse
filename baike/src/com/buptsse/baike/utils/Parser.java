package com.buptsse.baike.utils;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.buptsse.baike.module.Content;
import com.buptsse.baike.module.Link;
import com.buptsse.baike.module.Page;
import com.buptsse.baike.module.Reinforce;


public class Parser {
	
	private static Logger logger = Logger.getLogger(Parser.class);
	
	public static Page parse(String fileName) throws Exception{
		
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
//			String text  = e.selectSingleNode(".//text").getStringValue();
//			String summary  = e.selectSingleNode(".//summary").getStringValue();
			
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
//			content.setText(text);
//			content.setSummary(summary);
			content.setLinks(linkList);
			content.setTaglist(tags);
			contents.add(content);
		}
		
		page.setContents(contents);
		
		List<Reinforce> reinforceList = new ArrayList<Reinforce>();
		List<Element> reinforces = data.element("reinforces").elements();
		for(int i = 0; i < reinforces.size(); i++){
			String id = reinforces.get(i).attributeValue("id");
			String index = reinforces.get(i).attributeValue("index");
			String text = reinforces.get(i).getStringValue();
			Reinforce reinforce = new Reinforce(Integer.parseInt(index), Integer.parseInt(id), text);
			reinforceList.add(reinforce);
			
		}
		
		page.setReinforces(reinforceList);
		
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
			String id = reinforces.get(i).attributeValue("id");
			String index = reinforces.get(i).attributeValue("index");
			String text = reinforces.get(i).getStringValue();
			Reinforce reinforce = new Reinforce(Integer.parseInt(index), Integer.parseInt(id), text);
			reinforceList.add(reinforce);
			
		}
		
		page.setReinforces(reinforceList);
		
		return page;
	}
	
	public void saveAsXml(Page page, String filePath){
		
		if(page.getTitle().equals("")){
			return;
		}
		
		File dir = new File(filePath.substring(0, filePath.lastIndexOf("/")));
		if(!dir.exists()){
			dir.mkdirs();
		}
		XMLWriter out;
		OutputFormat outputFormat = OutputFormat.createPrettyPrint();
		outputFormat.setEncoding("UTF-8");
		
		try {
			out = new XMLWriter(new FileWriter(filePath), outputFormat);
			out.startDocument();
			
			Element rootElement = DocumentHelper.createElement("datas");
			Element wordElement = rootElement.addElement("word");
			Element idElement = rootElement.addElement("id");
			Element titlesElement = rootElement.addElement("title");
			Element contentsElement = rootElement.addElement("contents");
			Element reinforceElement = rootElement.addElement("reinforces");
			
			idElement.addText(page.getBaibeId());
			wordElement.addText(page.getWord());
			
			titlesElement.addText(page.getTitle());
			
			for(Content content : page.getContents()){
				
				Element contentElement = contentsElement.addElement("content");
				
				Element subtitleElement = contentElement.addElement("subtitle");
				subtitleElement.addText(content.getSubTitle());
				
				Element summaryElement = contentElement.addElement("summary");
				summaryElement.addText(content.getSummary());
				
				Element attrbutesElement = contentElement.addElement("attrbutes");
				for(String key : content.getAttributes().keySet()){
					Element attrbuteElement = attrbutesElement.addElement("attrbute");
					attrbuteElement.addText(content.getAttributes().get(key));
					attrbuteElement.addAttribute("key", key);
				}
				
				Element linksElement = contentElement.addElement("links");
				for(Link link : content.getLinks()){
					Element linkElement = linksElement.addElement("link");
					linkElement.addText(link.getText());
					linkElement.addAttribute("id", link.getUrl());
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
				linkElement.addAttribute("id", reinforce.getId()+"");
				linkElement.addAttribute("index", reinforce.getIndex()+"");
			}
			
			out.writeOpen(rootElement);
			out.write(wordElement);
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
	
	public void extractText(Page page, String fileName){
		
		File dir = new File(fileName.substring(0, fileName.lastIndexOf("/")));
		if(!dir.exists()){
			dir.mkdirs();
		}
		
		
	}
	
	public static void main(String[] args) throws Exception {
		
//		Page page = parse("\\\\buptsse215-02/data/baidu/1.xml");
		String strPath = "D:/data/sina";
		List<String> filelist = new ArrayList<String>();
		FileHelp.refreshFileList(strPath, filelist, ".xml");
		for(String fileName : filelist){
//			String fileName = "\\\\buptsse215-02/data/html/302.htm";
			Page page = parseXmlFile(fileName);
			List<Content> contents = page.getContents();
			
			for(int i = 0; i < contents.size(); i ++){
				FileHelp.writeFile("data/" + fileName.substring(fileName.lastIndexOf("/"), fileName.lastIndexOf(".")) + i + ".txt", contents.get(i).getSummary());
			}
		}
		
	}
}

