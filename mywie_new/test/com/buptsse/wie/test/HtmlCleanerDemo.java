package com.buptsse.wie.test;
import java.io.File;  
  
import org.htmlcleaner.HtmlCleaner;  
import org.htmlcleaner.TagNode;  
  
/** 
 * htmlcleaner ʹ��ʾ��. 
 * 
 * @author chenlb 2008-11-26 ����02:12:02 
 */  
public class HtmlCleanerDemo {  
  
    public static void main(String[] args) throws Exception { 
    	
    	String fileName = "C:/Users/Administrator/Desktop/other/example/http---news-sina-com-cn-c-2005-12-07-16438517687-shtml-1.html";
    	
        HtmlCleaner cleaner = new HtmlCleaner();  
  
        TagNode node = cleaner.clean(new File(fileName), "GBK");  
        //��tagȡ.  
        Object[] ns = node.getElementsByName("title", true);    //����  
  
        if(ns.length > 0) {  
            System.out.println("title="+((TagNode)ns[0]).getText());  
        }  
        System.out.println("ul/li:");  
        //��xpathȡ  
        ns = node.evaluateXPath("//div[@class='d_1']//li");  
        for(Object on : ns) {  
            TagNode n = (TagNode) on;  
            System.out.println("\ttext="+n.getText());  
        }  
        System.out.println("a:");  
        //������ֵȡ  
        ns = node.getElementsByAttValue("name", "my_href", true, true);  
        for(Object on : ns) {  
            TagNode n = (TagNode) on;  
            System.out.println("\thref="+n.getAttributeByName("href")+", text="+n.getText());  
        }  
    }  
}  