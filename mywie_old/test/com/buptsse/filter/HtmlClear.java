package com.buptsse.filter;

import java.io.File;
import java.io.IOException;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.mywie.utils.XmlHelp;

public class HtmlClear {
	
	public static void clear(String fileName) throws TransformerException {
		
		XmlHelp.cleanHtml(fileName + ".xml");
		
		DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
		System.out.println(dbf.getClass().getName());
		try {
			DocumentBuilder db = dbf.newDocumentBuilder();
			System.out.println(db.getClass().getName());
			File file = new File(fileName + ".xml.temp");
			Document doc = db.parse(file);
			NodeList n1 = doc.getElementsByTagName("div");
			int len = n1.getLength();
			for (int i = 0; i < len; i++) {
				Element eltStu = (Element) n1.item(i);
				if(eltStu == null){
					break;
				}
				String classStr = eltStu.getAttribute("class");
				if (classStr.equals("content")) {
					Node P = eltStu.getParentNode();
//					System.out.println(P.getTextContent());
//					System.out.println(P.getTextContent());
					NamedNodeMap attributes = eltStu.getAttributes();
					Element n = doc.createElement("div");
					for (int j = 0; j < attributes.getLength(); j++) {
						Node attribute = attributes.item(j);
						String attributeName = attribute.getNodeName();
						System.out.println("属性名:" + attributeName);
						String attributeValue = attribute.getNodeValue();
						System.out.println("属性值:" + attributeValue);
						n.setAttribute(attributeName, "content");
					}
					String content = eltStu.getTextContent();
					n.setTextContent(content);
					P.replaceChild(n, eltStu);
//					break;
				}
			}
			// 保存修改的xml文件
			TransformerFactory tFactory = TransformerFactory.newInstance();
	        Transformer transformer = tFactory.newTransformer();
	        transformer.setOutputProperty("encoding", "GBK");
	        DOMSource source = new DOMSource(doc);
	        StreamResult result = new StreamResult(new File(fileName + ".final"));
	        transformer.transform(source, result);
	        XmlHelp.cleanHtml(fileName + ".final");
		} catch (ParserConfigurationException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public static void main(String[] args) {
		try {
//			clear();
		} catch (Exception e) {
			
			e.printStackTrace();
		}
	}

}
