package com.buptsse.wie;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;

import com.buptsse.wie.core.Matcher;
import com.buptsse.wie.utilities.XmlHelp;

/**
 * 模板生成类
 * 控制模板生成
 * 
 */
public class TemplateGenerator extends GeneratorOld {
	public TemplateGenerator(File outputFolder, double simIndex) {
		this.setDirectory(outputFolder.getAbsolutePath());
		this.setRate(simIndex);
	}
	
	public void generate(File[] pages) {
		generate(pages, null);
	}
	
	public void generateAsync(File[] pages, IAsyncMonitor monitor) {
		if (monitor == null) {
			return;
		}
		
		final File[] fPages = pages;
		final IAsyncMonitor fMonitor = monitor;
		
		new Thread() {
			public void run() {
				if (fMonitor.isCancellationRequested()) {
					fMonitor.onCompleted(CompletionType.Cancelled, null, null);
				} else {
					try {
						generate(fPages, fMonitor);
					} catch (Exception e) {
						// TODO: handle exception
						fMonitor.onCompleted(CompletionType.Exception, e, null);
					}
				}
			}
		}.start();
	}
	
	private void generate(File[] pages, IAsyncMonitor monitor) {
		Document rawHtmlDoc = null;
		List<Element> roots = new ArrayList<Element>();// 源代码list
		for (File file : pages) {
			String name = file.getAbsolutePath();
			System.out.println(name);
			rawHtmlDoc = XmlHelp.getHtmlDocument(name);
			if(rawHtmlDoc == null){
				continue;
			}
			Element root = rawHtmlDoc.getRootElement();
			roots.add(root);
		}
		//生成模板文件
		List<Element> roots1 = XmlHelp.getRootList(roots);
		generateTemplate(roots1, monitor);
	}
}

class GeneratorOld {
	
	private String directory;
	private int templateNum;
	private Element root;
	private int total;
	protected double rate;
	private List<Element> srcRoots;
	private List<Element> newRoots;
	
	protected Matcher matchAlign = new Matcher();
	private XmlHelp xmlHelp = new XmlHelp();
	
	@SuppressWarnings("unchecked")
	private void processTemplate(Element root) {
		List<Element> elements = new ArrayList<Element>();
		elements.add(root);
		int count = 1;
		
		while (elements.size() > 0) {
			
			Element temp = elements.remove(0);
			temp.addAttribute("my_count_id", Integer.toString(count++));
			elements.addAll(temp.elements());
		}
	}

	protected boolean matchAlign(Element templateRoot, Element alignRoot) {
		
		List<Element> nodes1 = new ArrayList<Element>();
		List<Element> nodes2 = new ArrayList<Element>();
		
		int w = matchAlign.simpleTreeMatch(templateRoot, alignRoot, nodes1, nodes2);
		int m = XmlHelp.getElementCount(alignRoot);
		System.out.println("相似度：" + rate);
		if ((double) w / m >= rate) {
			matchAlign.alignTrees(templateRoot, alignRoot, nodes1, nodes2);
			return true;
		} else {
			return false;
		}
	}
	
	protected int generateTemplate(List<Element> roots) {
		return this.generateTemplate(roots, null);
	}

	protected int generateTemplate(List<Element> roots, IAsyncMonitor monitor) {
		srcRoots = roots;
		newRoots = new ArrayList<Element>();
		int num = roots.size();
		double totalNum = (double)num;
		//int nums[] = new int[num];
		while (num > 0) {
			
			if (monitor != null && monitor.isCancellationRequested()) {
				monitor.onCompleted(CompletionType.Cancelled, null, null);
				return 0;
			}
			
			num--;
			templateNum++;
			total = 1;
			root = srcRoots.get(0);
			srcRoots.remove(0);
			boolean flag1 = false;
			boolean flag2 = false;
			while (srcRoots.size() > 0) {
				if (monitor != null && monitor.isCancellationRequested()) {
					monitor.onCompleted(CompletionType.Cancelled, null, null);
					return templateNum;
				}
				Element root2 = srcRoots.get(0);
				srcRoots.remove(0);
				if (matchAlign(root, root2)) {
					flag1 = true;
					total++;
					num--;
					if (monitor != null) {
						double dNum = (double)num;
						int percentage = (int)((1.0 - dNum / totalNum) * 100);
						
						monitor.onProgressChanged(percentage);
					}
				} else {
					newRoots.add(root2);
					flag2 = true;
				}
				if (srcRoots.size() == 0 && flag1 && flag2) {
					srcRoots.addAll(newRoots);
					newRoots.clear();
					flag1 = false;
					flag2 = false;
				}
			}
			if (flag2) {
				srcRoots.addAll(newRoots);
				newRoots.clear();
			}
			//nums[templateNum - 1] = total;
			xmlHelp.reduceElement(root, (total * 800 / 1000));
			addHtml(root);
			processTemplate(root);
			String templateName = "template" + templateNum + "-" + total
					+ ".htm";
			xmlHelp.writeDocument(directory + "/" + templateName,
					root.getDocument());
			
			if (monitor != null) {
				monitor.onProgressChanged((int)((1.0 - (double)num / totalNum) * 100));
			}
		}
		
		if (monitor != null) {
			monitor.onCompleted(CompletionType.Normal, null, null);
		}
		return templateNum;
	}

	private void addScript(String src, Element element) {
		Element jsElement = element.addElement("script");
		jsElement.setText(" ");
		jsElement.addAttribute("src", src);
		jsElement.addAttribute("type", "text/javascript");
	}

	private void addLink(String href, Element element) {
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


	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public String getDirectory() {
		return directory;
	}

	protected void setDirectory(String directory) {
		this.directory = directory;
	}

	private Element getRootNode(Document doc) {
		return doc.getRootElement();
	}

}
