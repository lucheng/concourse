package junit.test;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
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
import edu.bupt.spring.service.RelationService;
import edu.bupt.spring.service.ScoreService;


public class ScoreServiceTest {
	
	private static ScoreService scoreService;
	private static ArticleService articleService;
	private static AliasService aliasService;
	private static RelationService relationService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			AbstractApplicationContext cxt = new ClassPathXmlApplicationContext("spring-applicationContext.xml");
			scoreService = (ScoreService)cxt.getBean("scoreServiceImpl");
			articleService = (ArticleService)cxt.getBean("articleServiceImpl");
			aliasService = (AliasService)cxt.getBean("aliasServiceImpl");
			relationService = (RelationService)cxt.getBean("relationServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void test() {
		
		
		for(int index = 1; index < 20332; index++){
			
			double[] A = new double[20332];
			double[] B = new double[20332];
			
			Alias alias1 = aliasService.find(index);
			List<Relation> relations1 = relationService.findByAlias(alias1);
			
			Alias alias2 = aliasService.find(index);
			List<Relation> relations2 = relationService.findByAlias(alias2);
			
			for(Relation r : relations1){
				A[r.getArticle().getId()] = r.getRelationship();
			}
			
			for(Relation r : relations2){
				B[r.getArticle().getId()]= r.getRelationship();
			}
			
			double sum_A = 0;
			double sum_B = 0;
			double sum = 0;
			
			for(int i = 1; i < 20332; i++){
				sum_A += A[i];
				sum_B += B[i];
				sum += A[i] * B[i];
			}
			
			System.out.println(sum_A);
			System.out.println(sum_B);
			System.out.println(sum);
			
			double finalValue = sum / (Math.sqrt(sum_A) * Math.sqrt(sum_B));
			Score score = new Score(alias1, alias2, finalValue);
			scoreService.save(score);
			
		}
		
	}
	
	
	@Test
	public void testFind() {
		
//		Alias alias = aliasService.findByTitle("英特尔");
		Alias alias = aliasService.find(1);
    	
    	System.out.println(alias.getTitle());
    	List<Alias> aliases = scoreService.findRelatedAlias(alias);
    	
    	for(Alias a : aliases){
    		System.out.println(a);
    	}
	}
	
	@Test
	public void testSave() {
		
//		List<Article> articles = articleService.findAll();
		
		for(int index = 1; index < 20332; index++){
			
//			Alias alias = aliasService.find(index);
			
			
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
			
			List<Double> realation1 = new ArrayList<Double>();
			List<Double> realation2 = new ArrayList<Double>();
			
			
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
//					scoreService.save(score);
				}
				
			}
//			break;
			if(index % 1000 == 0){
				System.out.println(index);
			}
		}
		
	}

	
}
