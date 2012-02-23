package com.mywie.core;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.eclipse.swt.widgets.Text;

import com.mywie.gui.WieStatusBar;
import com.mywie.model.ExtractData;
import com.mywie.model.NodeList;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class Extract extends Thread {
	private String templateFile;
	private String[] extractFiles;
	private String urlFile;
	private Element root = null;
	private String destDirectory;
	private Text textArea;
	private int total;
	private WieStatusBar statusBar;
	private String statusText;
	private static Logger logger = Logger
			.getLogger(ExtractData.class.getName());

	public Text getTextArea() {
		return textArea;
	}

	public void setTextArea(Text textArea) {
		this.textArea = textArea;
	}

	public static void main(String[] args) {
		Extract extract = new Extract();
		extract.setTempalteFile("C:/Documents and Settings/cxx/桌面/paperTest/ebay_textbook_template/template/template1-17.htm.xml");
		extract.setExtractFiles(FileHelp.getFiles("C:/Documents and Settings/cxx/桌面/paperTest/ebay_textbook"));
		extract.setDestDirectory("C:/Documents and Settings/cxx/桌面/paperTest/ebay_textbook/extraction");
		
		try {
			extract.extract2();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void extract2() throws Exception {
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
		FileHelp.copyJarFile("include/extraction.xsl", destDirectory
				+ "/extraction.xsl");

		ExtractData ed = new ExtractData();
		List<Node> titleNodes = root.selectNodes("//*[@semantic]");
		List<String> titles = new ArrayList<String>();
		titles.add("网页名称");
		for (Node node : titleNodes) {
			if (node instanceof Element) {
				Element element = (Element) node;
//				titles.add(element.attributeValue("semantic"));
				titles.add(element.attributeValue("semantic"));
			}
		}
		ed.setTitles(titles);
		List<List<String>> datas = new ArrayList<List<String>>();
		total = titleNodes.size();
		for (int i = 0; i < extractFiles.length; i++) {
			Document doc = XmlHelp.getDocumentWithClean(extractFiles[i]);
			Element root2 = doc.getRootElement();
			List<Element> result = new ArrayList<Element>();
			List<Element> matchNodes1 = new ArrayList<Element>();
			List<Element> matchNodes2 = new ArrayList<Element>();
			int w = SimpleMatch.match(root, root2, matchNodes1, matchNodes2);
			// if ((double) w / XmlHelp.getElementCount(root2) >= 0.9) {
			for (int j = 0; j < matchNodes1.size(); j++) {
				if (matchNodes1.get(j).attributeValue("semantic") != null) {
					
					matchNodes2.get(j).addAttribute("semantic", matchNodes1.get(j).attributeValue("semantic"));
					if(matchNodes1.get(j).attribute("src") != null){
//						result.add(matchNodes2.get(j).attribute("src"));
//						matchNodes2.get(j).addAttribute("semantic", matchNodes1.get(j).attributeValue("semantic"));
//						System.out.println(matchNodes2.get(j).attribute("src").getData());
					}else {
						result.add(matchNodes2.get(j));
					}
					
				}
			}
			List<String> data = new ArrayList<String>();
			if (result.size() >= total * 8 / 10) {
				File file = new File(extractFiles[i]);
				data.add(file.getName());
				data.addAll(XmlHelp.getData(titles, result));
				datas.add(data);
			}
			// }
		}
		ed.setDatas(datas);
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

	public void extract() throws Exception {
		long startTime = System.currentTimeMillis();

		FileHelp.makedir(destDirectory);
		FileHelp.copyJarFile("include/extraction.xsl", destDirectory
				+ "/extraction.xsl");

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
		List<List<String>> datas = new ArrayList<List<String>>();
		total = titleNodes.size();
		for (int i = 0; i < extractFiles.length; i++) {
			Document doc = XmlHelp.getDocumentWithClean(extractFiles[i]);
			Element root2 = doc.getRootElement();
			List<Element> result = new ArrayList<Element>();
			doExtract(root, root2, result);
			List<String> data = new ArrayList<String>();
			if (result.size() >= total * 8 / 10) {
				File file = new File(extractFiles[i]);
				data.add(file.getName());
				data.addAll(XmlHelp.getData(titles, result));
			}
			datas.add(data);
		}
		ed.setDatas(datas);
		ed.printToXML(destDirectory + "/extraction.xml");

		System.out.println("#############信息抽取结束#############");
		long endTime = System.currentTimeMillis();
		System.out.println("所花费的时间：" + (endTime - startTime) + "ms");
	}

	public void extractOnLine() throws Exception {
//		CrawlHelp.downTos(FileHelp.getURLs(urlFile), destDirectory);
		setExtractFiles(FileHelp.getFiles(destDirectory));
		extract();
	}

	public int doExtract(Element node1, Element node2, List<Element> result) {
		if (node1.getName() == null
				|| node2.getName() == null
				|| !node1.getName().equalsIgnoreCase(node2.getName())
				|| (node1.attributeValue("title") != null && !node1
						.attributeValue("title").equals(
								node2.attributeValue("title")))) {
			return 0;
		}

		List<Element> elements1 = node1.elements();
		List<Element> elements2 = node2.elements();
		int n = elements1.size();
		int m = elements2.size();
		int c[][] = new int[n + 1][m + 1];
		int b[][] = new int[n + 1][m + 1];
		NodeList p[][] = new NodeList[n + 1][m + 1];

		for (int i = 0; i <= n; i++) {
			for (int j = 0; j <= m; j++) {
				c[i][j] = 0;
				p[i][j] = new NodeList();
			}
		}
		for (int i = 1; i <= n; i++) {
			for (int j = 1; j <= m; j++) {
				int w = doExtract(elements1.get(i - 1), elements2.get(j - 1),
						p[i][j].getNodes());
				c[i][j] = c[i - 1][j - 1] + w;
				if (c[i][j - 1] > c[i][j]) {
					c[i][j] = c[i][j - 1];
					b[i][j] = 1;
				}

				if (c[i - 1][j] > c[i][j]) {
					c[i][j] = c[i - 1][j];
					b[i][j] = 2;
				}
			}
		}
		int i = n;
		int j = m;
		while (i != 0 && j != 0) {
			if (b[i][j] == 0) {
				result.addAll(p[i][j].getNodes());
				i--;
				j--;
			} else {
				if (b[i][j] == 1) {
					j--;
				} else {
					if (b[i][j] == 2) {
						i--;
					}
				}
			}
		}
		if (node1.attribute("semantic") != null && "".equals(node1.attributeValue("semantic")) == false) {
			node2.addAttribute("semantic", node1.attributeValue("semantic"));
			result.add(node2.createCopy());
		}
		return c[n][m] + 1;

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

	public String getUrlFile() {
		return urlFile;
	}

	public void setUrlFile(String urlFile) {
		this.urlFile = urlFile;
	}

	public void run() {
		try {
			extract2();
		} catch (Exception e) {
			logger.error(e.getStackTrace());
		}

	}

	public WieStatusBar getStatusBar() {
		return statusBar;
	}

	public void setStatusBar(WieStatusBar statusBar) {
		this.statusBar = statusBar;
	}
}
