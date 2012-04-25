package com.xiaoruoen.info.impl;

import org.jsoup.select.Elements;

import com.xiaoruoen.info.Crawler;

public class TechwebCrawler extends Crawler {
	
	public TechwebCrawler(String url) {
		super(url);
	}

	public void fetch() {

		Elements main = doc.body().select("body");
		
		String author = doc.body().select("p.editor").text();
		String blog_title = main.select("div.title>h1").text();
		String published = main.select("span.date").text();
		String blog_content = main.select("div#artibody").html();
	
		this.setPublished(published);
		this.setAuthor(author);
		this.setTitle(blog_title);
		this.setSummary(blog_content);
	}
	
	public static void main(String[] args){
//		http://article.yeeyan.org/list_articles/410?page=3
		
		/*String[] fileNames = new String[1];
		fileNames[0] = "http://article.yeeyan.org/view/286746/267774";
		
		for(String url : fileNames){
			try{
				Crawler crawler2 = new YeeyanCrawler(url);
				crawler2.fetch();
				String newFileName = "D:/panguso/yeeyan/xml" + url.substring(url.lastIndexOf("/"), url.length()-1)+".xml";
				System.out.println(newFileName);
				crawler2.saveFile(newFileName);
			}catch(Exception e){
				e.printStackTrace();
				continue;
			}
		}*/
		
		String url = "http://www.techweb.com.cn/internet/2012-04-24/1183146.shtml";
		Crawler crawler = new TechwebCrawler(url);
		crawler.fetch();
		String newFileName = "D:/panguso/techweb/xml" + url.substring(url.lastIndexOf("/"), url.lastIndexOf("."))+".xml";
		System.out.println(newFileName);
		crawler.saveFile(newFileName);
		/*Elements h3 = crawler.getDoc().select("h5>a[href]");
		for(Element e : h3){
			fileNames.add(e.attr("href"));
			System.out.println(fileNames.size());
		}*/
		
		/*for(int i = 2; i < 14; i++){
			String url = "http://article.yeeyan.org/list_articles/410?page=" + i;
			System.out.println(url);
			
			Crawler crawler2 = new TechwebCrawler(url);
			h3 = crawler2.getDoc().select("h5>a[href]");
			for(Element e : h3){
				fileNames.add(e.attr("href"));
			}
			
		}*/
		
		/*for(String url : fileNames){
			try{
				Crawler crawler2 = new IteyeCrawler(url);
				crawler2.fetch();
				String newFileName = "D:/panguso/yeeyan/xml" + url.substring(url.lastIndexOf("/"), url.length())+".xml";
				System.out.println(newFileName);
				crawler2.saveFile(newFileName);
			}catch(Exception e){
				e.printStackTrace();
				continue;
			}
		}*/
	}
	
}
