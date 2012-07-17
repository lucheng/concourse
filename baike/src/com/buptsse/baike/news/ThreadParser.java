package com.buptsse.baike.news;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.buptsse.baike.module.Page;
import com.buptsse.baike.utils.FileHelp;
import com.buptsse.baike.utils.Parser;

public class ThreadParser extends Thread {

	private static int counter = 39695;
	
	public static synchronized int getCounter(){
		return ++counter;
	}
	
	public static void main(String[] args){
		
		List<ThreadParser> list = new ArrayList<ThreadParser>();
		for(int i = 0; i < 10; i++){
			ThreadParser crawler = new ThreadParser();
			list.add(crawler);
		}
		
		for(ThreadParser crawler : list){
			crawler.start();
		}
		
	}
	@Override
	public void run() {
		
//		String basePath = "\\\\buptsse215-02/";
		String basePath = "d:/";
		
		while(true){
			int num = getCounter();
			String savePath = basePath + "data/html/";
			String fileName = savePath+ num +".htm";
			
			String xmlFile = basePath + "data/baike/" +(int) (num / 5000) + "/" + num + ".xml";
			
			try{
				
				File file = new File(fileName);
				if(file.exists()){
					Page page = new Page(file);
					Parser parser = new Parser();
					parser.saveAsXml(page, xmlFile);
				}
			}catch(Exception e){
				e.printStackTrace();
				FileHelp.writeFile(basePath + "data/error/" + num + ".txt", "eee");
			}
		}
	}
}
