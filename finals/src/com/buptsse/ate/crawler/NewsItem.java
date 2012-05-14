package com.buptsse.ate.crawler;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.dom4j.Document;
import org.dom4j.Element;

import com.buptsse.ate.utils.Constant;
import com.buptsse.ate.utils.XmlHelp;

public class NewsItem {
	
	private static Logger logger = Logger.getLogger(NewsItem.class);

	protected String url;
	protected String title;
	protected String keyword;
	protected String description;
	protected String author;
	protected String source;
	protected String published;
	protected long updateTime;
	protected String summary;
	protected List<Tag> tagList;
	protected List<Relation> relationList;
	protected List<Entity> entityList;
	
	public NewsItem(){
		PropertyConfigurator.configure(Constant.LOG4J);
	}
	
	public static void main(String[] args){
		
		String fileName = "D:/data/xml/tech2ipo.com/9/index.xml";
		NewsItem item;
		try {
			item = new NewsItem(fileName);
			logger.info(item.title);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public NewsItem(String filePath) throws Exception{
		
		PropertyConfigurator.configure(Constant.LOG4J);
		
		Document doc = XmlHelp.getDocument(filePath);
		Element root = doc.getRootElement();
		Element data = (Element) root.selectSingleNode("//datas");
		this.title = data.selectSingleNode(".//title").getStringValue();
		this.keyword = data.selectSingleNode(".//keyword").getStringValue();
		this.description = data.selectSingleNode(".//description").getStringValue();
		this.author = data.selectSingleNode(".//author").getStringValue();
		this.source = data.selectSingleNode(".//source").getStringValue();
		this.published = data.selectSingleNode(".//published").getStringValue();
		this.url = data.selectSingleNode(".//url").getStringValue();
		this.summary = data.selectSingleNode(".//summary").getStringValue();
		
		logger.info(title);
		
		List<Element> tags = data.selectNodes(".//tag");
		
		for(Element element :  tags){
//			tagList.add(index, element);
		}
		this.relationList = data.selectNodes(".//relation");
		
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
	
	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public List<Relation> getRelationList() {
		return relationList;
	}

	public void setRelationList(List<Relation> relationList) {
		this.relationList = relationList;
	}

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
}
