package com.buptsse.ate.extractor;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.ItemParser;
import com.buptsse.ate.crawler.Tag;
import com.buptsse.ate.utils.FileHelp;

public class TechwebCrawler extends ItemParser {
	
	public TechwebCrawler(String url) {
		super(url);
	}

	public TechwebCrawler(File file) {
		super(file);
	}
	public void fetch() {

		Elements main = doc.body().select("body");
		
		String author = doc.body().select("p.editor").text();
		
		String blog_title = main.select("div.title>h1").text();
		String published = main.select("span.date").text();
		String blog_content = main.select("div#artibody").text();
		
		Elements blog_tag = main.select("div.nav_center>a");
		List<Tag> tagList = new ArrayList<Tag>();
		for(Element element : blog_tag){
			tagList.add(new Tag(element.attr("href"),element.text()));
		}
	
		this.getNewsItem().setPublished(published);
		this.getNewsItem().setAuthor(author);
		this.getNewsItem().setTitle(blog_title);
		this.getNewsItem().setSummary(blog_content);
		this.getNewsItem().setTagList(tagList);
	}
	
	public static void main(String[] args){

		String filePath = "D:/data/sites/www.techweb.com.cn";
		List<String> filelist = new ArrayList<String>();

		FileHelp.refreshFileList(filePath, filelist, ".shtml");
		for(String fileName : filelist){
			try{
				TechwebCrawler crawler = new TechwebCrawler(new File(fileName));
				crawler.fetch();
				String name = fileName.substring(fileName.lastIndexOf("\\")+1, fileName.lastIndexOf("."));
				System.out.println(name);
//				System.out.println(fileName);
				crawler.saveFile("D:/data/xml/www.techweb.com.cn/" + name + ".xml", true);
			}catch(Exception e){
				continue;
			}
		}
	}
	
}
