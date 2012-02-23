package com.mywie.utils;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.SimpleXmlSerializer;
import org.htmlcleaner.TagNode;

import com.mywie.core.SimpleMatch;

public class XmlHelp {
	private static SAXReader xmlReader = new SAXReader();

	public Document parseWithSAX(File aFile) throws DocumentException {
		return xmlReader.read(aFile);
	}

	public static Document getDocument(String filePath) {
		File aFile = new File(filePath);
		Document document = null;
		try {
			document = xmlReader.read(aFile);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		return document;
	}

	public static Document getDocumentWithClean(String filePath) {
		cleanHtml(filePath);
		File aFile = new File(filePath + ".temp");
		Document document = null;
		try {
			document = xmlReader.read(aFile);
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		aFile.delete();
		return document;
	}

	public static List<Element> getRootList(String files[]) {
		List<Element> roots = new ArrayList<Element>();
		// FileHelp.sortFiles(files);
		for (String filePath : files) {
			Document doc = getDocumentWithClean(filePath);
			Element root = doc.getRootElement();
			initEelment(root);
			roots.add(root);
		}
		return roots;
	}

	public static void cleanHtml(String path) {
		File file = new File(path);
		File temp = new File(path + ".temp");
		HtmlCleaner cleaner = new HtmlCleaner();
		CleanerProperties props = cleaner.getProperties();
		props.setUseEmptyElementTags(false);
		props.setOmitUnknownTags(true);
		props.setPruneTags("script,style,link,iframe,input,textarea");
		props.setNamespacesAware(false);
		try {
			TagNode node = cleaner.clean(file, "gbk");
			OutputStream out = new FileOutputStream(temp);
			new SimpleXmlSerializer(props).writeXmlToStream(node, out, "gbk");
			out.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		Element root = getDocument(path + ".temp").getRootElement();
	}

	public static void writeDocument(String path, Document document) {
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setXHTML(true);
		format.setEncoding("GBK");
		format.setIndent(true);
		format.setNewlines(true);
		format.setTrimText(true);
		format.setExpandEmptyElements(true);
		XMLWriter writer;
		try {
			writer = new XMLWriter(new FileWriter(path), format);
			writer.write(document);
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void copy(List<Element> nodes1, List<Element> nodes2) {
		nodes2.clear();
		for (int i = 0; i < nodes1.size(); i++) {
			nodes2.add(nodes1.get(i));
		}
	}

	public static void reduceElement(Element element, int num) {
		List<Element> elementList = element.elements();
		List<Element> elementList2 = new ArrayList<Element>();
		for (int i = 0; i < elementList.size(); i++) {
			int temp = Integer
					.valueOf(elementList.get(i).attributeValue("num"));
			if (temp >= num) {
				reduceElement(elementList.get(i), num);
			} else {
				elementList.get(i).addAttribute("class", "optional");
			}
		}
	}

	public static void initEelment(Element element) {
		List<Element> elementList = element.elements();
		for (int i = 0; i < elementList.size(); i++) {
			Element temp = elementList.get(i);
			temp.addAttribute("num", "1");
			if (null != temp.attribute("style")) {
				temp.remove(temp.attribute("style"));
			}
			if (null != temp.attribute("href")) {
				temp.attribute("href").setValue("#");
			}
			initEelment(elementList.get(i));
		}
	}

	public static List<Node> getNodeList(Element e) {
		List<Node> nodeList = new ArrayList<Node>();
		for (int i = 0; i < e.nodeCount(); i++) {
			if (isLegal(e.node(i))) {
				nodeList.add(e.node(i));
			}
		}
		return nodeList;
	}

	public static boolean isLegal(Node node) {
		return null != node.getName()
				|| !"".equals(node.getStringValue().trim());
	}

	public static int getNodeCount(Node node) {
		int nodeCount = 1;
		if (isLegal(node) == false) {
			return 0;
		}
		if (node.getNodeType() == Node.ELEMENT_NODE) {
			Element element = (Element) node;
			if (NodeCompare.isListNode(element)) {
				nodeCount += 3;
			} else {
				for (int i = 0; i < element.nodeCount(); i++) {
					nodeCount += getNodeCount(element.node(i));
				}
			}
		}
		return nodeCount;
	}

	public static int getTextNodeCount(Node node) {
		int nodeCount = 0;
		if (node.getNodeType() == Node.ELEMENT_NODE) {
			Element element = (Element) node;
			for (int i = 0; i < element.nodeCount(); i++) {
				nodeCount += getTextNodeCount(element.node(i));
			}
		} else {
			if (node.getNodeType() == Node.TEXT_NODE)
				nodeCount++;
		}
		return nodeCount;
	}

	public static int getElementCount(Element element) {
		int elementCount = 1;
		List<Element> elements = element.elements();
		for (int i = 0; i < elements.size(); i++) {
			elementCount += getElementCount(elements.get(i));
		}
		return elementCount;
	}

	public static void main(String argv[]) {
		
		
		cleanHtml("D:/home.html");
		
		/*System.out.println(getElementCount(getDocument(
				"D:/ÂÛÎÄ/ÍøÒ³/taobao1/template/3-10.html").getRootElement()));
		System.out
				.println(getElementCount(getDocument(
						"D:/ÂÛÎÄ/ÍøÒ³/taobao1/template/template3-10.htm")
						.getRootElement()));
		System.out.println(getElementCount(getDocument(
				"D:/ÂÛÎÄ/ÍøÒ³/taobao1/template/template3-10.htm.xml")
				.getRootElement()));*/
		// for (int i = 1; i <= 20; i++) {
		// XmlHelp.cleanHtml("C:/Users/xiaoxinchen/Desktop/ÂÛÎÄ/ÍøÒ³/taobao1/" + i
		// + ".htm");
		// }
	}

	public static Map<String, String> getExtractions(String filePath) {
		Map<String, String> map = new HashMap<String, String>();
		File file = new File(filePath);
		if (file.exists()) {
			Element root = XmlHelp.getDocument(filePath).getRootElement();
			List<Element> list = root.selectNodes("//*[@semantic]");
			for (Element element : list) {
				map.put(element.attributeValue("semantic"), element
						.attributeValue("my_count_id"));
			}
		}
		return map;
	}

	public static List<String> getData(List<String> titles, List<Element> result) {
		List<String> data = new ArrayList<String>();
		boolean flag;
		for (int i = 1; i < titles.size(); i++) {
			String title = titles.get(i);
			flag = false;
			for (Element element : result) {
				if (element.attributeValue("semantic").equals(title)) {
					flag = true;
					data.add(element.getStringValue());
					break;
				}
			}
			if (flag == false) {
				data.add("");
			}
		}
		return data;
	}
	/*
	 * if ("img".equalsIgnoreCase(element.getName())) { String url =
	 * element.attributeValue("src"); if (flag) { FileHelp.makedir(destDirectory
	 * + "/Í¼Æ¬/"); FileHelp.makedir(destDirectory + "/Í¼Æ¬/" +
	 * nameElement.getText()); flag = false; } String target = destDirectory +
	 * "/Í¼Æ¬/" + nameElement.getText() + "/" + url.substring(url.lastIndexOf('/')
	 * + 1); ImageUtil.createImage(new URL(url), new File(target));
	 * data.addElement("content").setText(target); }
	 */
	
}
