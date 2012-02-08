package com.mywie.core;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.eclipse.swt.widgets.Text;

import com.mywie.control.Generater;
import com.mywie.gui.WieStatusBar;
import com.mywie.utils.FileHelp;

public class HtmlMatch extends Thread {
	
	private String directory;
	private String markedFileName;
	private Text textArea;
	private int templateNum;
	private double rate;
//	private Element root;
//	private String[] files;
//	private int total;
//	private List<Element> roots1;
//	private List<Element> roots2;
	private WieStatusBar statusBar;
	private String statusText;
	private static Logger logger = Logger.getLogger(HtmlMatch.class.getName());

	
	public String getMarkedFileName() {
		return markedFileName;
	}

	public void setMarkedFileName(String markedFileName) {
		this.markedFileName = markedFileName;
	}
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
		
		FileHelp.makedir(directory + "/template");
		
		Generater generate = new Generater();
//		Generater generate = new Generater(markedFileName);
		generate.setRate(rate);
		templateNum = generate.generateTemplates(directory);
	
//		copyFiles();
		long endTime = System.currentTimeMillis();
		statusText = "网页集分析结束，共生成" + (templateNum) + "个模板，用时" + (endTime - startTime) + "ms...";
		logger.info("##########" + statusText + "###########");
		if (this.getStatusBar() != null && !this.getStatusBar().getDisplay().isDisposed()) {
			this.getStatusBar().getDisplay().syncExec(new Runnable() {
				public void run() {
					getStatusBar().changeToStatus();
					getStatusBar().setStatus(statusText);
				}

			});
		}
		
		/*if (files != null) {
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
					int w = SimpleMatch.simpleTreeMatch(root, root2, nodes1, nodes2);
					int m = XmlHelp.getElementCount(root2);
					if ((double) w / m >= rate) {

						flag1 = true;
						total++;
						num--;
						travel(root);
						alignTrees(root, root2, nodes1, nodes2);
						int n = XmlHelp.getNodeCount(root);
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
				String templateName = "template" + templateNum + "-" + total + ".htm";
				XmlHelp.writeDocument(directory + "/template/" + templateName, root.getDocument());
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
		}*/
	}

	/*public void addScript(String src, Element element) {
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
*/
	/*private void copyFiles() {
		FileHelp.makedir(directory + "/template/include");
		FileHelp.copyJarFile("include/jquery.js", directory
				+ "/template/include/jquery.js");
		FileHelp.copyJarFile("include/template.css", directory
				+ "/template/include/template.css");
		FileHelp.copyJarFile("include/template.js", directory
				+ "/template/include/template.js");
	}*/

	public static void main(String argv[]) {
		
		Generater generate = new Generater("C:/360buy/template/1.html");
		generate.generateTemplates("C:/360buy");
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
			e.printStackTrace();
		}

	}
}
