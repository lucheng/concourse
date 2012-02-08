package com.mywie.operate;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;

import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class TemplateOperate {
	
	private String directory;
	private int templateNum;
	private Element root;
	private int total;
	private double rate = 0.9;
	private List<Element> srcRoots;
	private List<Element> newRoots;
	
	protected MatchAlign matchAlign = new MatchAlign();
	private XmlHelp xmlHelp = new XmlHelp();
	
	/**
	 * 根据传入的标注文件和网页生成待生成模板的Document
	 * @param markedFileDoc
	 * @param rawHtmlDoc
	 * @return 提取出来的Document
	 */
	@SuppressWarnings("unchecked")
	public Document preTemplate(Document markedFileDoc, Document rawHtmlDoc){
		
		Element templateRoot = markedFileDoc.getRootElement();
		Element alignRoot = rawHtmlDoc.getRootElement();
		
		/*List<Node> nodes = alignRoot.selectNodes("//*");
		for (Node node : nodes){
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element temp = (Element) node;
				temp.remove(temp.attribute("my_count_id"));
			}
		}*/
		
//		FileHelp.writeFile("file/markedFileDoc.xml", markedFileDoc.asXML());
//		FileHelp.writeFile("file/rawHtmlDoc.xml", rawHtmlDoc.asXML());
		
		List<Element> matchNodes1 = new ArrayList<Element>();
		List<Element> matchNodes2 = new ArrayList<Element>();
		
		matchAlign.match(templateRoot, alignRoot, matchNodes1, matchNodes2);
		
//		System.out.println("matchNodes1:"+ matchNodes1.size());
		
		for (int j = 0; j < matchNodes1.size(); j++) {
			
			/*if (matchNodes1.get(j).attributeValue("remove") != null) {
				matchNodes2.get(j).addAttribute("remove", matchNodes1.get(j).attributeValue("remove"));
//				FileHelp.writeFile("file/remove_"+ j +".xml", matchNodes2.get(j).asXML());
			}*/
			if (matchNodes1.get(j).attributeValue("semantic") != null) {
				matchNodes2.get(j).addAttribute("semantic", matchNodes1.get(j).attributeValue("semantic"));
//				FileHelp.writeFile("file/semantic_"+ j +".xml", matchNodes2.get(j).asXML());
			}
			/*if (matchNodes1.get(j).attributeValue("select") != null) {
				matchNodes2.get(j).addAttribute("select", matchNodes1.get(j).attributeValue("select"));
//				FileHelp.writeFile("file/select_"+ j +".xml", matchNodes2.get(j).asXML());
			}*/
		}
		
		/**
		 * 取出标注有select有节点
		 */
		String selectNode = null;
		for (int j = 0; j < matchNodes1.size(); j++) {
			if (matchNodes1.get(j).attributeValue("select") != null) {
				matchNodes2.get(j).addAttribute("select", matchNodes1.get(j).attributeValue("select"));
				selectNode = matchNodes2.get(j).asXML();
				
//				FileHelp.writeFile("file/select"+ j +".xml", matchNodes2.get(j).asXML());
				
			}
		}
		Document doc = null;
		try {
//			String ss = xmlHelp.getDocumentWithCleanOfSrc();
			if(selectNode == null){
				return null;
			}
			doc = xmlHelp.parseWithSAX(xmlHelp.cleanSrc(selectNode));
			for (Element node:(List<Element>) doc.selectNodes("//*[@remove]")){
				String str = node.getStringValue();
				if (node.getNodeType() == Node.ELEMENT_NODE ) {
					Element element=(Element)node;
					element.clearContent();
					element.setText(str);
				}
			}
		} catch (DocumentException e) {
			e.printStackTrace();
		}
//		System.out.println(selectNode);
//		FileHelp.writeFile("file/selectNode"+new Date().getTime()+".html", doc.asXML());
//		FileHelp.writeFile("file/markedFileDoc.html", markedFileDoc.asXML());
		return doc;
	}
	
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
		
		int w = matchAlign.match(templateRoot, alignRoot, nodes1, nodes2);
		int m = XmlHelp.getElementCount(alignRoot);
		if ((double) w / m >= rate) {
			matchAlign.alignTrees(templateRoot, alignRoot, nodes1, nodes2);
			return true;
		} else {
			return false;
		}
	}

	protected int generateTemplate(List<Element> roots) {
		
		srcRoots = roots;
		newRoots = new ArrayList<Element>();
		int num = roots.size();
		int nums[] = new int[num];
		while (num > 0) {
			num--;
			templateNum++;
			total = 1;
			root = srcRoots.get(0);
			srcRoots.remove(0);
			boolean flag1 = false;
			boolean flag2 = false;
			while (srcRoots.size() > 0) {
				Element root2 = srcRoots.get(0);
				srcRoots.remove(0);
				if (matchAlign(root, root2)) {
					flag1 = true;
					total++;
					num--;
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
			nums[templateNum - 1] = total;
			xmlHelp.reduceElement(root, (total * 800 / 1000));
			addHtml(root);
			processTemplate(root);
			String templateName = "template" + templateNum + "-" + total + ".htm";
			xmlHelp.writeDocument(directory + "/" + templateName, root.getDocument());
		}
		copyFiles();
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

	private void copyFiles() {
		FileHelp.makedir(directory + "/include");
		FileHelp.copyJarFile("include/jquery.js", directory	+ "/include/jquery.js");
		FileHelp.copyJarFile("include/template.css", directory + "/include/template.css");
		FileHelp.copyJarFile("include/template.js", directory + "/include/template.js");
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
