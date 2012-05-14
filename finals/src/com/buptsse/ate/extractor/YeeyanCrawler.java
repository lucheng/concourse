package com.buptsse.ate.extractor;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.ItemParser;

public class YeeyanCrawler extends ItemParser {
	
	public YeeyanCrawler(String url) {
		super(url);
	}

	public void fetch() {

		Elements main = doc.body().select("body");
		
		String author = doc.body().select("h2#user_info>a.align-left").text();
		String blog_title = main.select("h1").text();
		
		String blog_content = main.select("div#conBox").html();
	
		this.getNewsItem().setAuthor(author);
		this.getNewsItem().setTitle(blog_title);
		this.getNewsItem().setSummary(blog_content);
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
		
		List<String> fileNames = new ArrayList<String>();
		
		String url1 = "http://article.yeeyan.org/list_articles/410";
		ItemParser crawler = new YeeyanCrawler(url1);
		Elements h3 = crawler.getDoc().select("h5>a[href]");
		for(Element e : h3){
			fileNames.add(e.attr("href"));
			System.out.println(fileNames.size());
		}
		
		for(int i = 2; i < 14; i++){
			String url = "http://article.yeeyan.org/list_articles/410?page=" + i;
			System.out.println(url);
			
			ItemParser crawler2 = new YeeyanCrawler(url);
			h3 = crawler2.getDoc().select("h5>a[href]");
			for(Element e : h3){
				fileNames.add(e.attr("href"));
			}
			
		}
		
		for(String url : fileNames){
			try{
				ItemParser crawler2 = new IteyeCrawler(url);
				crawler2.fetch();
				String newFileName = "D:/panguso/yeeyan/xml" + url.substring(url.lastIndexOf("/"), url.length())+".xml";
				System.out.println(newFileName);
				crawler2.saveFile(newFileName,true);
			}catch(Exception e){
				e.printStackTrace();
				continue;
			}
		}
	}
	
}
