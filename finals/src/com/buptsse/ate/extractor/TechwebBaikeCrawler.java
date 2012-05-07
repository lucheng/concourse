package com.buptsse.ate.extractor;

import java.io.File;

import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.Crawler;
import com.buptsse.ate.utils.FileHelp;

public class TechwebBaikeCrawler extends Crawler {
	
	public TechwebBaikeCrawler(String url) {
		super(url);
	}
	
	public TechwebBaikeCrawler(File file) {
		super(file);
	}

	public void fetch() {

		Elements main = doc.body().select("body");
		String blog_title = main.select("span#changename").text();
		this.setTitle(blog_title);
		
		/*String author = doc.body().select("p.editor").text();
		String published = main.select("span.date").text();
		String blog_content = main.select("div#artibody").html();
	
		this.setPublished(published);
		this.setAuthor(author);
		this.setSummary(blog_content);
		*/
	}
	
	public static void main(String[] args){
		
		String[] files = FileHelp.getFiles("D:/sites/baike.techweb.com.cn");
//		String[] files = new String[1];
//		files[0] = "D:/sites/baike.techweb.com.cn/doc-view-20535.shtml";
		String title = "";
		for(String url : files){
			if(url.contains("/doc-view-")){
				System.out.println(url);
				Crawler crawler = new TechwebBaikeCrawler(new File(url));
				crawler.fetch();
				if(crawler.getTitle() != null){
					title += crawler.getTitle() + System.getProperty("line.separator");
				}
			}
		}
		System.out.println(title);
		FileHelp.writeFile("input/output/baike.txt", title);
	}
	
}
