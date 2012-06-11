package com.buptsse.ate.nlp;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.buptsse.ate.crawler.Entity;
import com.buptsse.ate.crawler.NewsItem;
import com.buptsse.ate.crawler.Relation;
import com.buptsse.ate.crawler.Tag;
import com.buptsse.ate.extractor.Tech2ipoCrawler;
import com.buptsse.ate.utils.Constant;

public class EntityWeightComputer {

	private Logger logger = Logger.getLogger(getClass());
	
	private List<Entity> entityList = new ArrayList<Entity>();
	private SegmentParser segmentParser = new SegmentParser();
	private Map<String, Integer> weightMap = new HashMap<String, Integer>();
	
	
	final public static int TAG = 5;
	final public static int TITLE = 4;
	final public static int RELATION_TITLE = 3;
	final public static int CONTENT = 1;
//	final public static int KEYWORD = 3;
//	final public static int DESCRIPTION = 4;
	
	public EntityWeightComputer(){
		
	}
	
	public void compute(NewsItem item) throws Exception{
		
		List<Tag> tags = item.getTagList();
		String title = item.getTitle();
//		String keyword = item.getKeyword();
//		String description = item.getDescription();
		String summary = item.getSummary();
		List<Relation> relationList = item.getRelationList();
		
		for(Tag tag : tags){
			logger.info(tag.getTag());
			merge(segmentParser.singleProcess(tag.getTag(), TAG));
		}
		
//		logger.info(title);
		merge(segmentParser.singleProcess(title, TITLE));
		
		merge(segmentParser.singleProcess(summary, CONTENT));
		
		merge(segmentParser.singleProcess(summary, CONTENT));
		
		for(Relation relation : relationList){
			merge(segmentParser.singleProcess(relation.getTitle(), RELATION_TITLE));
		}
		
//		logger.info(keyword);
//		extract(keyword, KEYWORD);
//		extract(description, DESCRIPTION);
//		extract(summary, CONTENT);
		
		item.setEntityList(entityList);
	}
	
	private void merge(Map<String, Integer> map) {
		
		for(String key : map.keySet())
		if(weightMap.get(key) == null){
			weightMap.put(key, map.get(key));
		}else {
			weightMap.put(key, (weightMap.get(key)+map.get(key)));
		}
	}
	
	public static void main(String[] args){
		
		Tech2ipoCrawler crawler = new Tech2ipoCrawler();
		String fileName = "D:\\data\\sites\\tech2ipo.com\\463\\index.html";
		crawler.setFile(new File(fileName));
		crawler.fetch();
		crawler.getNewsItem().setSource("Tech2IPO");
		NewsItem item = crawler.getNewsItem();
		
		EntityWeightComputer computer = new EntityWeightComputer();
		try {
			computer.compute(item);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Integer> map = computer.weightMap;
		for(String key : map.keySet()){
			System.out.println(key + "--" + map.get(key));
		}
//		crawler.saveFile(fileName.replace("sites", "xml").replace(".html", ".xml"), true);
	}
	
}
