package com.buptsse.ate.utils;

import java.io.StringWriter;
import java.net.URL;

import org.htmlcleaner.CleanerProperties;
import org.htmlcleaner.HtmlCleaner;
import org.htmlcleaner.PrettyXmlSerializer;
import org.htmlcleaner.TagNode;
import org.htmlcleaner.XmlSerializer;

public class WebClipUtils extends Thread{

	public static String getUrlContent(String url) throws Exception {
		HtmlCleaner htmlCleaner = new HtmlCleaner();

		CleanerProperties props = htmlCleaner.getProperties();

		TagNode node = htmlCleaner.clean(new URL(url), "UTF-8");

		XmlSerializer xmlSerializer = new PrettyXmlSerializer(props);
		StringWriter writer = new StringWriter();
		xmlSerializer.writeXml(node, writer, "GB2312");

		return writer.toString();

	}

	/*public static Document getUrlDoc(String url) throws Exception {
		
		HtmlCleaner htmlCleaner = new HtmlCleaner();
		SAXReader saxReader = new SAXReader();
		
		CleanerProperties props = htmlCleaner.getProperties();

		TagNode node = htmlCleaner.clean(new URL(url), "UTF-8");

		XmlSerializer xmlSerializer = new PrettyXmlSerializer(props);
		StringWriter writer = new StringWriter();
		xmlSerializer.writeXml(node, writer, "UTF-8");
		Document doc = saxReader.read(new ByteArrayInputStream(writer.toString().getBytes()));
		OutputFormat format = OutputFormat.createPrettyPrint();
		format.setEncoding("UTF-8");
		XMLWriter writer1 = new XMLWriter(new FileWriter(new File("cctv.xml")), format);
		writer1.write(doc);
		writer1.close();
		return doc;
	}*/
	
	public static void main(String[] args) throws InterruptedException{
		
	}

}
