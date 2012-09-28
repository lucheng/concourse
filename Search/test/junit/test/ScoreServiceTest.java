package junit.test;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.bupt.spring.entity.Alias;
import edu.bupt.spring.entity.Article;
import edu.bupt.spring.entity.Relation;
import edu.bupt.spring.entity.Score;
import edu.bupt.spring.service.AliasService;
import edu.bupt.spring.service.ArticleService;
import edu.bupt.spring.service.ScoreService;


public class ScoreServiceTest {
	
	private static ScoreService scoreService;
	private static ArticleService articleService;
	private static AliasService aliasService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			AbstractApplicationContext cxt = new ClassPathXmlApplicationContext("spring-applicationContext.xml");
			scoreService = (ScoreService)cxt.getBean("scoreServiceImpl");
			articleService = (ArticleService)cxt.getBean("articleServiceImpl");
			aliasService = (AliasService)cxt.getBean("aliasServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/*@Test
	public void testFind() {
		
		Alias alias = aliasService.findByTitle("英特尔");
    	
    	System.out.println(alias.getTitle());
    	List<Alias> aliases = scoreService.findRelatedAlias(alias);
    	
    	for(Alias a : aliases){
    		System.out.println(a);
    	}
	}*/
	@Test
	public void testSave() {
		
//		List<Article> articles = articleService.findAll();
		
		for(int index = 1; index < 20332; index++){
			
			Article article = articleService.find(index);
			Set<Relation> relations = article.getRelations();
			List<Relation> relationList = new ArrayList<Relation>();
			
			int size = relations.size();
			
			if(size <= 1){
				continue;
//				return;
			}
			
			for(Iterator<Relation> i = relations.iterator(); i.hasNext();){
				relationList.add((Relation)i.next());
			}
			
			for(int i = 0; i < size-1; i++){
				
				for(int j = i+1; j < size; j++){
					
					Alias first = relationList.get(i).getAlias();
					Alias second = relationList.get(j).getAlias();
					
					double scoreValue = relationList.get(i).getRelationship() * relationList.get(j).getRelationship();
//					double score2 = relationList.get(j).getRelationship() / relationList.get(i).getRelationship();
					
					BigDecimal b1 = new BigDecimal(scoreValue);
//					BigDecimal b2 = new BigDecimal(score2);
					double f1 = b1.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
//					double f2 = b2.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
					
					Score score = new Score(first, second, f1);
					scoreService.save(score);
				}
				
			}
//			break;
			if(index % 1000 == 0){
				System.out.println(index);
			}
		}
		
	}

	
}
