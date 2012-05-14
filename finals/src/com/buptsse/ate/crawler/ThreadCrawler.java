package com.buptsse.ate.crawler;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.buptsse.ate.utils.FileHelp;

public class ThreadCrawler extends Thread {

	private Document doc;
	private static int counter = 0;
	
	public static synchronized int getCounter(){
		return ++counter;
	}
	public void fetch(String url, String saveFileName){
		
		if(new File(saveFileName).exists()){
			System.out.println("网页已存在！");
			return;
		}
		
		try {
			this.doc = Jsoup.connect(url)
					.userAgent("Mozilla/5.0 (Windows NT 6.1; rv:5.0)")
					.cookie("auth", "token").timeout(1000).get();
			
			String title = doc.body().select("h1[class=title]").text();
			if(title.equals("")){
				System.out.println("网页不存在！");
				return;
			}
			System.out.println("网页已保存：" + saveFileName);
			FileHelp.writeFile(saveFileName, doc.html());
		} catch (IOException e) {
//			e.printStackTrace();
		}
	}
	
	public static void main(String[] args){
		
		List<ThreadCrawler> list = new ArrayList<ThreadCrawler>();
		for(int i = 0; i < 5; i++){
			ThreadCrawler crawler = new ThreadCrawler();
			list.add(crawler);
		}
		
		for(ThreadCrawler crawler : list){
			crawler.start();
		}
		
	}
	@Override
	public void run() {
		
		while(true){
			int num = getCounter();
			String savePath = "\\\\buptsse215-02/data/html/";
			String url = "http://baike.baidu.com/view/"+ num +"/.htm";
			
			try{
				String newFileName = savePath+ num +".htm";
				fetch(url, newFileName);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	}
}
