package com.mywie.control;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;

import com.mywie.model.ExtractData;
import com.mywie.operate.ExtractInfomation;
import com.mywie.operate.MatchAlign;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;


/**
 * @breif 基于一个模板文件的抽取器
 */
public class Extracter extends ExtractInfomation {
	
	private Element templateRoot;
	private MatchAlign matchAlign = new MatchAlign();
	private ExtractData extractData = new ExtractData();
	
	public Extracter(Element templateRoot) {
		this.templateRoot = templateRoot;
	}
	
	public Extracter(String templateFileName) {
		templateRoot = XmlHelp.getDocumentWithClean(templateFileName).getRootElement();
	}

	/**
	 * @breif 抽取接口
	 * @param extractFile
	 *            带抽取的文件的绝对路径
	 * @return 抽取结果的Map 信息名称-信息内容
	 */
	public Element extract(String fileName) {
		
		Element extractElement = null;
		Document doc = XmlHelp.getDocumentWithClean(fileName);
		Element root2 = doc.getRootElement();
		List<Element> result = new ArrayList<Element>();
		List<Element> matchNodes1 = new ArrayList<Element>();
		List<Element> matchNodes2 = new ArrayList<Element>();
		
		/**
		 * 进行简单树匹配，得到所要抽取的节点
		 */
		matchAlign.match(templateRoot, root2, matchNodes1, matchNodes2);
//		FileHelp.writeFile("file/tem.xml", templateRoot.asXML());
//		FileHelp.writeFile("file/tem2.xml", matchNodes2.asXML());
		
//		System.out.println(matchNodes1.size());
//		System.out.println(matchNodes2.size());
		for(Element e : matchNodes1){
			System.out.println(e.asXML());
		}
		for (int j = 0; j < matchNodes1.size(); j++) {
			if (matchNodes1.get(j).attributeValue("semantic") != null) {
				matchNodes2.get(j).addAttribute("semantic", matchNodes1.get(j).attributeValue("semantic"));
				System.out.println("matchNodes2:" + j);
				if(matchNodes1.get(j).attributeValue("block") != null){
					matchNodes2.get(j).addAttribute("block", matchNodes1.get(j).attributeValue("block"));
				}
				result.add(matchNodes2.get(j));
			}
		}
		System.out.println(result.size());
		if (result.size() > 0) {
			extractElement = extractData.createDataElement(fileName, result);
		}
		
		return extractElement;
	}

	public static void main(String[] args){
		
		String templateFile = "C:/Users/Administrator/Desktop/360/template/360buy.html";
		String extractDir = "C:/Users/Administrator/Desktop/360";
		String[] extractFiles = FileHelp.getFiles(extractDir);
		Extracter extractFile = new Extracter(templateFile);
		
		try{
			for(String extractFileName : extractFiles){
				extractFile.extract(extractFileName);
				System.out.println("extractFileName:" + extractFileName);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
