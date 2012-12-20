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
 * 
 * 控制模板生成，所要进行的操作主要有：给定一个网页数据集，
 * 模板生成方法将根据用户给出的网页相似度进行网页模板的聚合匹配，
 * 然后给相似度大于阈值的网页进行树对齐操作，最终聚合成一个模板
 * 
 */
public class TemplateGenerator extends GeneratorOld {
	
	/**
	 * 构造方法
	 * 
	 * 传入网页所在的文件夹与相似度，生成模板
	 * 
	 * @param outputFolder	网页所在的文件夹
	 * @param simIndex		相似度
	 */
	public TemplateGenerator(File outputFolder, double simIndex) {
		this.setDirectory(outputFolder.getAbsolutePath());
		this.setRate(simIndex);
	}
	
	public void generate(File[] pages) {
		generate(pages, null);
	}
	
	/**
	 * 异步实现模板生成
	 * 
	 * @param pages		文件名数组
	 * @param monitor	监听器
	 */
	public void generateAsync(File[] pages, IAsyncMonitor monitor) {
		if (monitor == null) {
			return;
		}
		
		final File[] fPages = pages;
		final IAsyncMonitor fMonitor = monitor;
		
		// 开启一个新的线程，生成模板文件
		new Thread() {
			public void run() {
				if (fMonitor.isCancellationRequested()) {
					fMonitor.onCompleted(CompletionType.Cancelled, null, null);
				} else {
					try {
						generate(fPages, fMonitor);
					} catch (Exception e) {
					
						fMonitor.onCompleted(CompletionType.Exception, e, null);
					}
				}
			}
		}.start();
	}
	
	/**
	 * 根据传入的网页集，生成模板
	 * 
	 * @param pages 包含网页文件路径的字符数组
	 * @param monitor	监听器
	 */
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
	
	// 文件目录
	private String directory;
	// 生成的模板数
	private int templateNum;
	// 模板根节点
	private Element root;
	// 模板聚合数
	private int total;
	// 相似度
	protected double rate;
	
	private List<Element> srcRoots;
	private List<Element> newRoots;
	
	protected Matcher matchAlign = new Matcher();
	private XmlHelp xmlHelp = new XmlHelp();
	
	/**
	 * 对网页dom树的每个节点进行编号处理
	 * 
	 * @param root dom树的根节点
	 */
	@SuppressWarnings("unchecked")
	private void processTemplate(Element root) {
		List<Element> elements = new ArrayList<Element>();
		elements.add(root);
		int count = 1;
		
		// 将网页节点进行编号
		while (elements.size() > 0) {
			
			Element temp = elements.remove(0);
			temp.addAttribute("my_count_id", Integer.toString(count++));
			elements.addAll(temp.elements());
		}
	}

	/**
	 * 调用核心算法中的树匹配算法，计算两个网页dom树是否相似
	 * @param templateRoot	模板网页文件根节点
	 * @param alignRoot		对齐网页文件根节点
	 * @return				相似度是否大于给定的相似度
	 */
	protected boolean matchAlign(Element templateRoot, Element alignRoot) {
		
		List<Element> nodes1 = new ArrayList<Element>();
		List<Element> nodes2 = new ArrayList<Element>();
		
		int w = matchAlign.simpleTreeMatch(templateRoot, alignRoot, nodes1, nodes2);
		int m = XmlHelp.getElementCount(alignRoot);
		System.out.println("相似度：" + rate);
		// 计算两个网页dom树是否相似
		if ((double) w / m >= rate) {
			// 进行树对齐
			matchAlign.alignTrees(templateRoot, alignRoot, nodes1, nodes2);
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 根据传入的网页的dom树根节点，生成模板文件
	 * 
	 * @param roots		网页的dom树根节点
	 * @return			生成的模板数
	 */
	protected int generateTemplate(List<Element> roots) {
		return this.generateTemplate(roots, null);
	}
	
	/**
	 * 模板生成
	 * 调用模板生成算法，生成模板文件，并返回生成的模板数量
	 * 
	 * @param roots		网页的dom树根节点
	 * @param monitor	监听器
	 * @return			生成的模板数
	 */
	@SuppressWarnings("static-access")
	protected int generateTemplate(List<Element> roots, IAsyncMonitor monitor) {
		
		// 初始化数据
		
		srcRoots = roots;
		newRoots = new ArrayList<Element>();
		int num = roots.size();
		double totalNum = (double)num;
		
		// 循环遍历，直到所有文件都已经进行过对比
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
				// 调用核心算法中的树匹配算法，计算两个网页dom树是否相似
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

	/**
	 * 将js脚本文件加入到模板文件头中
	 * @param src	js脚本文件的位置
	 * @param element	js脚本文件的所要添加到的节点
	 */
	private void addScript(String src, Element element) {
		Element jsElement = element.addElement("script");
		jsElement.setText(" ");
		jsElement.addAttribute("src", src);
		jsElement.addAttribute("type", "text/javascript");
	}

	/**
	 * 将css脚本文件加入到模板文件头中
	 * 
	 * @param href	css样式文件的位置
	 * @param element	css样式文件的所要添加到的节点
	 */
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
