package com.buptsse.wie;

import java.io.*;

/**
 * 
 * 外部调用接口类
 * 
 * 向外部提供调用 接口，允许程度在别的应用项目中完成整体的功能：
 * （1）传入文件夹路径，生成模板(同步、异步)操作
 * （2）抽取数据(同步、异步)操作
 */
public final class MyWIE {
	
	public static FileFilter htmlFilter;
	
	static {
		htmlFilter = new FileFilter() {
			
			@Override
			public boolean accept(File pathname) {
				
				if (pathname.isFile() && 
					(pathname.getName().toLowerCase().endsWith(".html") ||
					 pathname.getName().toLowerCase().endsWith(".htm"))) {
					return true;
				} else {
					return false;
				}
			}
		};
	}
	
	/**
	 * 传入文件夹路径，生成模板(异步)
	 * 
	 * @param pageFolder	网页文件夹
	 * @param outputFolder	模板生成后输出的位置
	 * @param simIndex		相似度
	 * @param monitor		监视器
	 */
	public static void generateTemplateAsync(File pageFolder, File outputFolder, double simIndex, IAsyncMonitor monitor) {
		
		File dir = pageFolder;
		
		if (!dir.exists()) {
			monitor.onCompleted(CompletionType.NotRunning, null, null);
		} else {
			generateTemplateAsync(dir.listFiles(htmlFilter), outputFolder, simIndex, monitor);
		}
	}
	
	/**
	 * 传入文件数组，生成模板(异步)
	 * @param pages			包含网页文件名的数组
	 * @param outputFolder	模板生成后输出的位置
	 * @param simIndex		相似度
	 * @param monitor		监视器
	 */
	public static void generateTemplateAsync(File[] pages, File outputFolder, double simIndex, IAsyncMonitor monitor) {
		
		File output = outputFolder;
		
		if (monitor == null) {
			return;
		}
		
		if (!output.exists() || pages.length == 0 || simIndex < 0 || simIndex > 1) {
			monitor.onCompleted(CompletionType.NotRunning, null, null);
		} else if (monitor.isCancellationRequested()) {
			monitor.onCompleted(CompletionType.Cancelled, null, null);
		} else {
			TemplateGenerator generator = new TemplateGenerator(outputFolder, simIndex);
			generator.generateAsync(pages, monitor);
		}
	}
	
	/**
	 * 模板生成方法(同步)
	 * @param pageFolder	网页文件夹
	 * @param outputFolder	模板生成后输出的位置
	 * @param simIndex		相似度
	 */
	public static void generateTemplate(
			File pageFolder, File outputFolder, double simIndex) {
		
		File dir = pageFolder;
		
		if (!dir.exists()) {
			return;
		} else {
			generateTemplate(dir.listFiles(htmlFilter), outputFolder, simIndex);
		}
	}
	
	/**
	 * 模板生成方法(同步)
	 * @param pages			包含网页文件名的数组
	 * @param outputFolder	模板生成后输出的位置
	 * @param simIndex		相似度
	 */
	public static void generateTemplate(File[] pages, File outputFolder, double simIndex) {
		
		File output = outputFolder;
		
		if (!output.exists() || pages.length == 0 || simIndex < 0 || simIndex > 1) {
			return;
		} else {
			TemplateGenerator generator = new TemplateGenerator(outputFolder, simIndex);
			generator.generate(pages);
		}
	}
	
	/**
	 * 传入文件数组，抽取数据(同步)
	 * 
	 * @param templateFile 模板文件
	 * @param pages 网页数组
	 * @return 抽取结果类集合
	 */
	public static ExtractionResultCollection extractData(File templateFile, File[] pages) {
		if (pages.length == 0 || !templateFile.exists()) {
			return null;
		} else {
			Extractor extractor = new Extractor(templateFile);
			return extractor.extract(pages);
		}
	}
	
	/**
	 * 传入文件夹路径，抽取数据(同步)
	 * 
	 * @param templateFile	模板文件
	 * @param pageFolder	网页文件夹
	 * @return				抽取的数据内容
	 */
	public static ExtractionResultCollection extractData(File templateFile, File pageFolder) {
		if (!pageFolder.exists()) {
			return null;
		} else {
			return extractData(templateFile, pageFolder.listFiles(htmlFilter));
		}
	}
	
	/**
	 * 数据抽取方法(异步)
	 * 
	 * @param templateFile	模板文件
	 * @param pages			网页数组
	 * @param monitor		监视器
	 */
	public static void extractDataAsync(
			File templateFile, File[] pages, IAsyncMonitor monitor) {
		if (monitor == null) {
			return;
		}
		
		if (!templateFile.exists() || pages.length == 0) {
			monitor.onCompleted(CompletionType.NotRunning, null, null);
		} else if (monitor.isCancellationRequested()) {
			monitor.onCompleted(CompletionType.Cancelled, null, null);
		} else {
			Extractor extractor = new Extractor(templateFile);
			extractor.extractAsync(pages, monitor);
		}
	}
	
	/**
	 * 数据抽取方法(异步)
	 * @param templateFile	模板文件
	 * @param pageFolder	网页文件夹
	 * @param monitor		监视器
	 */
	public static void extractDataAsync(File templateFile, File pageFolder, IAsyncMonitor monitor) {
		if (!pageFolder.exists()) {
			return;
		} else {
			extractDataAsync(templateFile, pageFolder.listFiles(htmlFilter), monitor);
		}
	}
}
