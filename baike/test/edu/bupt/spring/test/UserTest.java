package edu.bupt.spring.test;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.bupt.spring.entity.Content;
import edu.bupt.spring.entity.Link;
import edu.bupt.spring.entity.Page;
import edu.bupt.spring.entity.Reinforce;
import edu.bupt.spring.entity.Tag;
import edu.bupt.spring.service.ContentService;
import edu.bupt.spring.service.LinkService;
import edu.bupt.spring.service.PageService;
import edu.bupt.spring.service.ReinforceService;
import edu.bupt.spring.service.TagService;
import edu.bupt.spring.utils.Parser;


public class UserTest {
	
	private static PageService pageService;
	private static ReinforceService reinforceService;
	private static ContentService contentService;
	private static TagService tagService;
	private static LinkService linkService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			ApplicationContext cxt = new ClassPathXmlApplicationContext("applicationContext.xml");
			pageService = (PageService)cxt.getBean("pageServiceImpl");
			reinforceService = (ReinforceService)cxt.getBean("reinforceServiceImpl");
			contentService = (ContentService)cxt.getBean("pageServiceImpl");
			linkService = (LinkService)cxt.getBean("linkServiceImpl");
			tagService = (TagService)cxt.getBean("tagServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
		

	}
	
	@Test
	public void addUser(){
		
		try {
			Page page = Parser.parseXmlFile("\\\\buptsse215-02/data/baidu/1.xml");
			
			/*for(Reinforce reinforce : page.getReinforces()){
				reinforceService.save(reinforce);
			}
			
			for(Content content : page.getContents()){
				
				for(Link link : content.getLinks()){
					linkService.save(link);
				}
				
				for(Tag tag : content.getTags()){
					tagService.save(tag);
				}
				contentService.save(content);
			}*/
			
			
			pageService.save(page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
