package com.buptsse.ate.extractor;

import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.Crawler;

public class KrCrawler extends Crawler {
	
	public KrCrawler(String url) {
		super(url);
	}

	public void fetch() {

		Elements main = doc.body().select("article");
		
		String author = doc.body().select("div.row>div>strong>a").text();
		String blog_title = main.select("h2").text();
		
		main.select("div.alert-box").remove();
		main.select("div.row").remove();
		main.select("h2").remove();
//		main.select("div[]").remove();
		
		String blog_content = main.html();
//		Elements blog_tags = main.select("div.news_tag>a");
//		List<Tag> tags = new ArrayList<Tag>();
		
		/*for(Element e : blog_tags){
			String link = e.attr("href");
			String text = e.text();
			Tag tag = new Tag(link, text);
			tags.add(tag);
		}*/
	
		this.setAuthor(author);
//		this.setTagList(tags);
		this.setTitle(blog_title);
		this.setSummary(blog_content);
	}
	
}
