package com.xiaoruoen.info.impl;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.xiaoruoen.info.Crawler;
import com.xiaoruoen.utils.FileHelp;

public class IteyeCrawler extends Crawler {
	
	public IteyeCrawler(String url) {
		super(url);
	}

	public IteyeCrawler() {
		// TODO Auto-generated constructor stub
	}

	public void fetch() {

		Elements main = doc.body().select("div#main");
		String blog_content = main.select("div#blog_content").html();
		String blog_title = main.select("div.blog_title>h3").text();
		Elements blog_tags = main.select("div.news_tag>a");
		List<Tag> tags = new ArrayList<Tag>();
		
		for(Element e : blog_tags){
			String link = e.attr("href");
			String text = e.text();
			Tag tag = new Tag(link, text);
			tags.add(tag);
		}
		String author = doc.body().select("div#blog_owner_name").text();
	
		this.setAuthor(author);
		this.setTagList(tags);
		this.setTitle(blog_title);
		this.setSummary(blog_content);
	}
	
	public static void main(String[] args){
		
		/*Crawler crawler = new IteyeCrawler();
		String[] xmlfiles = FileHelp.getFiles("D:/panguso/36kr/xml");
		for(String fileName : xmlfiles){
			String textFileName = fileName.replace("xml", "txt");
			System.out.println(textFileName);
			crawler.extrcatText(fileName, textFileName);
		}*/
		
		/*List<String> fileNames = new ArrayList<String>();
		
		String url1 = "http://robbin.iteye.com/";
		Crawler crawler2 = new IteyeCrawler(url1);
		Elements h3 = crawler2.getDoc().select("h3>a[href]");
		for(Element e : h3){
			fileNames.add("http://robbin.iteye.com" + e.attr("href"));
		}
		
		for(int i = 2; i < 14; i++){
			String url = "http://robbin.iteye.com/?page=" + i;
			crawler2 = new IteyeCrawler(url);
			h3 = crawler2.getDoc().select("h3>a[href]");
			for(Element e : h3){
				fileNames.add("http://robbin.iteye.com" + e.attr("href"));
			}
		}
		System.out.println(fileNames.size());
		for(String url : fileNames){
			try{
				crawler2 = new IteyeCrawler(url);
				String newFileName = "D:/panguso/iteye/xml/" + url.substring(url.lastIndexOf("/")+1, url.length())+".xml";
				if(new File(newFileName).exists()){
					System.out.println("网页已存在！");
					continue;
				}
				crawler2.fetch();
				
				System.out.println(newFileName);
				crawler2.saveFile(newFileName);
				sleep(3000);
			}catch(Exception e){
				e.printStackTrace();
				try {
					sleep(3000);
				} catch (InterruptedException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				continue;
			}
		}*/
	}
	
}
