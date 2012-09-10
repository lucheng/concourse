package edu.bupt.corpus.sogou;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SogouCSProcessor {
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

	/**
	 * 使用正则表达式匹配产生出文档DocBean.
	 * 
	 * @param rawText
	 */
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

	/**
	 * 展示docbean的信息.
	 * 
	 * @param docbean
	 */
	private void displayDocBean(DocBean docbean) {
		// System.out.println("docbeanNO:" + docbean.getNo());
		System.out.println("docbeanURL:" + docbean.getUrl());
		// System.out.println("docbeanTitle:" + docbean.getTitle());
		// System.out.println("docbeanContent:" + docbean.getContent());
		// System.out.println("docbeanCategory:" + docbean.getCategory());
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

	/**
	 * 处理文件目录下的所有指定文件.将这些doc导入到数据库中.
	 * 
	 * @param fileDir
	 */
	public void processor(String fileDir) {
		List<String> filePath = FileListViewer.getFileList(fileDir, "txt", true);
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
			SogouDBManager.savaDocBeanToDB(docList);
		}
	}

	/**
	 * 将输出结果输出到文件中.
	 * 
	 * @param path
	 * @throws FileNotFoundException
	 */
	public static void resultToFile(String path) {
		File test = new File(path);
		PrintStream printStream = null;
		try {
			printStream = new PrintStream(new FileOutputStream(test));
		} catch (FileNotFoundException e) {
			System.out.println("文件没有发现!");
			e.printStackTrace();
		}
		PrintStream out = printStream;
		System.setOut(out);
	}

	public static void main(String args[]) {
		SogouCSProcessor pro = new SogouCSProcessor();
		resultToFile("sogoucs.txt");
//		pro.processor("E:/data/test");
		pro.processor("E:/data/SogouCA");
	}
}