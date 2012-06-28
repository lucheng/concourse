package com.buptsse.ate.extractor;

import java.io.File;

import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.ItemParser;
import com.buptsse.ate.utils.FileHelp;

public class TechwebBaikeCrawler extends ItemParser {
	
	public TechwebBaikeCrawler(String url) {
		super(url);
	}
	
	public TechwebBaikeCrawler(File file, String charset) {
		super(file, charset);
	}

	public void fetch() {

		Elements main = doc.body().select("body");
		String blog_title = main.select("div#changename").text();
		this.getNewsItem().setTitle(blog_title);
		
		/*String author = doc.body().select("p.editor").text();
		String published = main.select("span.date").text();
		String blog_content = main.select("div#artibody").html();
	
		this.setPublished(published);
		this.setAuthor(author);
		this.setSummary(blog_content);
		*/
	}
	
	public static void main(String[] args){
		
		String[] files = FileHelp.getFiles("d:/sites/baike.techweb.com.cn/doc-view-6795.shtml");
		String title = "";
		for(String url : files){
			if(url.contains("/doc-view-")){
				ItemParser crawler = new TechwebBaikeCrawler(new File(url), "UTF-8");
				crawler.fetch();
				title += crawler.getNewsItem().getTitle() + System.getProperty("line:separator");
			}
		}
		
		FileHelp.writeFile("output\baike.txt", title);
	}
	
}
