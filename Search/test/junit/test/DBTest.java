package junit.test;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class DBTest {
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			new ClassPathXmlApplicationContext("spring-applicationContext.xml");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testSave() throws Exception {
		
			
		
	}

	
}
