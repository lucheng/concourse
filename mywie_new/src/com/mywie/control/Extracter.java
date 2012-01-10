package com.mywie.control;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;

import com.mywie.operate.ExtractInfomation;
import com.mywie.operate.TemplateOperate;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;


/**
 * @breif ����һ��ģ���ļ��ĳ�ȡ��
 */
public class Extracter extends ExtractInfomation {
	
	private Element templateRoot;
	private Document markedDoc;

//	private XmlHelp xmlHelp = new XmlHelp();
	/**
	 * @breif ���캯��
	 * @param templateFile ģ���ļ��ľ���·��
	 */
	
	public Extracter(String templateFileName, String markedFileName) {
		templateRoot = XmlHelp.getDocument(templateFileName).getRootElement();
		markedDoc = XmlHelp.getDocument(markedFileName);
	}

	/**
	 * @breif ��ȡ�ӿ�
	 * @param extractFile
	 *            ����ȡ���ļ��ľ���·��
	 * @return ��ȡ�����Map ��Ϣ����-��Ϣ����
	 */
	
	public Map<String, String> extract(String fileName) {
		
		Map<String, String> result = null;
		TemplateOperate templateOperate = new TemplateOperate();
		Document rawHtmlDoc = XmlHelp.getDocumentWithClean(fileName);
		
		Document doc = templateOperate.preTemplate(markedDoc, rawHtmlDoc);
		
		if(doc != null){
			Element rawRoot = doc.getRootElement();
			result = getExtractResult(rawRoot);// ִ�нṹ����Ϣ��ȡ
			for (String key : result.keySet()) {
				System.out.println((key + ": " + result.get(key) + "\n"));
			}
		}
		return result;
	}
	/*public Map<String, String> extract(String extractFile) {
		
		Map<String, String> result = new HashMap<String, String>();
		
		try {
			
			Document doc = xmlHelp.getDocumentWithClean(extractFile);
			Element extractRoot = doc.getRootElement();
			List<Element> extracts = extract(templateRoot, extractRoot);
			
			for (Element element : extracts) {
				String text;
				if ("a".equalsIgnoreCase(element.getName())) {
//					text = "curl:" + element.attributeValue("href") + ",text:" + element.getStringValue();
					text = element.getStringValue();
				} else if ("img".equalsIgnoreCase(element.getName())) {
//					text = "curl:" + element.attributeValue("href") + ",text:" + element.getStringValue();
					text = element.attributeValue("src");
				} else {
					text = element.getStringValue();
				}
				result.put(element.attributeValue("semantic"), text);
			}
			result.put("allPageJsonHtml", extractRoot.asXML());
			result.put("allPageJsonTitle", extractRoot.selectSingleNode("//title").getText());
			extracts = null;
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}*/

	/**
	 * @param templateRoot ģ������
	 * @param extractRoot ��ȡ��ҳ�����
	 * @return
	 */
	public Map<String, String> getExtractResult(Element extractRoot) {
		
		Map<String, String> result = new HashMap<String, String>();
		try {
			
			List<Element> extracts = extract(templateRoot, extractRoot);
			
			FileHelp.writeFile("file/templateRoot.xml", templateRoot.asXML());
			FileHelp.writeFile("file/extractRoot.xml", extractRoot.asXML());
//			System.out.println(templateRoot.asXML());
//			System.out.println(extractRoot.asXML());
			System.out.println(extracts.size());
			
			for (Element element : extracts) {
				String text;
				if ("a".equalsIgnoreCase(element.getName())) {
					text = element.getStringValue();
				} else if ("img".equalsIgnoreCase(element.getName())) {
					text = element.attributeValue("src");
				} else{
					text = element.getStringValue();
				}
				result.put(element.attributeValue("semantic"), text);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public static void main(String[] args){
		
		String template = "template3-1.htm";
		String markedFileName = "template3-1.htm";
		String extractFileName = "template3-1.htm";
		
		Extracter extractFile = new Extracter(template, markedFileName);
		extractFile.extract(extractFileName);
		
	}
}
