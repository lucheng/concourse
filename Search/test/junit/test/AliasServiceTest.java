package junit.test;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.bupt.spring.entity.Alias;
import edu.bupt.spring.entity.Relation;
import edu.bupt.spring.service.AliasService;
import edu.bupt.utils.FileUtils;


public class AliasServiceTest {
	
	private static AliasService aliasService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			AbstractApplicationContext cxt = new ClassPathXmlApplicationContext("spring-applicationContext.xml");
			aliasService = (AliasService)cxt.getBean("aliasServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testFind(){
		
		Alias alias = aliasService.findByTitle("英特尔");
    	
    	System.out.println(alias.getTitle());
//    	List<Relation> relations = relationService.findByAlias(alias);
	}
	
	@Test
	public void testSave() {
		
		List<String> rules = FileUtils.readTxtByLine("./dict/rules.txt", 1, 20);
		for(String str : rules){
			String value = str.substring(0, str.lastIndexOf("|"));
			String pos = str.substring(str.lastIndexOf("|")+1, str.length());
			
			Alias entry = new Alias();
			entry.setTitle(value);
			entry.setPos(pos);
			
//			entryService.save(entry);
			System.out.println(str);
			System.out.println(value);
			System.out.println(pos);
		}
		
	}

	
}
