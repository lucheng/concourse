package com.mywie.core;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.eclipse.swt.widgets.Text;

import com.mywie.control.Extracter;
import com.mywie.gui.WieStatusBar;
import com.mywie.model.ExtractData;
import com.mywie.model.MarkData;
import com.mywie.operate.DataFilter;
import com.mywie.operate.MatchAlign;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class Extract extends Thread {
	
	private static String templateFile;
	private String markedFile;
	private String[] extractFiles;
	private Element root;
	private String destDirectory;
	private Text textArea;
	private int total;
	private WieStatusBar statusBar;
	private String statusText;
	
	private MatchAlign matchAlign = new MatchAlign();
	
	private int extractType = 0;
	public static int QUICK = 1;
	public static int NORMAL = 2;
	
	private static Logger logger = Logger.getLogger(ExtractData.class.getName());

//	private XmlHelp xmlHelp = new XmlHelp();
	
	public String getMarkedFile() {
		return markedFile;
	}

	public void setMarkedFile(String markedFile) {
		this.markedFile = markedFile;
	}
	
	public int getExtractType() {
		return extractType;
	}

	public void setExtractType(int extractType) {
		this.extractType = extractType;
	}
	
	public Text getTextArea() {
		return textArea;
	}

	public void setTextArea(Text textArea) {
		this.textArea = textArea;
	}

	@SuppressWarnings("unchecked")
	public void extractQuick() throws Exception {
		
		if (this.getStatusBar() != null
				&& !this.getStatusBar().getDisplay().isDisposed()) {
			this.getStatusBar().getDisplay().syncExec(new Runnable() {
				public void run() {
					getStatusBar().changeToRunning();
					getStatusBar().setStatus("正在抽取数据...");
				}
			});
		}
		logger.info("#############信息抽取开始#############");
		long startTime = System.currentTimeMillis();
		System.out.println("destDirectory:" + destDirectory);
		FileHelp.makedir(destDirectory);
		FileHelp.copyJarFile("include/extraction.xsl", destDirectory + "/extraction.xsl");

		ExtractData ed = new ExtractData();
		List<Node> titleNodes = root.selectNodes("//*[@semantic]");
		List<String> titles = new ArrayList<String>();
		titles.add("网页名称");
		for (Node node : titleNodes) {
			if (node instanceof Element) {
				Element element = (Element) node;
				titles.add(element.attributeValue("semantic"));
			}
		}
		ed.setTitles(titles);
		List<List<MarkData>> datas = new ArrayList<List<MarkData>>();
		total = titleNodes.size();
		
		Extracter extracter = new Extracter(templateFile, markedFile);
		
		for (int i = 0; i < extractFiles.length; i++) {
			
			List<MarkData> data = extracter.extract(extractFiles[i]);
			
			if (data!= null && data.size() >= total * 8 / 10) {
				File file = new File(extractFiles[i]);
//				data.add();
//				data.addAll(xmlHelp.getData(titles, result));
				datas.add(data);
			}
		}
//		ed.setDatas(datas);
		ed.printToXML(destDirectory + "/extraction.xml");

		logger.info("#############信息抽取结束#############");
		long endTime = System.currentTimeMillis();
		statusText = "数据抽取结束，用时" + (endTime - startTime) + "ms...";
		if (this.getStatusBar() != null
				&& !this.getStatusBar().getDisplay().isDisposed()) {
			this.getStatusBar().getDisplay().syncExec(new Runnable() {
				public void run() {
					getStatusBar().changeToStatus();
					getStatusBar().setStatus(statusText);
				}
			});
		}
		logger.info(statusText);
	}

	@SuppressWarnings("unchecked")
	public void extractNormal() throws Exception {
		
		if (this.getStatusBar() != null
				&& !this.getStatusBar().getDisplay().isDisposed()) {
			this.getStatusBar().getDisplay().syncExec(new Runnable() {
				public void run() {
					getStatusBar().changeToRunning();
					getStatusBar().setStatus("正在抽取数据...");

				}

			});
		}
		
		logger.info("#############信息抽取开始#############");
		long startTime = System.currentTimeMillis();

		FileHelp.makedir(destDirectory);
		FileHelp.copyJarFile("include/extraction.xsl", destDirectory + "/extraction.xsl");

		ExtractData ed = new ExtractData();
//		System.out.println("root:" + root);
		List<Node> titleNodes = root.selectNodes("//*[@semantic]");
		List<String> titles = new ArrayList<String>();
		titles.add("网页名称");
		for (Node node : titleNodes) {
			if (node instanceof Element) {
				Element element = (Element) node;
				titles.add(element.attributeValue("semantic"));
			}
		}
		ed.setTitles(titles);
		
		List<List<MarkData>> datas = new ArrayList<List<MarkData>>();
		total = titleNodes.size();
		for (int i = 0; i < extractFiles.length; i++) {
			System.out.println("extractFile:" + extractFiles[i]);
			Document doc = XmlHelp.getDocumentWithClean(extractFiles[i]);
			Element root2 = doc.getRootElement();
			List<Element> result = new ArrayList<Element>();
			List<Element> matchNodes1 = new ArrayList<Element>();
			List<Element> matchNodes2 = new ArrayList<Element>();
			
//			DataFilter.dataFilter(root);
			
			matchAlign.match(root, root2, matchNodes1, matchNodes2);
			
			for (int j = 0; j < matchNodes1.size(); j++) {
				if (matchNodes1.get(j).attributeValue("semantic") != null) {
					matchNodes2.get(j).addAttribute("semantic", matchNodes1.get(j).attributeValue("semantic"));
					if(matchNodes1.get(j).attributeValue("block") != null){
						matchNodes2.get(j).addAttribute("block", matchNodes1.get(j).attributeValue("block"));
					}
					result.add(matchNodes2.get(j));
				}
			}
			List<MarkData> data = new ArrayList<MarkData>();
			
			if (result.size() >= total * 8 / 10) {
				File file = new File(extractFiles[i]);
				ed.setExtractData(file.getName(), result);
				/*MarkData fileName = new MarkData();
				fileName.setFileName(file.getName());
				data.add(fileName);
				data.addAll(XmlHelp.getData(titles, result));
				datas.add(data);*/
			}
		}
		System.out.println("datas:"+ datas.size());
//		ed.setDatas(datas);
		ed.printToXML(destDirectory + "/extraction.xml");

		logger.info("#############信息抽取结束#############");
		long endTime = System.currentTimeMillis();
		statusText = "数据抽取结束，用时" + (endTime - startTime) + "ms...";
		if (this.getStatusBar() != null
				&& !this.getStatusBar().getDisplay().isDisposed()) {
			this.getStatusBar().getDisplay().syncExec(new Runnable() {
				public void run() {
					getStatusBar().changeToStatus();
					getStatusBar().setStatus(statusText);
				}
			});
		}
		logger.info(statusText);
	}

	public String getTempalteFile() {
		return templateFile;
	}

	public void setTempalteFile(String tempalteFile) {
		this.templateFile = tempalteFile;
		this.root = XmlHelp.getDocument(tempalteFile).getRootElement();
	}

	public String[] getExtractFiles() {
		return extractFiles;
	}

	public void setExtractFiles(String[] extractFiles) {
		this.extractFiles = extractFiles;
	}

	public Element getRoot() {
		return root;
	}

	public void setRoot(Element root) {
		this.root = root;
	}

	public String getDestDirectory() {
		return destDirectory;
	}

	public void setDestDirectory(String destDirectory) {
		this.destDirectory = destDirectory;
	}

	public void run() {
		try {
			if(this.extractType == Extract.QUICK){
				extractQuick();
			}else {
				extractNormal();
			}
		} catch (Exception e) {
			logger.error(e.getStackTrace());
			e.printStackTrace();
		}

	}

	public WieStatusBar getStatusBar() {
		return statusBar;
	}

	public void setStatusBar(WieStatusBar statusBar) {
		this.statusBar = statusBar;
	}
}
