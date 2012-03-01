package com.xmlparser;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import net.sf.json.JSONObject;

public class XmlParser {

	public static void main(String[] args) {

		try {
			Records records = new Records();
			List<RecordBean> recordList = new ArrayList<RecordBean>();

			SAXReader saxReader = new SAXReader();
			Document document = saxReader.read("test.xml");
			Element root = document.getRootElement();
			List<Element> elements = root.selectNodes("//RECORD");
			System.out.println(elements.size());
			for (Element element : elements) {
				RecordBean recordBean = new RecordBean();
				recordBean.setAuthor(element.elementText("FRatingNum"));
				recordBean.setImage(element.elementText("FDesc"));
				recordBean.setTitle(element.elementText("FTitle"));
				recordBean.setItemId(element.elementText("FItemId"));
				recordList.add(recordBean);

			}
			records.setRecords(recordList);
			JSONObject jsonObject = JSONObject.fromObject(records);
			System.out.println(jsonObject.toString());
		} catch (DocumentException e) {
			e.printStackTrace();
		}

	}
}
