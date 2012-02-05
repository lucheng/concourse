package com.mywie.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.dom4j.Document;
import org.dom4j.Element;

import com.mywie.model.MarkData;
import com.mywie.operate.ExtractInfomation;
import com.mywie.operate.TemplateOperate;
import com.mywie.utils.XmlHelp;


/**
 * @breif 基于一个模板文件的抽取器
 */
public class Extracter extends ExtractInfomation {
	
	private Element templateRoot;
	private Document markedDoc;

	/**
	 * @breif 构造函数
	 * @param templateFile 模板文件的绝对路径
	 */
	
	public Extracter(String templateFileName, String markedFileName) {
		templateRoot = XmlHelp.getDocument(templateFileName).getRootElement();
		markedDoc = XmlHelp.getDocument(markedFileName);
	}

	/**
	 * @breif 抽取接口
	 * @param extractFile
	 *            带抽取的文件的绝对路径
	 * @return 抽取结果的Map 信息名称-信息内容
	 */
	
	public List<MarkData> extract(String fileName) {
		
		List<MarkData> result = null;
//		TemplateOperate templateOperate = new TemplateOperate();
		Document rawHtmlDoc = XmlHelp.getDocumentWithClean(fileName);
		
//		Document doc = templateOperate.preTemplate(markedDoc, rawHtmlDoc);
		
		if(rawHtmlDoc != null){
			Element rawRoot = rawHtmlDoc.getRootElement();
			result = getExtractResult(rawRoot);// 执行结构化信息抽取
			/*for (String key : result.keySet()) {
				System.out.println((key + ": " + result.get(key) + "\n"));
			}*/
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
	 * @param templateRoot 模板根结点
	 * @param extractRoot 抽取网页根结点
	 * @return
	 */
	public List<MarkData> getExtractResult(Element extractRoot) {
		
		List<MarkData> result = new ArrayList<MarkData>();
		try {
			
			List<Element> extracts = extract(templateRoot, extractRoot);
			
			for (Element element : extracts) {
				/*String text;
				if ("a".equalsIgnoreCase(element.getName())) {
					text = element.getStringValue();
				} else if ("img".equalsIgnoreCase(element.getName())) {
					text = element.attributeValue("src");
				} else{
					text = element.getStringValue();
				}*/
				MarkData data = new MarkData();
				element.attribute("block");
				result.add(data);
//				result.put(element.attributeValue("semantic"), element.getStringValue());
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
