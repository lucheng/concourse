package com.mywie.core;

import java.util.List;
import java.util.Map;

import org.dom4j.Element;
import org.dom4j.Node;

import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class EditHtml {
	private Element root = null;
	private Map<String, String> extractions;
	private String templateFile;

	@SuppressWarnings("unchecked")
	public void edit() {
		List<Node> oldNodes = root.selectNodes("//*[@semantic]");
		for (Node node : oldNodes) {
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element element = (Element) node;
				element.remove(element.attribute("semantic"));
			}
		}
		for (String name : extractions.keySet()) {
			Node node = root.selectSingleNode("//*[@my_count_id='"
					+ extractions.get(name) + "']");
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element temp = (Element) node;
				temp.addAttribute("semantic", name);
			}
		}
		List<Node> nodes=root.selectNodes("//script");
		for (Node node:nodes){
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element temp = (Element) node;
				temp.setText("");
			}
		}
		FileHelp.writeFile(templateFile, root.getDocument().asXML());
//		XmlHelp.writeDocument(templateFile, root.getDocument());
	}

	public Map<String, String> getExtractions() {
		return extractions;
	}

	public void setExtractions(Map<String, String> extractions) {
		this.extractions = extractions;
	}

	public String getTemplateFile() {
		return templateFile;
	}

	public void setTemplateFile(String templateFile) {
		root = XmlHelp.getDocument(templateFile).getRootElement();
		this.templateFile = templateFile;
	}
}
