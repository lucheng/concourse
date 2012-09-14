package junit.test;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.bupt.spring.entity.Entry;
import edu.bupt.spring.service.EntryService;
import edu.bupt.utils.FileUtils;


public class EntryServiceTest {
	
	private static EntryService entryService;
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			AbstractApplicationContext cxt = new ClassPathXmlApplicationContext("spring-applicationContext.xml");
			entryService = (EntryService)cxt.getBean("entryServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testFind(){
		
		Entry entry = entryService.findByTitle("Google");
		System.out.println(entry.getTitle());
	}
	
	@Test
	public void testSave() {
		
		List<String> rules = FileUtils.readTxtByLine("./dict/rules.txt", 1, 20);
		for(String str : rules){
			String value = str.substring(0, str.lastIndexOf("|"));
			String pos = str.substring(str.lastIndexOf("|")+1, str.length());
			
			Entry entry = new Entry();
			entry.setTitle(value);
			entry.setPos(pos);
			entry.setUrl("#");
			
//			entryService.save(entry);
			System.out.println(str);
			System.out.println(value);
			System.out.println(pos);
		}
		
	}

	
}
