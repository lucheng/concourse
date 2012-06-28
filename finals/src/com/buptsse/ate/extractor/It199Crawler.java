package com.buptsse.ate.extractor;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.ItemParser;
import com.buptsse.ate.crawler.Tag;
import com.buptsse.ate.utils.FileHelp;

public class It199Crawler extends ItemParser {
	
	public It199Crawler(String url) {
		super(url);
	}
	
	public It199Crawler(File file, String charset) {
		super(file, charset);
	}

	public void fetch() {

		Elements main = doc.body().select("div#contentArea");
		
		Elements blog_content = main.select("div.postContent");
		blog_content.select("div.wumii-hook").remove();
		
		String blog_title = main.select("h2").text();
		Elements blog_tags = main.select("span.postCategories");
//		String author = doc.body().select("div#blog_owner_name").text();
		String published = "";
		if(doc.body().select("p.meta-data>span").first() != null){
			published = doc.body().select("p.meta-data>span").first().text();
		}else {
			published = "";
		}
		
		
		List<Tag> tags = new ArrayList<Tag>();
		
		for(Element e : blog_tags){
			String link = e.attr("href");
			String text = e.text();
			Tag tag = new Tag(link, text);
			tags.add(tag);
		}
		
		this.getNewsItem().setAuthor("");
		this.getNewsItem().setPublished(published);
		this.getNewsItem().setTagList(tags);
		this.getNewsItem().setTitle(blog_title);
		this.getNewsItem().setSummary(blog_content.text());
	}
	
	public static void main(String[] args){
		
//		String strPath = "\\\\buptsse215-02\\data\\sites\\www.199it.com\\archives";
		String strPath = "d:\\data\\sites\\www.199it.com\\archives\\";
		List<String> urlList = new ArrayList<String>();
		FileHelp.refreshFileList(strPath, urlList, "");
		for(String url : urlList){
//			String url = "http://www.199it.com/archives/34210.html";
			System.out.println(url);
			ItemParser crawler = new It199Crawler(new File(url), "UTF-8");
			String newFileName = "D:/data/xml/www.199it.com/" + url.substring(url.lastIndexOf("\\")+1, url.lastIndexOf("."))+".xml";
			crawler.fetch();
			
			System.out.println(crawler);
			crawler.saveFile(newFileName,true);
		}
	}
	
}
