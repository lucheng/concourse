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
 * 提供根据抽取模板对网页数据进行数据抽取的方法，
 * 提供同步与异步抽取两种抽取形式
 * 
 */

public class Extractor {

	// 抽取模板
	private String templateFile;
	
	/**
	 * 构造方法，初始化模板文件
	 * 
	 * @param templateFile
	 */
	public Extractor(File templateFile) {
		this.templateFile = templateFile.getAbsolutePath();
	}
	
	public ExtractionResultCollection extract(File[] pages) {
		return extract(pages, null);
	}
	
	/**
	 * 开启线程进行数据抽取
	 * 
	 * @param pages 所要进行抽取的网页文件名数组
	 * @param monitor 监听器
	 */
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
						// 调用抽取方法，利用抽取模板进行抽取操作
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
	 * @param pages 所要进行抽取的网页文件名数组
	 * @param monitor 监听器
	 * @return 抽取结果集合
	 */
	private ExtractionResultCollection extract(File[] pages, IAsyncMonitor monitor) {
		
		if (monitor != null && monitor.isCancellationRequested()) {
			monitor.onCompleted(CompletionType.Cancelled, null, null);
			return null;
		}
		// 初始化
		ExtractionResultCollection rc = new ExtractionResultCollection();
		Element tempRoot = XmlHelp.getDocument(templateFile).getRootElement();
		Matcher match = new Matcher();
		Map<String, SemanticTag> tempTags = getTags(tempRoot);
		
		// 循环抽取文件数组中的文件
		for (int i = 0; i < pages.length; i++) {
			
			// 如果用户取消，则返回空
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
			
			// 将模板文件与抽取文件进行匹配，取出相同的节点
			match.match(tempRoot, fileRoot, matchNodes1, matchNodes2);
			
			// 循环抽取文件，取出带有标注标签的节点
			for (int j = 0; j < matchNodes1.size(); j++) {
				String semantic = matchNodes1.get(j).attributeValue("semantic");
				
				// 如果文件中包含的标注的结点
				if (semantic != null) {
					
					Element fileNode = matchNodes2.get(j);
					
					if (tempTags.get(semantic).getBehavior().equalsIgnoreCase("multi")) {
						String path = fileNode.getPath();
						List<Element> nodes = fileRoot.selectNodes(path);
						for (Element node : nodes) {
							if (NodeStructureComparer.compare(fileNode, node)) {
								exResult.addContent(semantic, new ExtractionContent(node));
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
	 * 查询根节点，取得带有标注的标签名
	 * 
	 * @param root 网页dom树的根节点
	 * @return 包含的有标签的map集合
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

/**
 * 节点结构比较类
 */
class NodeStructureComparer {
	
	/**
	 * 判断节点的结构是否相同
	 * 
	 * @param node1 dom树节点
	 * @param node2 dom树节点
	 * @return
	 */
	public static boolean compare(Element node1, Element node2) {
		if (!node1.getName().equals(node2.getName())) {
			return false;
		}
		
		List<Attribute> attr1 = node1.attributes();
		List<Attribute> attr2 = node2.attributes();
		trimAttributes(attr1);
		trimAttributes(attr2);
		
		// 判断属性是否相同
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
	
	/**
	 * 判断传入的节点的属性是否相同
	 * 
	 * @param attrs1 传入的做比较的第一个节点的属性集
	 * @param attrs2 传入的做比较的第二个节点的属性集
	 * @return 是否相同
	 */
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
	
	/**
	 * 判断两个节点的路径是否相同
	 * 
	 * @param node1 传入的做比较的第一个节点
	 * @param node2 传入的做比较的第二个节点
	 * @return 是否相同
	 */
	private static boolean comparePath(Element node1, Element node2) {
		while (node1 != null) {
			
			if (node2 == null) {
				return false;
			}
			
			String sig1 = node1.getName();
			String sig2 = node2.getName();
			
			// 取得第一个节点的路径字符串
			for (Attribute attr : (List<Attribute>)node1.attributes()) {
				if (attr.getName().equalsIgnoreCase("class")) {
					sig1 += attr.getValue();
				}
			}
			// 取得第二个节点的路径字符串
			for (Attribute attr : (List<Attribute>)node2.attributes()) {
				if (attr.getName().equalsIgnoreCase("class")) {
					sig2 += attr.getValue();
				}
			}
			
			// 判断是否相同
			if (!sig1.equals(sig2)) {
				return false;
			}
			
			node1 = node1.getParent();
			node2 = node2.getParent();
		}
		
		return node2 == null;
	}
}
