package com.buptsse.ate.module;

import java.io.FileWriter;

import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import com.buptsse.ate.utils.Parser;

public class GraphViewUtils {

	private String BAIKE_XML_PATH = "\\\\buptsse215-02\\data\\baike\\";
	private Page page;
	
	public GraphViewUtils(int id) {

		String xmlFile = BAIKE_XML_PATH + id + ".xml";
		try {
			page = Parser.parse(xmlFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Page saveGraph(String filePath){
		
		XMLWriter out;
		OutputFormat outputFormat = OutputFormat.createPrettyPrint();
		outputFormat.setEncoding("UTF-8");
		
		try {
			out = new XMLWriter(new FileWriter(filePath), outputFormat);
			out.startDocument();
			
			Element rootElement = DocumentHelper.createElement("graphml");
			Element graphElement = rootElement.addElement("graph");
			
			
//			<key id="name" for="node" attr.name="name" attr.type="string"/>
			Element keyElement = graphElement.addElement("key");
			keyElement.addAttribute("id", "name");
			keyElement.addAttribute("for", "node");
			keyElement.addAttribute("attr.name", "name");
			keyElement.addAttribute("attr.type", "String");
				
//			<key id="gender" for="node" attr.name="gender" attr.type="string"/>
			/*Element key2Element = graphElement.addElement("key");
			key2Element.addAttribute("id", "id");
			key2Element.addAttribute("for", "node");
			key2Element.addAttribute("attr.name", "id");
			key2Element.addAttribute("attr.type", "String");*/
				
//			Element titlesElement = rootElement.addElement("title");
//			Element contentsElement = rootElement.addElement("contents");
//			Element reinforceElement = rootElement.addElement("reinforces");
//			
//			graphElement.addText(page.getWord());
//			
//			titlesElement.addText(page.getTitle());
			
			/*for(Content content : page.getContents()){
				
				Element contentElement = contentsElement.addElement("content");
				
				Element subtitleElement = contentElement.addElement("subtitle");
				subtitleElement.addText(content.getSubTitle());
				
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
			}*/
			
			Element selfElement = graphElement.addElement("node");
			selfElement.addAttribute("id", page.getBaibeId());
			Element dataElement = selfElement.addElement("data");
			dataElement.addAttribute("name", page.getTitle());
			
			for(Reinforce reinforce : page.getReinforces()){

				Element nodeElement = graphElement.addElement("node");
				nodeElement.addAttribute("id", reinforce.getId()+"");
				System.out.println(reinforce.getId());
				Element nodeDataElement = nodeElement.addElement("data");
				nodeDataElement.addAttribute("key", "name");
				nodeDataElement.addText(reinforce.getText());
			}
			
			out.writeOpen(rootElement);
			out.write(graphElement);
			out.writeClose(rootElement);
			out.endDocument();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return page;
	}
	
	public static void main(String[] args){
	
		GraphViewUtils graph = new GraphViewUtils(1);
		graph.saveGraph("1.xml");
	}

}
