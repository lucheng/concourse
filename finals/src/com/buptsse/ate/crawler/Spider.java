package com.buptsse.ate.crawler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.buptsse.ate.utils.FileHelp;

public class Spider {

	private String seed;
	private Document doc;
	private Element root;
	private List<String> links = new ArrayList<String>();
	
	
	/*public Spider(String url) {
		
	}*/

	public List<String> getLinks() {
		return links;
	}

	public void setLinks(List<String> links) {
		this.links = links;
	}

	public void init(String seed){
		
		try {
			this.doc = Jsoup.connect(seed)
					.userAgent("Mozilla/5.0 (Windows NT 6.1; rv:5.0)")
					.cookie("auth", "token").timeout(1000).get();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void crawl(){
		Elements articles = doc.select("article>h3>a[href]");
		for(Element e : articles){
			links.add(e.attr("href"));
		}
	}
	public static void main(String[] args){
		
		String seed = null;
		Spider spider = new Spider();
		for(int i = 2; i < 27; i++){
			seed = "http://www.36kr.com/page/" + i;
			System.out.println(seed);
			spider.init(seed);
			spider.crawl();
		}
		List<String> links = spider.getLinks();
		String allLinks = "";
		for(String link : links){
			allLinks += link + System.getProperty("line.separator");
		}
		
		FileHelp.writeFile("36kr.txt", allLinks);
	}
}
