package org.jsoup.examples;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class ListLinks {
    public static void main(String[] args) throws IOException {
    	
        String seed = "http://www.newegg.com.cn";
        String filter = "newegg.com.cn";
        int counter = 1;
        
        System.out.println("Fetching "+ seed);
        Set<String> visitedLinks = new HashSet<String>();
        
        List<String> parentLinks = new ArrayList<String>();
        List<String> childLinks = new ArrayList<String>();
        parentLinks.add(seed);
        Document doc = null;
//        BufferedWriter writer = null;
        File file = new File("newegg.txt");
        BufferedWriter writer = new BufferedWriter(new FileWriter(file));
		
        while(!parentLinks.isEmpty()){
        	
        	for(String url : parentLinks){
            	try{
            		if(visitedLinks.contains(url)){
            			continue;
            		}
            		doc = Jsoup.connect(url).get();
            	}catch(Exception e){
            		e.printStackTrace();
            		continue;
            	}
            	visitedLinks.add(url);
            	
                Elements links = doc.select("a[href]");
                System.out.println("Links:"+ links.size());
                for (Element element : links) {
                	String link = element.attr("abs:href");
                	if(link.contains(filter) && 
                			!link.contains("?") && 
                			!link.contains("help") &&
                			!link.contains("product-reviews"))
                	{
                		childLinks.add(link);
                		writer.write(link + "\n");
                		System.out.println(link);
                		counter++;
                	}
                }
            	
            }
            parentLinks.clear();
            for(String url : childLinks){
            	if(!visitedLinks.contains(url)){
            		parentLinks.add(url);
            	}
            }
            childLinks.clear();
            
            if(visitedLinks.size() > 1000){
            	
            	Iterator<String> ite = visitedLinks.iterator();
            	while(ite.hasNext()){
            		String url=(String) ite.next();
            		System.out.println(url);
            	}
            	writer.close();
            	break;
            }
        }
        
        
    }
 
}
