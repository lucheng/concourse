package junit.test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;

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
	
	class Data {
		double relationship;
		int article_id;
		int alias_id;
	}
	
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
	public void test() throws Exception {
		
		InputStream is = new FileInputStream("E:/all.xls");
		Workbook book=Workbook.getWorkbook(is);
		Sheet sheet=book.getSheet(0);
		
		Cell relation[] = sheet.getColumn(3);
		Cell article[] = sheet.getColumn(4);
		Cell alias[] = sheet.getColumn(5);
		
		double[][] data = new double[2][20332];
		
		for(int i=3; i <= 12357; i++){
			
			for(int k = 1; k < 20332; k++){
				data[0][k] = 0;
			}
			
			int aliasNum = Integer.parseInt(alias[i].getContents());
			for(int index = 1; index < relation.length; index++){
				if(i == aliasNum){
					int articleNum = Integer.parseInt(article[index].getContents());
					data[0][articleNum] = 100 * Double.parseDouble(relation[index].getContents());
				}
			}
			
			for(int j = i+1; j < relation.length; j++){
				
				for(int k = 1; k < 20332; k++){
					data[1][k] = 0;
				}
				int aliasNum2 = Integer.parseInt(alias[j].getContents());
				for(int index = 1; index < relation.length; index++){
					if(j == aliasNum2){
						int articleNum = Integer.parseInt(article[index].getContents());
						data[1][articleNum] = 100 *  Double.parseDouble(relation[index].getContents());
					}
				}
//				BigDecimal A = new BigDecimal("0.000"); 
//				BigDecimal B = new BigDecimal("0.000"); 
//				BigDecimal S = new BigDecimal("0.000"); 
				double sum_A = 0;
				double sum_B = 0;
				double sum = 0;
				
				/*for(int k = 1; k < 20332; k++){
					System.out.println(data[0][k]+" ");
					
				}
				System.out.println("==============================");
				for(int k = 1; k < 20332; k++){
					System.out.println(data[1][k]+" ");
					
				}*/
				//20332
				for(int k = 1; k < 20332; k++){
					
//					A.add(new BigDecimal(data[0][k]).multiply(new BigDecimal(data[0][k])));
//					B.add(new BigDecimal(data[1][k]).multiply(new BigDecimal(data[1][k])));
//					S.add(new BigDecimal(data[0][k]).multiply(new BigDecimal(data[1][k])));
					if(data[0][k] == 0 || data[0][k] == 0){
						continue;
					}
					sum_A += data[0][k] *  data[0][k];
					sum_B += data[1][k] *  data[1][k];
					sum   +=  data[0][k] *  data[1][k];
				}
				
//				DecimalFormat format = new DecimalFormat();  
//		        format.applyPattern("#0.0000"); 
				
//				System.out.println("sum_A:" + sum_A + " sum_B:" + sum_B + "  sum:" + sum);
				
				if(sum_A > 0 && sum_B > 0 && sum > 0){
					double finalValue = sum / (Math.sqrt(sum_A) * Math.sqrt(sum_B));
					Alias alias1 = aliasService.find(i);
					Alias alias2 = aliasService.find(j);
					Score score = new Score(alias1, alias2, finalValue,0);
					System.out.println("i:" + i + " j:" + j + "  " + finalValue);
//					scoreService.save(score);
				}
				
//				break;
			}
//			break;
		}
		
		/*for(int index = 1; index < 12358; index++){
			
			Alias alias1 = aliasService.find(index);
			List<Relation> relations1 = relationService.findByAlias(alias1);
			
			for(int in = index+1; in < 20332; in++){
				
				double[] A = new double[20332];
				double[] B = new double[20332];
				
				
				
				Alias alias2 = aliasService.find(in);
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
				
				for(int i = 1; i < 20332 && A[i] > 0 && B[i] > 0; i++){
					sum_A += A[i]*A[i];
					sum_B += B[i]*B[i];
					sum += A[i] * B[i];
				}
				
				if(sum_A > 0 && sum_B > 0 && sum > 0){
					double finalValue = sum / (Math.sqrt(sum_A) * Math.sqrt(sum_B));
					Score score = new Score(alias1, alias2, finalValue,0);
					System.out.println(finalValue);
					scoreService.save(score);
				}
			}
		}*/
		
	}
	
	
	/*@Test
	public void testFind() {
		
//		Alias alias = aliasService.findByTitle("英特尔");
		Alias alias = aliasService.find(1);
    	
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
			
			
			for(int i = 0; i < size-1; i++){
				
				for(int j = i+1; j < size; j++){
					
					Alias first = relationList.get(i).getAlias();
					Alias second = relationList.get(j).getAlias();
					
					
					double scoreValue = relationList.get(i).getRelationship() * relationList.get(j).getRelationship();
//					double score2 = relationList.get(j).getRelationship() / relationList.get(i).getRelationship();
					if(scoreValue > 0.1){
						BigDecimal b1 = new BigDecimal(scoreValue);
	//					BigDecimal b2 = new BigDecimal(score2);
						double f1 = b1.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
	//					double f2 = b2.setScale(2, BigDecimal.ROUND_HALF_UP).doubleValue();
						
						Score score = new Score(first, second, f1, 0);
						scoreService.save(score);
					}
				}
				
			}
//			break;
			if(index % 1000 == 0){
				System.out.println(index);
			}
		}
		
	}

	
}
