package junit.test;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
		
		
		/*List<Alias> aliases = aliasService.findAll();
		StringBuffer sb = new StringBuffer();
		
		for(Alias alias : aliases){
			if(alias.getPos().equals("org")){
				sb.append(alias.getTitle() + "\n");
			}
		}
		
		FileUtils.writeFile("org.txt", sb.toString());*/
		
		List<String> rules = FileUtils.readTxtByLine("./dict/org.txt", 1, Integer.MAX_VALUE);
		
		for(String str : rules){
			
			if(str.length() < 1){
				continue;
			}
			String[] value = str.split("/");
			
			String pos = value[0];
			String title = value[1];
			
			Entry entry = new Entry();
			
			entry.setTitle(title);
			entry.setPos(pos);
//			entry.setAlias(aliasSet);
			entry.setUrl("#");
			
			entryService.save(entry);
			
			Set<Alias> aliasSet = new HashSet<Alias>();
			
			for(int i = 1; i < value.length; i++){
				Alias alias = aliasService.findByTitle(value[i]);
				
				if(alias == null){
					alias = new Alias();
					alias.setTitle(value[i]);
					alias.setPos(value[0]);
//					alias.setEntry(entry);
					aliasService.save(alias);
				}
				aliasSet.add(alias);
			}
			
//			System.out.println(str);
//			System.out.println(title);
//			System.out.println(pos);
		}
		
	}

	
}
