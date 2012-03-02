package com.mywie.core;

import java.util.List;

import org.dom4j.Element;
import org.dom4j.Node;

import com.mywie.model.MarkData;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class EditHtml {
	private Element root = null;
	private String templateFile;
	private String saveFileName;

	public String getSaveFileName() {
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName) {
		this.saveFileName = saveFileName;
	}

	public void edit(List<MarkData> markDatas) {
		
		List<Node> oldNodes = root.selectNodes("//*[@semantic]");
		for (Node node : oldNodes) {
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element element = (Element) node;
				element.remove(element.attribute("semantic"));
				element.remove(element.attribute("block"));
				element.remove(element.attribute("num"));
			}
		}
		for (MarkData data : markDatas) {
			Node node = root.selectSingleNode("//*[@my_count_id='" + data.getWindowStatus() + "']");
			if (node != null && Node.ELEMENT_NODE == node.getNodeType()) {
				Element temp = (Element) node;
				temp.addAttribute("semantic", data.getSemantic());
				
				if(data.getBlock() != null && !data.getBlock().equals("")){
					temp.addAttribute("block", data.getBlock());
				}
			}
		}
		/**
		 * 循环加上一个父子结点的标志
		 */
		
		String content = root.getDocument().asXML();
		content.replace("<?xml version=\"1.0\" encoding=\"GBK\"?>", "");
		FileHelp.writeFile(saveFileName, content);
	}

	public String getTemplateFile() {
		return templateFile;
	}

	public void setTemplateFile(String templateFile) {
		System.out.println("TemplateFile is :" + templateFile);
		root = XmlHelp.getDocumentWithClean(templateFile).getRootElement();
		this.templateFile = templateFile;
	}
}
