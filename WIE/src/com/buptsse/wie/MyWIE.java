package com.buptsse.wie;

import java.io.*;

/**
 * �ⲿ���ýӿ���
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
	 * �����ļ���·��������ģ��
	 * 
	 * @param pageFolder
	 * @param outputFolder
	 * @param simIndex
	 * @param monitor
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
	 * �����ļ����飬����ģ��
	 * @param pages
	 * @param outputFolder
	 * @param simIndex
	 * @param monitor
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
	 * ģ�����ɷ���
	 * @param pageFolder
	 * @param outputFolder
	 * @param simIndex
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
	 * ģ�����ɷ���
	 * @param pages
	 * @param outputFolder
	 * @param simIndex
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
	 * �����ļ����飬��ȡ����
	 * 
	 * @param templateFile ģ���ļ�
	 * @param pages ��ҳ����
	 * @return
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
	 * �����ļ���·������ȡ����
	 * 
	 * @param templateFile
	 * @param pageFolder
	 * @return
	 */
	public static ExtractionResultCollection extractData(File templateFile, File pageFolder) {
		if (!pageFolder.exists()) {
			return null;
		} else {
			return extractData(templateFile, pageFolder.listFiles(htmlFilter));
		}
	}
	
	/**
	 * �첽���ݳ�ȡ����
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
	
	/**
	 * �첽���ݳ�ȡ����
	 * @param templateFile
	 * @param pageFolder
	 * @param monitor
	 */
	public static void extractDataAsync(File templateFile, File pageFolder, IAsyncMonitor monitor) {
		if (!pageFolder.exists()) {
			return;
		} else {
			extractDataAsync(templateFile, pageFolder.listFiles(htmlFilter), monitor);
		}
	}
}
