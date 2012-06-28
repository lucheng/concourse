package com.buptsse.ate.extractor;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.ItemParser;
import com.buptsse.ate.crawler.Tag;
import com.buptsse.ate.utils.FileHelp;

public class TechSinaCrawler extends ItemParser {
	
	public TechSinaCrawler(File file, String charset) {
		super(file, charset);
	}

	public TechSinaCrawler(String url) {
		super(url);
	}
	
	public TechSinaCrawler() {
	}

	public void fetch() {

		Elements main = doc.body().select("div.blkContainerSblk");
		String blog_title = main.select("h1#artibodyTitle").text();
		String blog_content = main.select("div#artibody>p").text();
		Elements blog_tags = main.select("div.news_tag>a");
		List<Tag> tags = new ArrayList<Tag>();
		
		for(Element e : blog_tags){
			String link = e.attr("href");
			String text = e.text();
			Tag tag = new Tag(link, text);
			tags.add(tag);
		}
		String publish = main.select("span#pub_date").text();
	
		this.getNewsItem().setAuthor("");
		this.getNewsItem().setPublished(publish);
		this.getNewsItem().setTagList(tags);
		this.getNewsItem().setTitle(blog_title);
		this.getNewsItem().setSummary(blog_content);
	}
	
	public static void main(String[] args){
		
		String strPath = "\\\\buptsse215-02\\data\\sites\\tech.sina.com.cn\\";
		List<String> filelist = new ArrayList<String>();
		FileHelp.refreshFileList(strPath, filelist, ".shtml");
		for(String fileName : filelist){
//		String fileName = "\\\\buptsse215-02\\data\\sites\\tech.sina.com.cn\\i\\2011-07-19\\08045800863.shtml";
	//		TechSinaCrawler crawler = new TechSinaCrawler(new File(fileName), "gb2312");
			TechSinaCrawler crawler = new TechSinaCrawler(new File(fileName), "gb2312");
			crawler.fetch();
			crawler.saveFile("d:/data/sina/"+ System.currentTimeMillis() +".xml", true);
		}
		
	}
	
}
