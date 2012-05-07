package com.buptsse.ate.crawler;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.jsoup.Jsoup;

import com.buptsse.ate.extractor.KrCrawler;
import com.buptsse.ate.utils.FileHelp;
import com.buptsse.ate.utils.XmlHelp;

public abstract class Crawler extends Thread{

	protected org.jsoup.nodes.Document doc;
	
	protected String url;
	protected String author;
	protected String published;
	protected String title;
	protected long updateTime;
	protected String summary;
	protected List<Tag> tagList = new ArrayList<Tag>();
	protected List<Entity> entityList = new ArrayList<Entity>();
	
	public long getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(long updateTime) {
		this.updateTime = updateTime;
	}

	public List<Entity> getEntityList() {
		return entityList;
	}

	public void setEntityList(List<Entity> entityList) {
		this.entityList = entityList;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublished() {
		return published;
	}

	public void setPublished(String published) {
		this.published = published;
	}
	
	
	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}
	
	protected class Tag {
		public Tag(String link, String tag) {
			this.link = link;
			this.tag = tag;
		}
		public String getTag() {
			return tag;
		}
		public void setTag(String tag) {
			this.tag = tag;
		}
		protected String tag;
		protected String link;
		
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		
	}
	
	protected class Entity {
		
		private String name;
		private int weight;
		
		public Entity(String name, int weight) {
			this.name = name;
			this.weight = weight;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public int getWeight() {
			return weight;
		}

		public void setWeight(int weight) {
			this.weight = weight;
		}
		
		
		
	}
	
	public Crawler(String url) {
		
		try {
			this.doc = Jsoup.connect(url)
					.userAgent("Mozilla/5.0 (Windows NT 6.1; rv:5.0)")
					.cookie("auth", "token").timeout(1000).get();
			this.url = url;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Crawler(File file) {
		
		try {
			this.doc = Jsoup.parse(file, "GBK");
			this.url = file.getAbsolutePath();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public Crawler() {
		
	}

	public abstract void fetch();
	
	public void saveText(String filePath){
			
		if(new File(filePath).exists()){
			System.out.println("网页已存在！");
			return;
		}
		if(this.getTitle().equals("")){
			System.out.println("网页不存在！");
			return;
		}
		FileHelp.writeFile(filePath, summary.substring(0, summary.lastIndexOf("除非注明")));
	}
	
	public void saveFile(String filePath){
		
		/*if(new File(filePath).exists()){
			System.out.println("网页已存在！");
			return;
		}*/
		if(this.getTitle().equals("")){
			
			System.out.println(this.getUrl() +"网页不存在！");
			return;
		}
		XMLWriter out;
		OutputFormat outputFormat = OutputFormat.createPrettyPrint();
		outputFormat.setEncoding("UTF-8");
		
		try {
			out = new XMLWriter(new FileWriter(filePath), outputFormat);
			out.startDocument();
			
			Element rootElement = DocumentHelper.createElement("datas");
			Element titleElement = rootElement.addElement("title");
			Element authorElement = rootElement.addElement("author");
			Element publishedElement = rootElement.addElement("published");
			Element urlElement = rootElement.addElement("url");
			Element updateTimeElement = rootElement.addElement("updateTime");
			Element summaryElement = rootElement.addElement("summary");
			Element tagsElement = rootElement.addElement("tags");
			Element entitiesElement = rootElement.addElement("entities");
			
			titleElement.addText(this.getTitle());
			authorElement.addText(this.getAuthor()+"");
			urlElement.addText(this.getUrl());
			updateTimeElement.addText(System.currentTimeMillis()+"");
			summaryElement.addText(this.getSummary());
			
			for(Tag tag : this.getTagList()){
				Element tagElement = tagsElement.addElement("tag");
				tagElement.addText(tag.getTag());
				tagElement.addAttribute("url", tag.getLink());
			}
			
			for(Entity entity : this.getEntityList()){
				Element entityElement = tagsElement.addElement("entity");
				entityElement.addText(entity.getName());
				entityElement.addAttribute("weight", entity.getWeight()+"");
			}
			
			publishedElement.addText(this.getPublished());
			
			out.writeOpen(rootElement);
			out.write(titleElement);
			out.write(authorElement);
			out.write(updateTimeElement);
			out.write(urlElement);
			out.write(summaryElement);
			out.write(tagsElement);
			out.write(entitiesElement);
			
			out.writeClose(rootElement);
			out.endDocument();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void extrcatText(String fileName, String textFileName){
		
		Document doc = XmlHelp.getDocument(fileName);
		Element root = doc.getRootElement();
		Element data = (Element) root.selectSingleNode("//datas");
		String text = data.element("summary").getStringValue();
		FileHelp.writeFile(textFileName, text);
	}

	public org.jsoup.nodes.Document getDoc() {
		return doc;
	}

	public void setDoc(org.jsoup.nodes.Document doc) {
		this.doc = doc;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public static void main(String[] args){
		
		List<String> fileNames = FileHelp.getURLs("36kr.txt");
		for(String url : fileNames){
	//		String url = "http://www.36kr.com/p/97503.html";
			try{
				Crawler crawler2 = new KrCrawler(url);
				crawler2.fetch();
				String newFileName = "D:/panguso/36kr/xml" + url.substring(url.lastIndexOf("/"), url.lastIndexOf("."))+".xml";
				System.out.println(newFileName);
				crawler2.saveFile(newFileName);
			}catch(Exception e){
				e.printStackTrace();
				continue;
			}
		}
	}
}
