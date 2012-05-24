package edu.bupt.spring.utils;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;

import edu.bupt.spring.entity.Content;
import edu.bupt.spring.entity.Link;
import edu.bupt.spring.entity.Page;
import edu.bupt.spring.entity.Reinforce;
import edu.bupt.spring.entity.Tag;


public class Parser {
	
	private static Logger logger = Logger.getLogger(Parser.class);
	
	
	
	public static Page parseXmlFile(String fileName) throws Exception{
		
		Page page = new Page();
		
		Document doc = XmlHelp.getDocument(fileName);
		Element root = doc.getRootElement();
		Element data = (Element) root.selectSingleNode("//datas");
		String title = data.element("title").getStringValue();
		String fileId = fileName.substring(fileName.lastIndexOf("/") + 1, fileName.lastIndexOf("."));
		
		page.setTitle(title);
		
		List<Element> elements = data.element("contents").elements();
		
		Set<Content> contents = new HashSet<Content>();
		for(Element e : elements){
			Content content = new Content();
			
			String subTitle  = e.selectSingleNode(".//subtitle").getStringValue();
			String text  = e.selectSingleNode(".//text").getStringValue();
			String summary  = e.selectSingleNode(".//summary").getStringValue();
			
			List<Element> links  = e.selectNodes(".//links//link");
			Set<Link> linkList = new HashSet<Link>();
			for(Element element : links){
				Link link = new Link(Integer.parseInt(element.attributeValue("index")), element.getStringValue(), element.attributeValue("url"));
				linkList.add(link);
			}
			
			List<Element> tagElements  = e.selectNodes(".//tags//tag");
			Set<Tag> tags = new HashSet<Tag>();
			for(Element tag : tagElements){
				String tagText = tag.getStringValue();
				tags.add(new Tag(tagText));
			}
			
			content.setSubTitle(subTitle);
			content.setText(text);
			content.setSummary(summary);
			content.setLinks(linkList);
			content.setTags(tags);
			contents.add(content);
		}
		
		page.setContents(contents);
		
		Set<Reinforce> reinforceList = new HashSet<Reinforce>();
		List<Element> reinforces = data.element("reinforces").elements();
		for(int i = 0; i < reinforces.size(); i++){
			String text = reinforces.get(i).attributeValue("url");
			String index = reinforces.get(i).attributeValue("index");
			String url = reinforces.get(i).getStringValue();
			String baiduId = url.substring(url.lastIndexOf("/view/")+6, url.lastIndexOf(".htm"));
//			System.out.println(baiduId);
			Reinforce reinforce = new Reinforce(Integer.parseInt(index), Integer.parseInt(baiduId), text);
			reinforceList.add(reinforce);
			
		}
		
		page.setReinforces(reinforceList);
		
		return page;
	}
	
	public static void main(String[] args) throws Exception {
		
		Page page = parseXmlFile("\\\\buptsse215-02/data/baidu/1.xml");
//		saveAsXml(page, "1.xml");
	}
}

