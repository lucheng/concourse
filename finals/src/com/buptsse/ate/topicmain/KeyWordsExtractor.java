package com.buptsse.ate.topicmain;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.buptsse.ate.module.Content;
import com.buptsse.ate.module.Link;
import com.buptsse.ate.module.Page;
import com.buptsse.ate.module.Reinforce;
import com.buptsse.ate.utils.Constant;
import com.buptsse.ate.utils.FileHelp;
import com.buptsse.ate.utils.Parser;


/**
 * 关键词抽取
 * 
 */

public class KeyWordsExtractor {

	private static String filePath = "D:/panguso/baidu/xmltest/";
	private static String preUrl = "http://baike.baidu.com";
	
	private Map<String, Integer> singleTermMap = null;
	private Map<String, Integer> bigramTermMap = null;
	private Map<String, Integer> trigramTermMap = null;
	
	private Logger log = Logger.getLogger(getClass());
	
	private Page page = null;
	
	public KeyWordsExtractor(){
		PropertyConfigurator.configure(Constant.LOG4J);
	}
	//对文件进行预处理，下载相关的文件
	public void pretreatment(String url){
		
		String baikeId = url.substring(url.lastIndexOf("/")+1 , url.lastIndexOf("."));
		
		String fileName = filePath + baikeId +".xml";
		log.info(fileName);
		
		File file = new File(fileName);
		
		if(!file.exists()){
			page = new Page(url);
			Parser.saveAsXml(page, filePath + baikeId +".xml");
		} else {
			page = Parser.parseXmlFile(fileName);
		}
		
		if(page == null){
			log.info("文件出现错误！");
			return;
		}
	}
	
	private List<Link> getContentLinks(Content content){
		
		List<Link> links = new ArrayList<Link>();
		List<Link> linkList = content.getLinks();
		for(Link link : linkList){
			if(link.getUrl().startsWith("/view/")){
				System.out.println(link.getText() + link.getUrl());
				links.add(link);
			}
			
		}
		return links;
	}
	
	private List<Reinforce> getReinforce(){
		
		List<Reinforce> reinforces = new ArrayList<Reinforce>();
		List<Reinforce> reinforceList = page.getReinforces();
		for(Reinforce reinforce : reinforceList){
			System.out.println(reinforce.getText() + reinforce.getUrl());
			reinforces.add(reinforce);
		}
		return reinforces;
	}
	
	/*private int getTags(Content content, Content dest){
		content.getTaglist();
	}*/

	public void getWordsFrequency() throws IOException{
		
		String text = page.getContents().get(0).getText();
		text.replaceAll("编辑本段", "");
		FileHelp.writeFile("input/input/" + page.getBaibeId() + ".txt", text);
		// 对训练文本进行分词处理，生成res文件
		String inputTrainPath = "input/input";   // 训练文本的输入路径
		String outputTrainPath = "input/output";  // 训练文本的输出路径
		ATE ate = new ATE();
		ate.pretreatmentTrain(inputTrainPath, outputTrainPath); // 分词
		
		log.info(page.getTitle());
		singleTermMap = ate.getSingleTermMap();
		bigramTermMap = ate.getBigramTermMap();
		trigramTermMap = ate.getTrigramTermMap();
		
		int[] array = new int[singleTermMap.size()];
		int pos = 0;
		for(String key : singleTermMap.keySet()){
			array[pos] = singleTermMap.get(key);
			pos++;
		}
		HeapSort hsort = new HeapSort();
		hsort.HeapSorting(array);
		
		for(String key : singleTermMap.keySet()){
			if(singleTermMap.get(key) > array[8]){
				log.info(key);
			}
		}
		
		array = new int[bigramTermMap.size()];
		pos = 0;
		for(String key : bigramTermMap.keySet()){
			array[pos] = bigramTermMap.get(key);
			pos++;
		}
		hsort = new HeapSort();
		hsort.HeapSorting(array);
		
		for(String key : bigramTermMap.keySet()){
			if(bigramTermMap.get(key) > array[8]){
				log.info(key);
			}
		}
		
		array = new int[trigramTermMap.size()];
		pos = 0;
		for(String key : trigramTermMap.keySet()){
			array[pos] = trigramTermMap.get(key);
			pos++;
		}
		hsort = new HeapSort();
		hsort.HeapSorting(array);
		
		for(String key : trigramTermMap.keySet()){
			if(trigramTermMap.get(key) > array[8]){
				log.info(key);
			}
		}
	}
	public static void main(String[] args) throws IOException {

		String url = "http://baike.baidu.com/view/1538.htm";
		KeyWordsExtractor test = new KeyWordsExtractor();
		test.pretreatment(url);
		List<Link> links = test.getContentLinks(test.getPage().getContents().get(0));
		for(Link link : links){
			test.pretreatment(preUrl + link.getUrl());
		}
		
		test.getReinforce();
//		test.getWordsFrequency();
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

}
