package edu.bupt.spring.test;

import java.util.HashMap;
import java.util.Map;

import edu.bupt.spring.entity.Student;
import edu.bupt.spring.utils.FreeMarkertUtil;

/**
 * 
 * @author  linzhe
 * @Date    2012-5-20
 * @email   m23linzhe@gmail.com
 * @qq      398024808
 * @version 1.0
 *
 */
public class CreateHtmlTest {
	public static void main(String[] args) {
		
		Student content = new Student();
		content.setName("张三");
		Map<String, Object> root = new HashMap<String, Object>();
		root.put("content", content);
		String templatesPath = "WebRoot/templates";
		String templateFile = "/createhtml.ftl";
		
		String htmlPath = "WebRoot/html";
		String htmlFile = htmlPath + "/firsthtml.html";
		
		FreeMarkertUtil.analysisTemplate(templatesPath, templateFile, htmlFile,
				root);
	}
}
