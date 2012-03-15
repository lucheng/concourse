package com.buptsse.crawler;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;

import com.buptsse.utils.FileHelp;
import com.liu.core.BrowserMainWindow;
import com.trolltech.qt.gui.QApplication;

public class Test {
	
	public static void getBaidu(String[] args){
		QApplication.initialize(args);
		List<String> urlList = new ArrayList<String>();
		for(int i = 1; i < 99999; i++) {
			urlList.add("http://baike.baidu.com/view/"+ i +".htm");
		}
		BrowserMainWindow ww = new BrowserMainWindow(urlList,"D:/panguso/baidu/","bufanye.js");
		ww.show();
		QApplication.exec();
	}
	
	public static void getHudong(String[] args){
		
		QApplication.initialize(args);
		
		String[] files = FileHelp.getFiles("D:/panguso/hudong");
		System.out.println(files.length);
		List<String> urlList = new ArrayList<String>();
		for(String name : files){
			System.out.println(name);
			File file = new File(name);
			
			try{
				BufferedReader input=new BufferedReader(new FileReader(file)); 
				String text;
				while((text=input.readLine())!=null){
					urlList.add(text);
				}
				
			}catch(Exception ex) {
				ex.printStackTrace();
			}
		}
		BrowserMainWindow ww = new BrowserMainWindow(urlList,"D:/panguso/hudong/page/","bufanye.js");
		ww.show();
		
		QApplication.exec();
	}
	
	public static void main(String[] args) {
//		getBaidu(args);
		getHudong(args);
	}
}

