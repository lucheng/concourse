package com.buptsse.ate.extractor;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.Crawler;
import com.buptsse.ate.utils.FileHelp;

public class It199Crawler extends Crawler {
	
	public It199Crawler(String url) {
		super(url);
	}

	public It199Crawler() {
		// TODO Auto-generated constructor stub
	}

	public void fetch() {

		Elements main = doc.body().select("div.two-third-width");
		
		Elements blog_content = main.select("div.single-content");
		blog_content.select("div.wumii-hook").remove();
		
		String blog_title = main.select("h1").text();
		Elements blog_tags = main.select("p.meta-data>span>a");
//		String author = doc.body().select("div#blog_owner_name").text();
		String published = doc.body().select("p.meta-data>span").first().text();
		
		List<Tag> tags = new ArrayList<Tag>();
		
		for(Element e : blog_tags){
			String link = e.attr("href");
			String text = e.text();
			Tag tag = new Tag(link, text);
			tags.add(tag);
		}
		
	
		this.setAuthor("");
		this.setPublished(published);
		this.setTagList(tags);
		this.setTitle(blog_title);
		this.setSummary(blog_content.html());
	}
	
	public static void main(String[] args){
		
		String url = "http://www.199it.com/archives/34210.html";
		Crawler crawler = new It199Crawler(url);
		String newFileName = "D:/panguso/it199/xml/" + url.substring(url.lastIndexOf("/")+1, url.lastIndexOf("."))+".xml";
		crawler.fetch();
		System.out.println(newFileName);
		crawler.saveFile(newFileName);
		
		/*Crawler crawler = new It199Crawler();
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
