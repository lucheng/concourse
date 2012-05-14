package com.buptsse.ate.nlp;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.buptsse.ate.crawler.Entity;
import com.buptsse.ate.crawler.NewsItem;
import com.buptsse.ate.crawler.Relation;
import com.buptsse.ate.crawler.Tag;
import com.buptsse.ate.extractor.Tech2ipoCrawler;
import com.buptsse.ate.utils.Constant;

import edu.fudan.nlp.keyword.Extractor;
import edu.fudan.nlp.keyword.WordExtract;

public class EntityWeightComputer {

	private static Logger logger = Logger.getLogger(EntityWeightComputer.class);
	
	public EntityWeightComputer(){
		PropertyConfigurator.configure(Constant.LOG4J);
	}
	
	public void comput(NewsItem item){
		
		List<Entity> entityList = new ArrayList<Entity>();
		
		List<Tag> tags = item.getTagList();
		String keyword = item.getKeyword();
		String description = item.getDescription();
		
		List<Relation> relationList = item.getRelationList();
		String title = item.getTitle();
		
		String summary = item.getSummary();
		

		for(Tag tag : tags){
			entityList.add(new Entity(tag.getTag(), 2));
		}
		
		try {
			Extractor key = new WordExtract("models/seg.c7.110918.gz","models/stopwords");
			logger.info(key.extract(summary, 100,true));
			logger.info(key.extract(title, 100,true));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		for(Entity entity : entityList){
			
			entity.setWeight(10);
		}
		
		item.setEntityList(entityList);
	}
	
	public static void main(String[] args){
		
		Tech2ipoCrawler crawler = new Tech2ipoCrawler();
		String fileName = "D:\\data\\sites\\tech2ipo.com\\463\\index.html";
		crawler.setFile(new File(fileName));
		crawler.fetch();
		crawler.getNewsItem().setSource("Tech2IPO");
		logger.info(fileName);
		crawler.saveFile(fileName.replace("sites", "xml").replace(".html", ".xml"), true);
		
	}
	
}
