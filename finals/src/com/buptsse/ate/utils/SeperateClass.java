package com.buptsse.ate.utils;

import java.io.File;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;


public class SeperateClass {
	
	public static void main(String[] args) {
		
		try {
			
			String[] files = FileHelp.getFiles("D:/panguso/baidu/class");
			for(String fileName : files){
				
				File input = new File(fileName);
				if(!input.exists()){
					continue;
				}
				Document doc = Jsoup.parse(input, "UTF-8");
				Elements codes = doc.body().select("fieldset");
				
				Elements title = codes.select("span[class=Tit]");
//				Elements a = codes.select("a");
				System.out.println(title.text());
//				System.out.println(a.text());
				
				Elements code = doc.body().select("td[class=f14]");
				System.out.println(code.text());
//				FileHelp.writeFile("D:/panguso/baidu/category/"+ i +".html", codes.toString());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}

