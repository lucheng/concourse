package com.mywie.gui.xmlview;

import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Element;

import com.mywie.core.HtmlMatch;
import com.mywie.utils.XmlHelp;

public class Converters {
	private static Logger logger = Logger.getLogger(HtmlMatch.class.getName());
	private static XmlHelp xmlHelp = new XmlHelp();
	
	public static ResultForm converter(String filePath) {
		ResultForm resultForm = new ResultForm();
		Element root = xmlHelp.getDocument(filePath).getRootElement();

		Element titlesElement = root.element("titles");
		if (titlesElement == null) {
			logger.error(filePath + " loaded error!");			
			return null;
		}

		List<Element> titleList = titlesElement.elements("title");
		resultForm.getTitles().add("ÐòºÅ");
		for (Element title : titleList) {			
			resultForm.getTitles().add(title.getTextTrim());
		}
		Element datasElement = root.element("datas");
		if (datasElement == null) {
			logger.error(filePath + " loaded error!");			
			return null;
		}

		List<Element> datas = datasElement.elements("data");
		if (datas == null) {
			logger.error(filePath + " loaded error!");			
			return null;
		}
		int num = 0;
		for (Element element : datas) {
			List<Element> valueList = element.elements("value");
			Data data = new Data();
			data.getValues().add(Integer.toString(++num));
			for (Element value : valueList) {
				data.getValues().add(value.getTextTrim());
			}
			resultForm.getDatas().add(data);
		}

		return resultForm;

	}
}
