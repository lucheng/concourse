package com.mywie.test;

import static org.junit.Assert.fail;

import java.io.File;

import org.dom4j.Document;
import org.junit.Test;

import com.mywie.control.Extracter;
import com.mywie.control.Generater;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class HtmlTest {

	@Test
	public void testCleanHtml() {
		Document doc = XmlHelp.cleanHtml("E:/data mining/递交文档/FINAL/文本文档/news_test/163/category/pages/http---news-163-com-domestic--1.html");
		if(doc == null){
			fail("test fail!");
		}
	}
	
	@Test
	public void testMakeDir() {
		
		try{
			FileHelp.makedir("E:/datatest");
		}catch(Exception e){
			fail("test fail!");
		}
	}
	
	@Test
	public void testCopyFile() {
		
		try{
			FileHelp.copyFile(new File("E:/data mining/递交文档/FINAL/文本文档/news_test/163/category/pages/http---news-163-com-domestic--1.html"), new File("E:/datatest/copy.html"));
		}catch(Exception e){
			fail("test fail!");
		}
	}
	
	@Test
	public void testGenerater() {
		
		try{
			Generater generater = new Generater("E:/data mining/递交文档/FINAL/文本文档/news_test/163/category/pages", 0.85);
			int tempNum = generater.generateTemplates();
		}catch(Exception e){
			fail("test fail!");
		}
	}
	
	@Test
	public void testExtracterer() {
		
		String templateFile = "C:/Users/Administrator/Desktop/360/template/template.html";
		String extractDir = "C:/Users/Administrator/Desktop/360/1";
		String[] extractFiles = FileHelp.getFiles(extractDir);
		Extracter extractFile = new Extracter(templateFile);
		
		try{
			for(String extractFileName : extractFiles){
				
				System.out.println("extractFileName:" + extractFileName);
				System.out.println("extractData:" + extractFile.extract(extractFileName));
			}
		}catch(Exception e){
			fail("test fail!");
		}
	}
}
