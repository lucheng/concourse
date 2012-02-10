package com.mywie.utils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.PrettyXmlSerializer;
import org.htmlcleaner.SimpleXmlSerializer;
import org.htmlcleaner.TagNode;

import com.mywie.model.NodeCompare;

public class XmlHelp {
	
	private String charset = "GBK";
	private static SAXReader xmlReader = new SAXReader();

	public Document parseWithSAX(File aFile) throws DocumentException {
		return xmlReader.read(aFile);
	}

	public static Document getDocument(String filePath) {
		
		File aFile = new File(filePath);
		Document document = null;
//		document = getDocumentWithClean(filePath);
		try {
			document = xmlReader.read(aFile);
		} catch (DocumentException e) {
			e.printStackTrace();
			return null;
		}
		return document;
	}

	public static Document getDocumentWithClean(String filePath) {
		Document document = null;
		try {
			cleanHtml(filePath);
			File aFile = new File(filePath + ".temp");
			document = xmlReader.read(aFile);
			aFile.delete();
		} catch (DocumentException e) {
			e.printStackTrace();
		}
		
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
	
	public static List<Element> getRootList(List<Element> rawRoots) {
		List<Element> roots = new ArrayList<Element>();
		// FileHelp.sortFiles(files);
		for (Element srcRoot : rawRoots) {
			//对网页进行一下处理
			initEelment(srcRoot);
			roots.add(srcRoot);
		}
		return roots;
	}

	public static Document cleanHtml(String fileName) {
		
		File file = new File(fileName);
		File temp = new File(fileName + ".temp");
		
		HtmlCleaner cleaner = new HtmlCleaner();
		CleanerProperties props = cleaner.getProperties();
		
		props.setPruneTags("script,style,link,iframe,input,textarea");
		props.setUseCdataForScriptAndStyle(true);  
        props.setRecognizeUnicodeChars(true);  
        props.setUseEmptyElementTags(true);  
        props.setAdvancedXmlEscape(true);
        props.setTranslateSpecialEntities(true);  
        props.setBooleanAttributeValues("empty");
        
        
		try {
			TagNode node = cleaner.clean(file, "gbk");
			
			TagNode[] htmlTag = node.getElementsByName("html", true);
			for(TagNode tagNode : htmlTag){
				Map<String, String> attrMap = tagNode.getAttributes();
				for(String attr : attrMap.keySet()){
					System.out.println("attr:" + attr);
					tagNode.removeAttribute(attr);
				}
			}
			OutputStream out = new FileOutputStream(temp);
			new SimpleXmlSerializer(props).writeToStream(node, out, "gbk");
			out.close();
			
			Element tmp = getDocument(fileName+".temp").getRootElement();
			processTemplate(tmp);
//			writeDocument(fileName+".temp" ,tmp.getDocument());
			return tmp.getDocument();
			/*TagNode node = cleaner.clean(new File(fileName)); 
			new PrettyXmlSerializer(props).writeXmlToFile(node, fileName + ".temp");*/
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public Document parseWithSAX(String htmlSrc) throws DocumentException {
		return DocumentHelper.parseText(htmlSrc);
	}
	
	public String cleanSrc(String src) {
		
		HtmlCleaner cleaner = new HtmlCleaner();
		CleanerProperties props = cleaner.getProperties();
		props.setOmitUnknownTags(true);
		props.setUseEmptyElementTags(false);
		props.setPruneTags("script,iframe");
		props.setNamespacesAware(false);
		String cleanSrc = null;
		try {
			TagNode node = cleaner.clean(src);
			OutputStream out = new ByteArrayOutputStream();
			new SimpleXmlSerializer(props).writeToStream(node, out, charset);
			cleanSrc = out.toString();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return cleanSrc;
	}
	
	@SuppressWarnings("unchecked")
	public static void processTemplate(Element root) {
		
		List<Element> elements = new ArrayList<Element>();
		elements.add(addHtml(root));
		
		int count = 1;
		int parentNum = count;
		while (elements.size() > 0 && root.selectNodes("//*[@my_count_id]") == null) {
			
			Element temp = elements.remove(0);
			temp.addAttribute("my_count_id", Integer.toString(count++));
			temp.addAttribute("num", Integer.toString(parentNum));
			
			elements.addAll(temp.elements());
		}
	}
		
	public static Element addHtml(Element root) {
		Node headNode = root.selectSingleNode("//head");
		if (headNode.getNodeType() == Node.ELEMENT_NODE) {
			
			Element headElement = (Element) headNode;
			addLink("include/template.css", headElement);
			addScript("include/jquery.js", headElement);
			addScript("include/template.js", headElement);
		}
		return root;
	}
	public static void addScript(String src, Element element) {
		Element jsElement = element.addElement("script");
		jsElement.setText(" ");
		jsElement.addAttribute("src", src);
		jsElement.addAttribute("type", "text/javascript");
	}

	public static void addLink(String href, Element element) {
		Element cssElement = element.addElement("link");
		cssElement.addAttribute("rel", "stylesheet");
		cssElement.addAttribute("href", href);
		cssElement.addAttribute("type", "text/css");
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
			int temp = Integer.valueOf(elementList.get(i).attributeValue("num"));
			if (temp >= num) {
				reduceElement(elementList.get(i), num);
			} else {
				elementList.get(i).addAttribute("class", "optional");
			}
		}
	}

	@SuppressWarnings("unchecked")
	public static void initEelment(Element element) {
		List<Element> elementList = element.elements();
		for (int i = 0; i < elementList.size(); i++) {
			Element temp = elementList.get(i);
			temp.addAttribute("num", "1");
			/*if (null != temp.attribute("style")) {
				temp.remove(temp.attribute("style"));
			}*/
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

	@SuppressWarnings("unchecked")
	public static int getElementCount(Element element) {
		int elementCount = 1;
		List<Element> elements = element.elements();
		for (int i = 0; i < elements.size(); i++) {
			elementCount += getElementCount(elements.get(i));
		}
		return elementCount;
	}

	/*@SuppressWarnings("unchecked")
	public static Map<String, String> getExtractions(Document doc,String sign) {
		Map<String, String> map = new HashMap<String, String>();
//		File file = new File(filePath);
		if (doc != null) {
			Element root = doc.getRootElement();
//			Element root = XmlHelp.getDocumentWithClean(filePath).getRootElement();
			List<Element> list = root.selectNodes("//*[@" + sign + "]");
			for (Element element : list) {
				map.put(element.attributeValue(sign), element.attributeValue("my_count_id"));
			}
		}
		return map;
	}*/

	/*public static List<String> getData(List<String> titles, List<Element> result) {
		
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
	}*/
	
	/*public List<String> getData(List<String> titles, Map<String, String> result) {
		List<String> data = new ArrayList<String>();
		for (int i = 1; i < titles.size(); i++) {
			String title = titles.get(i);
			data.add(result.get(title));
		}
		return data;
	}*/
	
	public static void main(String[] args) {
		Document doc = getDocumentWithClean("D:/data/test1/rjxTest/http---www-sohu-com--1.html");
	}
}
