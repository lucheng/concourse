package com;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

/**
 * 测试
 * 
 * @author 佛山无影脚
 * @version 1.0 Jul 7, 2008 4:35:49 PM
 */
public class ManTest {
	/**
	 * 创建man节点 <man><id>1</id><name>佛山无影脚</name></man>
	 * 
	 * @param id
	 * @param name
	 * @return
	 */
	public Element createManElement(Long id, String name) {
		Element manElement = DocumentHelper.createElement("man");
		manElement.addElement("id").addText(id.toString());
		manElement.addElement("name").addText(name);
		return manElement;
	}

	/**
	 * 数据写入xml文件
	 * 
	 * @param filePath
	 *            目标xml文件的存放路径
	 * @return
	 */
	public boolean writeXML(String filePath) {
		XMLWriter out;
		try {

			/*
			 * 创建XMLWriter对象，设置XML编码，解决中文问题。
			 */
			OutputFormat outputFormat = OutputFormat.createPrettyPrint();
			outputFormat.setEncoding("GBK");
			out = new XMLWriter(new FileWriter(filePath), outputFormat);

			out.startDocument();
			Element rootElement = DocumentHelper.createElement("datas");
			out.writeOpen(rootElement);

			/*
			 * 向mans节点写入子节点
			 */
			for (int i = 0; i < 1000000; i++) {
				Element man = this.createManElement(new Long(i), "shuhang" + i);
				out.write(man);
				System.out.println(" the loop index is : " + i);
			}

			out.writeClose(rootElement);
			out.endDocument();

			out.close();
			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		} catch (SAXException e) {
			e.printStackTrace();
			return false;
		}
	}

	/**
	 * 从xml文件中读取数据，并将数据写入Access数据
	 * 
	 * @param filePath
	 *            xml文件的存放路径
	 * @return
	 */
	public boolean readXML(String filePath) {

		ManElementHandler manElementHandler = new ManElementHandler(
				"F://dom4j//xmlTest.mdb");
		SAXReader reader = new SAXReader();
		reader.addHandler("/mans/man", manElementHandler);
		Document document = null;
		try {
			File file = new File(filePath);
			document = reader.read(file);
		} catch (DocumentException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static void main(String[] args) {
//		XMLReader reader = null;
//		long startTime = System.currentTimeMillis();
//		ManTest mantest = new ManTest();
//
//		mantest.writeXML("file/mans.xml");
//		mantest.readXML("file/mans.xml");

//		long endTime = System.currentTimeMillis();
//		System.out.println(" is end! the millis is : " + (endTime - startTime));

		
		int j = 0;
		for(int i=0; i<100; i++) {
		  j = j++;
		}

		System.out.println(j);
	}
}
// *************************************************************************************************************************