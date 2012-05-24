package edu.bupt.spring.test;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.bupt.spring.entity.Page;
import edu.bupt.spring.service.PageService;
import edu.bupt.spring.utils.Parser;


public class UserTest {
	
	private static PageService pageService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
			pageService = (PageService)cxt.getBean("pageServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
	
	@Test
	public void addUser(){
		
		try {
			Page page = Parser.parseXmlFile("\\\\buptsse215-02/data/baidu/1.xml");
			pageService.save(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
