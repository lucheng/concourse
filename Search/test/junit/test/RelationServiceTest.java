package junit.test;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.bupt.nlp.resources.BCConvert;
import edu.bupt.nlp.textrank.Extractor;
import edu.bupt.nlp.textrank.TextRankExtractor;
import edu.bupt.nlp.textrank.Word;
import edu.bupt.spring.entity.Article;
import edu.bupt.spring.entity.Entry;
import edu.bupt.spring.entity.Relation;
import edu.bupt.spring.service.ArticleService;
import edu.bupt.spring.service.EntryService;
import edu.bupt.spring.service.RelationService;


public class RelationServiceTest {
	
	private static RelationService relationService;
	private static ArticleService articleService;
	private static EntryService entryService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			AbstractApplicationContext cxt = new ClassPathXmlApplicationContext("spring-applicationContext.xml");
			relationService = (RelationService)cxt.getBean("relationServiceImpl");
			articleService = (ArticleService)cxt.getBean("articleServiceImpl");
			entryService = (EntryService)cxt.getBean("entryServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testFind(){
		
		Entry entry = entryService.findByTitle("英特尔");
    	List<Relation> relations = relationService.findByEntry(entry);
    	for(Relation r : relations){
    		System.out.println(r.getArticle().getNewsTitle());
    	}
	}
	@Test
	@SuppressWarnings("unchecked")
	public void testSave() throws Exception {
		
			
		Extractor textRank = new TextRankExtractor("./dict/userdic.txt", "./dict/stopLibrary.dic");
		for(int i = 2001; i <= 20000; i++){
			Article article = articleService.find(i);
			
			String content = article.getNewsContent();
			String text = BCConvert.qj2bj(content);
			Map<Word,Integer> result = textRank.extract(text, 100,true);
			
			Map<Word,Integer> entryMap = new HashMap<Word,Integer>();
			
			for(Word word : result.keySet()){
				
				String title = word.getWord();
				String pos = word.getTagger();
				
				if(pos.equals("org")||pos.equals("nz")||pos.startsWith("nr")){
					
					Entry entry = entryService.findByTitle(title);
					
					if(entry == null){
						entry = new Entry();
						entry.setPos(pos);
						entry.setTitle(title);
						entry.setUrl("#");
						entryService.save(entry);
					}
					
					if(result.get(word) > 0){
						Relation relation = new Relation();
						relation.setEntry(entry);
						relation.setArticle(article);
						relation.setRelationship(result.get(word));
						
						relationService.save(relation);
					}
					entryMap.put(word, result.get(word));
				}
			}
			System.out.println(entryMap);
//			System.out.println(article.getNewsTitle());
		}
		
	}

	
}
