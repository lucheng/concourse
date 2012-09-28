package junit.test;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.bupt.spring.entity.Alias;
import edu.bupt.spring.entity.Entry;
import edu.bupt.spring.service.AliasService;
import edu.bupt.spring.service.EntryService;
import edu.bupt.utils.FileUtils;


public class EntryServiceTest {
	
	private static EntryService entryService;
	private static AliasService aliasService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			AbstractApplicationContext cxt = new ClassPathXmlApplicationContext("spring-applicationContext.xml");
			entryService = (EntryService)cxt.getBean("entryServiceImpl");
			aliasService = (AliasService)cxt.getBean("aliasServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testSave() {
		
		List<Alias> aliases = aliasService.findAll();
		StringBuffer sb = new StringBuffer();
		
		for(Alias alias : aliases){
			
			sb.append(alias.getTitle() + "\n");
		}
		
		FileUtils.writeFile("alias.txt", sb.toString());
		
		/*List<String> rules = FileUtils.readTxtByLine("./dict/rules.txt", 1, 20);
		for(String str : rules){
			String value = str.substring(0, str.lastIndexOf("|"));
			String pos = str.substring(str.lastIndexOf("|")+1, str.length());
			
			Entry entry = new Entry();
			entry.setTitle(value);
			entry.setPos(pos);
			
//			entryService.save(entry);
			System.out.println(str);
			System.out.println(value);
			System.out.println(pos);
		}*/
		
	}

	
}
