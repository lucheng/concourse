package com.mywie.core;

import java.util.List;
import java.util.Map;

import org.dom4j.Element;
import org.dom4j.Node;

import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class EditHtml {
	private Element root = null;
	//private Map<String, String> extractions;
	private Map<String, String> extractions1;
	private Map<String, String> extractions2;
	private Map<String, String> extractions3;
	private String templateFile;
//	private XmlHelp xmlHelp = new XmlHelp();

	public void edit() {
		List<Node> oldNodes = root.selectNodes("//*[@semantic]");
		for (Node node : oldNodes) {
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element element = (Element) node;
				element.remove(element.attribute("semantic"));
			}
		}
		for (String name : extractions1.keySet()) {
			Node node = root.selectSingleNode("//*[@my_count_id='"
					+ extractions1.get(name) + "']");
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element temp = (Element) node;
				temp.addAttribute("semantic", name);
			}
		}
		
		oldNodes = root.selectNodes("//*[@remove]");
		for (Node node : oldNodes) {
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element element = (Element) node;
				element.remove(element.attribute("remove"));
			}
		}
		for (String name : extractions2.keySet()) {
			Node node = root.selectSingleNode("//*[@my_count_id='"
					+ extractions2.get(name) + "']");
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element temp = (Element) node;
				temp.addAttribute("remove", name);
			}
		}
		
		oldNodes = root.selectNodes("//*[@select]");
		for (Node node : oldNodes) {
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element element = (Element) node;
				element.remove(element.attribute("select"));
			}
		}
		for (String name : extractions3.keySet()) {
			Node node = root.selectSingleNode("//*[@my_count_id='"
					+ extractions3.get(name) + "']");
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element temp = (Element) node;
				temp.addAttribute("select", name);
			}
		}
		
		List<Node> nodes=root.selectNodes("//script");
		for (Node node:nodes){
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element temp = (Element) node;
				temp.setText("");
			}
		}
		
		/*nodes = root.selectNodes("//*");
		for (Node node : nodes){
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element temp = (Element) node;
				temp.remove(temp.attribute("my_count_id"));
			}
		}*/
		
		FileHelp.writeFile(templateFile + ".template", root.getDocument().asXML());
//		XmlHelp.writeDocument(templateFile, root.getDocument());
	}

	public Map<String, String> getExtractions(String sign) {
		if (sign.compareTo("semantic")==0) return extractions1;
		if (sign.compareTo("remove")==0) return extractions2;
		if (sign.compareTo("select")==0) return extractions3;
		return null;
	}

	public void setExtractions(Map<String, String> extractions,String sign) {
		if (sign.compareTo("semantic")==0) this.extractions1 = extractions;
		if (sign.compareTo("remove")==0) this.extractions2 = extractions;
		if (sign.compareTo("select")==0) this.extractions3 = extractions;
	}

	public String getTemplateFile() {
		return templateFile;
	}

	public void setTemplateFile(String templateFile) {
		root = XmlHelp.getDocumentWithClean(templateFile).getRootElement();
		this.templateFile = templateFile;
	}
}
