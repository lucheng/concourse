package com.buptsse.ate.extractor;

import java.util.ArrayList;
import java.util.List;

import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.Crawler;

public class IteyeCrawler extends Crawler {
	
	public IteyeCrawler(String url) {
		super(url);
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
	
}
