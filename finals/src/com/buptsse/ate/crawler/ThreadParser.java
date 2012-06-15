package com.buptsse.ate.crawler;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import com.buptsse.ate.module.Page;
import com.buptsse.ate.utils.FileHelp;
import com.buptsse.ate.utils.Parser;

public class ThreadParser extends Thread {

	private static int counter = 2236746;
	
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
		
		while(true){
			int num = getCounter();
			String savePath = "\\\\buptsse215-02/data/html/";
			String errorPath = "\\\\buptsse215-02/data/error/";
			String fileName = savePath+ num +".htm";
			String xmlFile = fileName.replace("html", "baike").replace(".htm", ".xml");
			try{
				
				File file = new File(fileName);
				if(file.exists()){
					Page page = new Page(file);
					Parser parser = new Parser();
					parser.saveAsXml(page, xmlFile);
				}
			}catch(Exception e){
				e.printStackTrace();
				FileHelp.writeFile(errorPath + num +".txt", "eee");
			}
		}
	}
}
