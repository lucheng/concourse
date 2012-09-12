package junit.test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import edu.bupt.corpus.sogou.CategoryDetector;
import edu.bupt.corpus.sogou.DocBean;
import edu.bupt.corpus.sogou.FileListViewer;
import edu.bupt.corpus.sogou.FileUtil;
import edu.bupt.spring.entity.Article;
import edu.bupt.spring.service.ArticleService;


public class ArticleServiceTest {
	
	private static ArticleService articleService;
	
	private List<DocBean> docList = new ArrayList<DocBean>();
	// 匹配表达式.
	private String docPatternString = "(?s)<doc>.*?</doc>";
	private String noPatternString = "<docno>(.*?)</docno>";
	private String urlPatternString = "<url>(.*?)</url>";
	private String titlePatternString = "<contenttitle>(.*?)</contenttitle>";
	private String contentPatternString = "<content>(.*?)</content>";
	private Pattern docPattern = Pattern.compile(docPatternString);
	private Pattern noPattern = Pattern.compile(noPatternString);
	private Pattern urlPattern = Pattern.compile(urlPatternString);
	private Pattern titlePattern = Pattern.compile(titlePatternString);
	private Pattern contentPattern = Pattern.compile(contentPatternString);
	
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		try {
			AbstractApplicationContext cxt = new ClassPathXmlApplicationContext("spring-applicationContext.xml");
			articleService = (ArticleService)cxt.getBean("articleServiceImpl");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void testSave() {
		
		List<String> filePath = FileListViewer.getFileList("E:/data/SogouCA", "txt", true);
		System.out.println("文件数目:" + filePath.size());
		Iterator<String> iter = filePath.iterator();
		while (iter.hasNext()) {
			String path = iter.next();
			System.out.println("===========================================");
			System.out.println(path);
			String rawText = FileUtil.readEntire(path);
			// System.out.println(rawText);
			this.getDocBean(rawText);
//			System.out.println(rawText);
			savaDocBeanToDB(docList);
		}
		
	}

	/**
	 * 处理掉<doc></doc>这些信息.
	 * 
	 * @param text
	 * @return 去噪信息.
	 */
	private String reProcess(String text) {
		int beginIndex = text.indexOf(">");
		int endIndex = text.lastIndexOf("<");
		return text.substring(beginIndex + 1, endIndex).trim();
	}
	
	private void getDocBean(String rawText) {
		docList.clear();
		boolean completed = true;
		String no = null;
		String url = null;
		String title = null;
		String content = null;
		String category = null;
		String docMatchString = "";
		Matcher docMatcher = docPattern.matcher(rawText);
		while (docMatcher.find()) {
			DocBean docbean = new DocBean();
			docMatchString = docMatcher.group();
			Matcher noMatcher = noPattern.matcher(docMatchString);
			Matcher urlMatcher = urlPattern.matcher(docMatchString);
			Matcher titleMatcher = titlePattern.matcher(docMatchString);
			Matcher contentMatcher = contentPattern.matcher(docMatchString);
			if (noMatcher.find() && urlMatcher.find() && titleMatcher.find()
					&& contentMatcher.find()) {
				no = reProcess(noMatcher.group());
				url = reProcess(urlMatcher.group());
				title = reProcess(titleMatcher.group());
				content = reProcess(contentMatcher.group());
				docbean.setNo(no);
				docbean.setUrl(url);
				docbean.setTitle(title);
				docbean.setContent(content);
			} else {
				completed = false;
			}
			if (completed) {
				category = CategoryDetector.detectCategory(url);
				docbean.setCategory(category);
				// displayDocBean(docbean);
				docList.add(docbean);
			}
		}
		System.out.println("txt contains " + docList.size() + " docs!");
	}
	
	
	public void savaDocBeanToDB(List<DocBean> docList) {
		// 成功与否.
		Iterator<DocBean> docIter = docList.iterator();
		DocBean docbean = null;
		while (docIter.hasNext()) {
			docbean = docIter.next();
			try {
				
				String no = docbean.getNo();
				String title = docbean.getTitle();
				String content = docbean.getContent();
				String url = docbean.getUrl();
				String category = docbean.getCategory();
				
				// 执行sql语句.
				if(docbean.getTitle().length() > 2 
						&& docbean.getContent().length() > 20 
						&& docbean.getCategory().trim().toUpperCase().equals("IT")){
					
					Article article = new Article();
					
					article.setNewsno(no);
					article.setNewsTitle(title);
					article.setNewsUrl(url);
					article.setNewsContent(content);
					article.setCategory(category);
					
					articleService.save(article);
					
//					String fileName = System.currentTimeMillis() + ".txt";
//					FileUtils.writeFile("E:/data/title/" + fileName, docbean.getTitle());
//					FileUtils.writeFile("E:/data/content/" + fileName, docbean.getContent());
				}
			} catch (Exception e) {
				System.out.println("插入newsbean时,Sql语句执行错误!");
//				System.out.println("内容是:" + docbean.getContent());
//				e.printStackTrace();
				continue;
			}
		}
		
	}
}
