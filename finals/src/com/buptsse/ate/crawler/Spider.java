package com.buptsse.ate.crawler;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

public abstract class Spider {

	private String seed;
	private Document doc;
	
	public Spider(String url) {
		try {
			this.doc = Jsoup.connect(url)
					.userAgent("Mozilla/5.0 (Windows NT 6.1; rv:5.0)")
					.cookie("auth", "token").timeout(1000).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	public static void main(String[] args){
		
		
	}
}
