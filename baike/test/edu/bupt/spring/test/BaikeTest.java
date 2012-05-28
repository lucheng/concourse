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


public class BaikeTest {
	
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
			contentService = (ContentService)cxt.getBean("contentServiceImpl");
			linkService = (LinkService)cxt.getBean("linkServiceImpl");
			tagService = (TagService)cxt.getBean("tagServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void addUser(){
		
		for(int i = 1000; i < 2000; i++){
			try {
				Page page = Parser.parseXmlFile("\\\\buptsse215-02/data/baidu/"+ i +".xml");
				pageService.save(page);
				
				for(Reinforce reinforce : page.getReinforces()){
					
					reinforce.setPage(page);
					reinforceService.save(reinforce);
				}
				
				for(Content content : page.getContents()){
					
					content.setPage(page);
					contentService.save(content);
					
					for(Link link : content.getLinks()){
						link.setContent(content);
						linkService.save(link);
					}
					
					for(Tag tag : content.getTags()){
						tag.setContent(content);
						tagService.save(tag);
					}
				}
				
			} catch (Exception e) {
				e.printStackTrace();
				continue;
			}
		}
		
	}

}
