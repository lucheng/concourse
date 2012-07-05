package com.citgee.webclip;

import java.io.File;
import java.io.IOException;

import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.PrettyXmlSerializer;
import org.htmlcleaner.TagNode;

public class HtmlClean {  
  
	public static void main(String[] args){
		String htmlurl="D:/data/test1/rjxTest/http---business-sohu-com-20120209-n334159137-shtml-1.html";
		String xmlurl = "D:/data/test1/rjxTest/a.xml";
		cleanHtml(htmlurl, xmlurl);
	}
    public static void cleanHtml(String htmlurl, String xmlurl) {  
        try {  
            long start = System.currentTimeMillis();  
  
            HtmlCleaner cleaner = new HtmlCleaner();  
            CleanerProperties props = cleaner.getProperties();  
            props.setUseCdataForScriptAndStyle(true);  
            props.setRecognizeUnicodeChars(true);  
            props.setUseEmptyElementTags(true);  
            props.setAdvancedXmlEscape(true);  
            props.setTranslateSpecialEntities(true);  
            props.setBooleanAttributeValues("empty");  
  
            TagNode node = cleaner.clean(new File(htmlurl));  
  
            System.out.println("vreme:" + (System.currentTimeMillis() - start));  
  
            new PrettyXmlSerializer(props).writeXmlToFile(node, xmlurl);  
  
            System.out.println("vreme:" + (System.currentTimeMillis() - start));  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
}  
