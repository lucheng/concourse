package com.buptsse.wie;

import java.io.*;

/**
 * 外部调用接口类
 */
public final class MyWIE {
	public static FileFilter htmlFilter;
	
	static {
		htmlFilter = new FileFilter() {
			
			@Override
			public boolean accept(File pathname) {
				// TODO Auto-generated method stub
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
	 * 模板生成方法
	 * 
	 * @param pageFolder
	 * @param outputFolder
	 * @param simIndex
	 * @param monitor
	 */
	public static void generateTemplateAsync(
			File pageFolder, File outputFolder, double simIndex, IAsyncMonitor monitor) {
		
		File dir = pageFolder;
		
		if (!dir.exists()) {
			monitor.onCompleted(CompletionType.NotRunning, null, null);
		} else {
			generateTemplateAsync(dir.listFiles(htmlFilter), outputFolder, simIndex, monitor);
		}
	}
	
	public static void generateTemplateAsync(
			File[] pages, File outputFolder, double simIndex, IAsyncMonitor monitor) {
		
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
	
	public static void generateTemplate(
			File pageFolder, File outputFolder, double simIndex) {
		
		File dir = pageFolder;
		
		if (!dir.exists()) {
			return;
		} else {
			generateTemplate(dir.listFiles(htmlFilter), outputFolder, simIndex);
		}
	}
	
	public static void generateTemplate(
			File[] pages, File outputFolder, double simIndex) {
		
		File output = outputFolder;
		
		if (!output.exists() || pages.length == 0 || simIndex < 0 || simIndex > 1) {
			return;
		} else {
			TemplateGenerator generator = new TemplateGenerator(outputFolder, simIndex);
			generator.generate(pages);
		}
	}
	
	public static ExtractionResultCollection extractData(
			File templateFile, File[] pages) {
		if (pages.length == 0 || !templateFile.exists()) {
			return null;
		} else {
			Extractor extractor = new Extractor(templateFile);
			return extractor.extract(pages);
		}
	}
	
	public static ExtractionResultCollection extractData(
			File templateFile, File pageFolder) {
		if (!pageFolder.exists()) {
			return null;
		} else {
			return extractData(templateFile, pageFolder.listFiles(htmlFilter));
		}
	}
	
	/**
	 * 抽取方法
	 * 
	 * @param templateFile
	 * @param pages
	 * @param monitor
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
	
	public static void extractDataAsync(
			File templateFile, File pageFolder, IAsyncMonitor monitor) {
		if (!pageFolder.exists()) {
			return;
		} else {
			extractDataAsync(templateFile, pageFolder.listFiles(htmlFilter), monitor);
		}
	}
}
