package com.buptsse.wie;

import java.io.*;
import java.util.*;

import org.dom4j.*;

import com.buptsse.wie.ExtractionResult;
import com.buptsse.wie.core.Matcher;
import com.buptsse.wie.models.SemanticTag;
import com.buptsse.wie.utilities.XmlHelp;

/**
 * 内容抽取类
 * 
 */

public class Extractor {

	private String templateFile;
	
	public Extractor(File templateFile) {
		// TODO Auto-generated constructor stub
		this.templateFile = templateFile.getAbsolutePath();
	}
	
	public ExtractionResultCollection extract(File[] pages) {
		return extract(pages, null);
	}
	
	public void extractAsync(File[] pages, IAsyncMonitor monitor) {
		if (monitor == null) {
			return;
		}
		
		final File[] fPages = pages;
		final IAsyncMonitor fMonitor = monitor;
		
		new Thread() {
			public void run() {
				if (fMonitor.isCancellationRequested()) {
					fMonitor.onCompleted(CompletionType.Cancelled, null, null);
				} else {
					try {
						extract(fPages, fMonitor);
					} catch (Exception e) {
						fMonitor.onCompleted(CompletionType.Exception, e, null);
					}
				}
			}
		}.start();
	}
	
	/**
	 * 网页内容抽取方法
	 * 
	 * @param pages
	 * @param monitor
	 * @return
	 */
	private ExtractionResultCollection extract(File[] pages, IAsyncMonitor monitor) {
		
		if (monitor != null && monitor.isCancellationRequested()) {
			monitor.onCompleted(CompletionType.Cancelled, null, null);
			return null;
		}
		
		ExtractionResultCollection rc = new ExtractionResultCollection();
		Element tempRoot = XmlHelp.getDocument(templateFile).getRootElement();
		Matcher match = new Matcher();
		Map<String, SemanticTag> tempTags = getTags(tempRoot);
		
		for (int i = 0; i < pages.length; i++) {
			
			if (monitor != null && monitor.isCancellationRequested()) {
				monitor.onCompleted(CompletionType.Cancelled, null, null);
				return null;
			}
			
			String file = pages[i].getAbsolutePath();
			
			ExtractionResult exResult = new ExtractionResult(file);
			
			Document doc = XmlHelp.getHtmlDocument(file);
			
			Element fileRoot = doc.getRootElement();
			
			List<Element> matchNodes1 = new ArrayList<Element>();
			List<Element> matchNodes2 = new ArrayList<Element>();
			
			match.match(tempRoot, fileRoot, matchNodes1, matchNodes2);
			
			for (int j = 0; j < matchNodes1.size(); j++) {
				String semantic = matchNodes1.get(j).attributeValue("semantic");
				if (semantic != null) {
					
					Element fileNode = matchNodes2.get(j);
					
					if (tempTags.get(semantic).getBehavior().equalsIgnoreCase("multi")) {
						String path = fileNode.getPath();
						List<Element> nodes = fileRoot.selectNodes(path);
						for (Element node : nodes) {
							if (NodeStructureComparer.compare(fileNode, node)) {
								exResult.addContent(semantic,
										new ExtractionContent(node));
							}
						}
					} else {
						exResult.addContent(semantic, new ExtractionContent(fileNode));
					}
				}
			}
			
			if (exResult.tags().size() > 0) {
				rc.addResult(exResult);
			}
			
			if (monitor != null) {
				monitor.onProgressChanged((int)(((double)(i + 1) / pages.length) * 100));
			}
		}
		
		if (monitor != null) {
			monitor.onCompleted(CompletionType.Normal, null, rc);
		}
		
		return rc;
	}
	
	/**
	 * 取得标注的标签
	 * 
	 * @param root
	 * @return
	 */
	private Map<String, SemanticTag> getTags(Element root) {
		HashMap<String, SemanticTag> map = new HashMap<String, SemanticTag>();
		
		List<Element> list = root.selectNodes("//*[@semantic]");
		for (Element element : list) {
			SemanticTag data = new SemanticTag();
			data.setSemantic(element.attributeValue("semantic"));
			data.setWindowStatus(element.attributeValue("my_count_id"));
			data.setBehavior(element.attributeValue("wie_behave"));
			data.setBlock("");
			
			map.put(data.getSemantic(), data);
		}
		
		return map;
	}
}

class NodeStructureComparer {
	public static boolean compare(Element node1, Element node2) {
		if (!node1.getName().equals(node2.getName())) {
			return false;
		}
		
		List<Attribute> attr1 = node1.attributes();
		List<Attribute> attr2 = node2.attributes();
		trimAttributes(attr1);
		trimAttributes(attr2);
		
		if (!compareAttributes(attr1, attr2)) {
			return false;
		}
		
		return comparePath(node1, node2);
	}
	
	private static void trimAttributes(List<Attribute> attrs) {
		List<Attribute> toRm = new ArrayList<Attribute>();
		
		for (Attribute attr : attrs) {
			if (attr.getName().equals("num") ||
				attr.getName().equals("my_count_id") ||
				attr.getName().equals("semantic")) {
				
				toRm.add(attr);
			}
		}
		
		for (Attribute attr : toRm) {
			attrs.remove(attr);
		}
	}
	
	private static boolean compareAttributes(List<Attribute> attrs1, List<Attribute> attrs2) {
		if (attrs1.size() != attrs2.size()) {
			return false;
		}
		
		int match = 0;
		
		for (Attribute attr : attrs1) {
			for (Attribute attr2 : attrs2) {
				if (attr.getName().equals(attr2.getName())) {
					match++;
				}
			}
		}
		
		if (match != attrs1.size()) {
			return false;
		}

		return true;
	}
	
	private static boolean comparePath(Element node1, Element node2) {
		while (node1 != null) {
			if (node2 == null) {
				return false;
			}
			
			String sig1 = node1.getName();
			String sig2 = node2.getName();
			
			for (Attribute attr : (List<Attribute>)node1.attributes()) {
				if (attr.getName().equalsIgnoreCase("class")) {
					sig1 += attr.getValue();
				}
			}
			
			for (Attribute attr : (List<Attribute>)node2.attributes()) {
				if (attr.getName().equalsIgnoreCase("class")) {
					sig2 += attr.getValue();
				}
			}
			
			if (!sig1.equals(sig2)) {
				return false;
			}
			
			node1 = node1.getParent();
			node2 = node2.getParent();
		}
		
		return node2 == null;
	}
}
