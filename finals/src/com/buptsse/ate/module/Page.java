package com.buptsse.ate.module;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Page {
	
	private String title;
	private String baibeId;
	private String html;
	private String url;
	private List<Content> contents = new ArrayList<Content>();
	private Map<String, String> reinforce = new HashMap<String, String>();
	private Document doc;
	
	public Page(String url){
		try {
			this.doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 6.1; rv:5.0)").cookie("auth", "token").timeout(1000).get();
			this.url = url;
			formByXml();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Page(){
		
	}

	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}

	public List<Content> getContents() {
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}

	public Map<String, String> getReinforce() {
		return reinforce;
	}

	public void setReinforce(Map<String, String> reinforce) {
		this.reinforce = reinforce;
	}
	
	public String getHtml() {
		return html;
	}


	public void setHtml(String html) {
		this.html = html;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getBaibeId() {
		return baibeId;
	}

	public void setBaibeId(String baibeId) {
		this.baibeId = baibeId;
	}

	private void formByXml(){
			
		Elements codes = doc.body().select("body");
		
		//标题
		Elements title = codes.select("h1[class=title]");
		this.title = title.text();
		
		//源码
		Elements htmlElement = codes.select("div[class=content-bd main-body]");
		this.setHtml(htmlElement.html());
		
		int contentSize  = codes.select("div[id^=sec-content]").size();
		for(int i = 0; i < contentSize; i++){
			
			Content content = new Content();
			
			//副标题
			String subTitle = codes.select("div[id=sec-header"+ i +"]").text();
			content.setSubTitle(subTitle);
			
			//内容
			Elements textElement = codes.select("div[id=sec-content"+ i +"]");
			content.setText(textElement.text());
			
			//内容链接
			Elements links = textElement.select("a[href]");
//			System.out.println(links.size());
			Map<String, String> linkMap = new HashMap<String, String>();
			for(Element element : links){
				linkMap.put(element.text(), element.select("a[href]").attr("href"));
			}
			content.setLinks(linkMap);
			//开放分类
			List<String> taglist = new ArrayList<String>();
			Elements tags = textElement.select("dl[id=viewExtCati]>dd>a");
			for(Element element : tags){
				taglist.add(element.text());
			}
			content.setTaglist(taglist);
			contents.add(content);
		}
		//相关词条
		Elements reinforce = codes.select("dd[class=relative]").select("a[href]");
		int reinforceSize = reinforce.size();
		for(int i = 0; i < reinforceSize; i++){
			this.reinforce.put(reinforce.get(i).text(), reinforce.get(i).attr("href"));
		}
	}

	
	public static void main(String[] args) {
		
//		Page page = new Page(new File("D:/panguso/baidu/page/http---baike-baidu-com-view-210-htm-1.html"));
//		Page page = new Page("http://baike.baidu.com/view/2653231.htm");
//		Page page = new Page("http://baike.baidu.com/view/1719.htm");
//		page.saveAsXml("D:/panguso/baidu/page/2653231.xml");
	}
}

