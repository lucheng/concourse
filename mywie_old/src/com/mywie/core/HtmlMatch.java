package com.mywie.core;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;
import org.eclipse.swt.widgets.Text;

import com.mywie.gui.WieStatusBar;
import com.mywie.model.NodeList;
import com.mywie.utils.FileHelp;
import com.mywie.utils.NodeCompare;
import com.mywie.utils.XmlHelp;

public class HtmlMatch extends Thread {
	private String directory;
	private Text textArea;
	private int templateNum;
	private Element root;
	private String[] files;
	private int total;
	private double rate;
	private List<Element> roots1;
	private List<Element> roots2;
	private WieStatusBar statusBar;
	private String statusText;
	private static Logger logger = Logger.getLogger(HtmlMatch.class.getName());

	public Text getTextArea() {
		return textArea;
	}

	public void setTextArea(Text textArea) {
		this.textArea = textArea;
	}

	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}

	public Element getRootNode(Document doc) {
		return doc.getRootElement();
	}

	public void processTemplate(Element root) {
		List<Element> elements = new ArrayList<Element>();
		elements.add(root);
		int count = 1;
		while (elements.size() > 0) {
			Element temp = elements.remove(0);
			temp.addAttribute("my_count_id", Integer.toString(count++));
			elements.addAll(temp.elements());
		}
	}

	public void alignTrees(Element node1, Element node2,
			List<Element> matchNodes1, List<Element> matchNodes2) {
		List<Element> elements1 = node1.elements();
		List<Element> elements2 = node2.elements();
		int n = elements1.size();
		int m = elements2.size();
		if (m == 0) {
			return;
		}
		int i = 0;
		int j = 0;
		List<Element> nodes1 = new ArrayList<Element>();
		List<Element> nodes2 = new ArrayList<Element>();
		while (j < m) {
			if (j < m && matchNodes2.contains(elements2.get(j))) {
				while (matchNodes1.contains(elements1.get(i)) == false)
					i++;
				nodes1.add(elements1.get(i));
				nodes2.add(elements2.get(j));
				i++;
				j++;
			}
			int o = j;
			while (o < m && matchNodes2.contains(elements2.get(o)) == false)
				o++;
			if (o < m && i < n && matchNodes1.contains(elements1.get(i))) {
				nodes1.add(elements1.get(i));
				nodes2.add(elements2.get(o));
				for (int p = j; p < o; p++) {
					elements1.add(i, elements2.get(p).createCopy());
				}
				i += (o - j) + 1;
				o++;
			} else {
				if (o >= m && i >= n) {
					for (int p = j; p < o; p++) {
						elements1.add(i, elements2.get(p).createCopy());
					}
				}
			}
			j = o;
		}
		for (i = 0; i < nodes1.size(); i++) {
			matchNodes1.remove(nodes1.get(i));
			matchNodes2.remove(nodes2.get(i));
		}
		for (i = 0; i < nodes1.size(); i++) {

			int num = Integer.valueOf(nodes1.get(i).attributeValue("num"));
			nodes1.get(i).attribute("num").setText(Integer.toString(num + 1));

			alignTrees(nodes1.get(i), nodes2.get(i), matchNodes1, matchNodes2);
		}
	}

	public void execute() throws Exception {
		if (this.getStatusBar() != null
				&& !this.getStatusBar().getDisplay().isDisposed()) {
			this.getStatusBar().getDisplay().syncExec(new Runnable() {
				public void run() {
					getStatusBar().changeToRunning();
					getStatusBar().setStatus("正在分析网页集...");

				}

			});
		}
		long startTime = System.currentTimeMillis();
		logger.info("#############开始分析网页集#################");
		files = FileHelp.getFiles(directory);
		if (files != null) {
			templateNum = 0;
			FileHelp.sortFiles(files);
			roots1 = XmlHelp.getRootList(files);
			roots2 = new ArrayList<Element>();
			int num = files.length;
			int nums[] = new int[num];
			FileHelp.makedir(directory + "/template");
			int t = 0;
			while (num > 0) {
				num--;
				templateNum++;
				total = 1;
				System.out.println("now produce the template: " + templateNum);
				root = roots1.get(0);
				roots1.remove(0);
				boolean flag1 = false;
				boolean flag2 = false;
				while (roots1.size() > 0) {
					System.out.println("#" + t++);
					Element root2 = roots1.get(0);
					roots1.remove(0);
					List<Element> nodes1 = new ArrayList<Element>();
					List<Element> nodes2 = new ArrayList<Element>();
					int w = SimpleMatch.match(root, root2, nodes1, nodes2);
					int m = XmlHelp.getElementCount(root2);
					if ((double) w / m >= rate) {

						flag1 = true;
						total++;
						num--;
						travel(root);
						alignTrees(root, root2, nodes1, nodes2);
						int n = XmlHelp.getNodeCount(root);
//						System.out.println("Clustered!!!"
//								+ " template's current nodes is: "
//								+ n
//								+ "the aligned html's nodes is: "
//								+ m
//								+ " match nodes is:"
//								+ w
//								+ " similarity is: "
//								+ (double) w
//								/ m
//								+ " "
//								+ root2.selectSingleNode("/html/head/title")
//										.asXML());
					} else {
						roots2.add(root2);
						flag2 = true;
					}
					if (roots1.size() == 0 && flag1 && flag2) {
						roots1.addAll(roots2);
						roots2.clear();
						flag1 = false;
						flag2 = false;
					}
				}
				if (flag2) {
					roots1.addAll(roots2);
					roots2.clear();
				}

				nums[templateNum - 1] = total;
				XmlHelp.reduceElement(root, (total * 800 / 1000));

				addHtml(root);
				processTemplate(root);
				String templateName = "template" + templateNum + "-" + total
						+ ".htm";
				XmlHelp.writeDocument(directory + "/template/" + templateName,
						root.getDocument());
			}
			System.out.println("总共生成了" + templateNum + "个模板");
			for (int i = 1; i <= templateNum; i++) {
				System.out.println("第" + i + "个模板是由" + nums[i - 1] + "个网页生成");
			}
			copyFiles();
			long endTime = System.currentTimeMillis();
			statusText = "网页集分析结束，共生成" + (templateNum) + "个模板，用时"
					+ (endTime - startTime) + "ms...";
			logger.info("##########" + statusText + "###########");
			if (this.getStatusBar() != null
					&& !this.getStatusBar().getDisplay().isDisposed()) {
				this.getStatusBar().getDisplay().syncExec(new Runnable() {
					public void run() {
						getStatusBar().changeToStatus();
						getStatusBar().setStatus(statusText);
					}

				});
			}
		}
	}

	public void travel(Element root) {
		if (root.attributeValue("title") != null
				&& "品牌".equals(root.attributeValue("title"))) {
			System.out.println("********************"
					+ root.attributeValue("num"));
		}
		List<Element> eList = root.elements();
		for (Element e : eList) {
			travel(e);
		}

	}

	public void addScript(String src, Element element) {
		Element jsElement = element.addElement("script");
		jsElement.setText(" ");
		jsElement.addAttribute("src", src);
		jsElement.addAttribute("type", "text/javascript");
	}

	public void addLink(String href, Element element) {
		Element cssElement = element.addElement("link");
		cssElement.addAttribute("rel", "stylesheet");
		cssElement.addAttribute("href", href);
		cssElement.addAttribute("type", "text/css");
	}

	public void addHtml(Element root) {
		Node headNode = root.selectSingleNode("//head");
		if (headNode.getNodeType() == Node.ELEMENT_NODE) {
			Element headElement = (Element) headNode;
			addLink("include/template.css", headElement);
			addScript("include/jquery.js", headElement);
			addScript("include/template.js", headElement);
		}
	}

	private void copyFiles() {
		FileHelp.makedir(directory + "/template/include");
		FileHelp.copyJarFile("include/jquery.js", directory + "/template/include/jquery.js");
		FileHelp.copyJarFile("include/template.css", directory + "/template/include/template.css");
		FileHelp.copyJarFile("include/template.js", directory + "/template/include/template.js");
	}

	public static void main(String argv[]) {
		
		for (int i = 0; i < 40; i++) {
			HtmlMatch hm = new HtmlMatch();
			
			hm.setDirectory("C:/Documents and Settings/linzhe/桌面/blog_xinhua/0 ("+i+")");
			hm.setRate(0.9);
			hm.start();
			
//			try {
//				hm.execute();
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
			
		}
		
//		HtmlMatch hm = new HtmlMatch();
//		hm.setDirectory(argv[0]);
//		hm.setRate(0.9);
//		try {
//			hm.execute();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public WieStatusBar getStatusBar() {
		return statusBar;
	}

	public void setStatusBar(WieStatusBar statusBar) {
		this.statusBar = statusBar;
	}

	public void run() {
		try {
			execute();
		} catch (Exception e) {
			logger.error(e.getStackTrace());
		}

	}
}
