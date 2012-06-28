package com.buptsse.ate.extractor;

import java.io.File;

import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.ItemParser;
import com.buptsse.ate.utils.FileHelp;

public class KrCrawler extends ItemParser {
	
	public KrCrawler(String url) {
		super(url);
	}

	public KrCrawler(File file, String charset) {
		super(file, charset);
	}
	public void fetch() {

		Elements main = doc.body().select("article");
		
		String author = doc.body().select("div.row>div>strong>a").text();
		String published = doc.body().select("div.row>div>strong").get(1).text();
		String blog_title = main.select("h2").text();
		
		main.select("div.alert-box").remove();
		main.select("div.row").remove();
		main.select("h2").remove();
		
		String blog_content = main.text();
	
		this.getNewsItem().setAuthor(author);
		this.getNewsItem().setTitle(blog_title);
		this.getNewsItem().setPublished(published);
//		System.out.println(blog_content);
		this.getNewsItem().setSummary(blog_content);
	}
	
	public static void main(String[] args){
		
		String[] fileNames = FileHelp.getFiles("D:/data/sites/www.36kr.com/p");
		for(String url : fileNames){
			try{
				ItemParser crawler2 = new KrCrawler(new File(url), "UTF-8");
				crawler2.fetch();
				String newFileName = "D:/data/xml/www.36kr.com" + url.substring(url.lastIndexOf("/"), url.lastIndexOf("."))+".xml";
				System.out.println(url);
				crawler2.saveFile(newFileName, true);
//				crawler2.saveText(newFileName);
			}catch(Exception e){
				e.printStackTrace();
				continue;
			}
		}
	}
	
}
