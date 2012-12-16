package com.buptsse.wie.utilities;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

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

/**
 * XML文件操作类
 * 包括对xml文件的各种操作方法
 */
public class XmlHelp {

	private static SAXReader xmlReader = new SAXReader();

	/**
	 * xml转换方法，将html转化成xml格式，并返回document对象
	 * 
	 * @param aFile html文件的路径
	 * @return 		document对象
	 * @throws DocumentException document异常
	 */
	public Document parseWithSAX(File aFile) throws DocumentException {
		return xmlReader.read(aFile);
	}

	/**
	 * 根据html文件的路径，生成Document对象返回
	 * 
	 * @param filePath 	html文件的路径
	 * @return			Document对象
	 */
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

	/**
	 * 根据html文件的路径，生成Document对象返回，
	 * 并将生成的临时文件删除
	 * 
	 * @param filePath	html文件的路径
	 * @return			Document对象
	 */
	public static Document getHtmlDocument(String filePath) {
		
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

	/**
	 * 根据html文件名的数组，生成Document对象返回，得到输入文件集的根节点
	 * 
	 * @param files	html文件名的数组
	 * @return		转化后的Document对象的根节点
	 * 
	 */
	public static List<Element> getRootList(String files[]) {
		List<Element> roots = new ArrayList<Element>();
		// FileHelp.sortFiles(files);
		for (String filePath : files) {
			Document doc = getHtmlDocument(filePath);
			Element root = doc.getRootElement();
			initEelment(root);
			roots.add(root);
		}
		return roots;
	}
	
	/**
	 * 根据Document的根节点的数组，对dom树进行处理后，
	 * 返回处理后的dom树的根节点
	 * 
	 * @param rawRoots	Document的根节点的数组
	 * @return			处理后Document的根节点的数组
	 */
	public static List<Element> getRootList(List<Element> rawRoots) {
		List<Element> roots = new ArrayList<Element>();
		// FileHelp.sortFiles(files);
		for (Element srcRoot : rawRoots) {
			initEelment(srcRoot);
			roots.add(srcRoot);
		}
		return roots;
	}

	/**
	 * 清理不规的html文件，返回Document对象
	 * 
	 * @param fileName	html文件
	 * @return			Document对象
	 */
	public static Document cleanHtml(String fileName) {
		
		File file = new File(fileName);
		File temp = new File(fileName + ".temp");
		
		HtmlCleaner cleaner = new HtmlCleaner();
		CleanerProperties props = cleaner.getProperties();
		
//		props.setUseEmptyElementTags(false);
//		props.setOmitUnknownTags(true);
		props.setPruneTags("script,style,link,iframe,input,textarea");
//		props.setPruneTags("script");
//		props.setNamespacesAware(false);
        
		
		TagNode node;
		try {
			String charset = new CharsetDetector(CharsetDetector.CHINESE).detectFileCharset(file);
			if (charset == null) {
				charset = "gb2312";
			}
			
			node = cleaner.clean(file, charset);
			OutputStream out = new FileOutputStream(temp);
			new SimpleXmlSerializer(props).writeToStream(node, out, charset);
			out.close();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	
		Element tmp = null;
		try{
			tmp = getDocument(fileName+".temp").getRootElement();
			processTemplate(tmp);
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
		return tmp.getDocument();
	}
	
	/*public Document parseWithSAX(String htmlSrc) throws DocumentException {
		return DocumentHelper.parseText(htmlSrc);
	}*/
	
	/*public String cleanSrc(String src, String charset) {
		
		HtmlCleaner cleaner = new HtmlCleaner();
		CleanerProperties props = cleaner.getProperties();
		props.setUseEmptyElementTags(false);
		props.setOmitUnknownTags(true);
		props.setPruneTags("script,style,link,iframe,input,textarea");
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
	}*/
	
	/**
	 * 给每个节点添加my_count_id属性，并给每个my_count_id编号
	 * 
	 * @param root	Document的根节点
	 */
	@SuppressWarnings("unchecked")
	public static void processTemplate(Element root) {
		
		List<Element> elements = new ArrayList<Element>();
		elements.add(addHtml(root));
		
		int count = 1;
		while (elements.size() > 0 && root.selectNodes("//*[@my_count_id]") == null) {
			
			Element temp = elements.remove(0);
			temp.addAttribute("my_count_id", Integer.toString(count++));
			elements.addAll(temp.elements());
		}
	}
		
	/**
	 * 在head中给文件添加css与js文件
	 * 
	 * @param root 	Document的根节点
	 * @return		添加脚本后的Document的根节点
	 */
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
	
	
	/**
	 * 写入XML文件
	 * 
	 * @param path		输入的文件路径
	 * @param document	Document对象
	 */
	public static void writeDocument(String path, Document document) {
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setXHTML(true);
		format.setEncoding(document.getXMLEncoding());
		format.setIndent(true);
		format.setNewlines(true);
		format.setTrimText(true);
		format.setExpandEmptyElements(true);
		XMLWriter writer;
		try {
			writer = new XMLWriter(new FileOutputStream(path), format);
			writer.write(document);
			writer.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 复制节点
	 * 
	 * @param nodes1	复制的源节点数组
	 * @param nodes2	复制的目标节点数组
	 */
	public static void copy(List<Element> nodes1, List<Element> nodes2) {
		nodes2.clear();
		for (int i = 0; i < nodes1.size(); i++) {
			nodes2.add(nodes1.get(i));
		}
	}

	/**
	 * 去除树中多会的节点，将其设置成不可见
	 * 
	 * @param element	根节点
	 * @param num		节点数
	 */
	@SuppressWarnings("unchecked")
	public static void reduceElement(Element element, int num) {
		List<Element> elementList = element.elements();
//		List<Element> elementList2 = new ArrayList<Element>();
		for (int i = 0; i < elementList.size(); i++) {
			int temp = Integer.valueOf(elementList.get(i).attributeValue("num"));
			if (temp >= num) {
				reduceElement(elementList.get(i), num);
			} else {
				elementList.get(i).addAttribute("class", "optional");
			}
		}
	}

	/**
	 * 初始化节点，去除链接
	 * 
	 * @param element	根节点
	 */
	@SuppressWarnings("unchecked")
	public static void initEelment(Element element) {
		List<Element> elementList = element.elements();
		for (int i = 0; i < elementList.size(); i++) {
			Element temp = elementList.get(i);
			temp.addAttribute("num", "1");
			
			if (null != temp.attribute("href")) {
				temp.attribute("href").setValue("#");
			}
			initEelment(elementList.get(i));
		}
	}

	/*public static List<Node> getNodeList(Element e) {
		List<Node> nodeList = new ArrayList<Node>();
		for (int i = 0; i < e.nodeCount(); i++) {
			if (isLegal(e.node(i))) {
				nodeList.add(e.node(i));
			}
		}
		return nodeList;
	}*/

	/**
	 * 判断节点是否合法
	 * 
	 * @param node	被判断结点
	 * @return		是否合法
	 */
	public static boolean isLegal(Node node) {
		return null != node.getName()
				|| !"".equals(node.getStringValue().trim());
	}

	/*public static int getNodeCount(Node node) {
		int nodeCount = 1;
		if (isLegal(node) == false) {
			return 0;
		}
		if (node.getNodeType() == Node.ELEMENT_NODE) {
			Element element = (Element) node;
			if (NodeComparer.isListNode(element)) {
				nodeCount += 3;
			} else {
				for (int i = 0; i < element.nodeCount(); i++) {
					nodeCount += getNodeCount(element.node(i));
				}
			}
		}
		return nodeCount;
	}*/

	/**
	 * 统计节点中子节点Text节点的数量
	 * @param node	被统计节点
	 * @return		Text节点的数量
	 */
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

	/**
	 * 统计节点的所有子节点数
	 * @param element	根节点
	 * @return			子节点数
	 */
	@SuppressWarnings("unchecked")
	public static int getElementCount(Element element) {
		int elementCount = 1;
		List<Element> elements = element.elements();
		for (int i = 0; i < elements.size(); i++) {
			elementCount += getElementCount(elements.get(i));
		}
		return elementCount;
	}
}
