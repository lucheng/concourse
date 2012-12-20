package com.buptsse.wie;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.Node;

import com.buptsse.wie.core.Matcher;
import com.buptsse.wie.utilities.XmlHelp;

/**
 * ģ��������
 * 
 * ����ģ�����ɣ���Ҫ���еĲ�����Ҫ�У�����һ����ҳ���ݼ���
 * ģ�����ɷ����������û���������ҳ���ƶȽ�����ҳģ��ľۺ�ƥ�䣬
 * Ȼ������ƶȴ�����ֵ����ҳ������������������վۺϳ�һ��ģ��
 * 
 */
public class TemplateGenerator extends GeneratorOld {
	
	/**
	 * ���췽��
	 * 
	 * ������ҳ���ڵ��ļ��������ƶȣ�����ģ��
	 * 
	 * @param outputFolder	��ҳ���ڵ��ļ���
	 * @param simIndex		���ƶ�
	 */
	public TemplateGenerator(File outputFolder, double simIndex) {
		this.setDirectory(outputFolder.getAbsolutePath());
		this.setRate(simIndex);
	}
	
	public void generate(File[] pages) {
		generate(pages, null);
	}
	
	/**
	 * �첽ʵ��ģ������
	 * 
	 * @param pages		�ļ�������
	 * @param monitor	������
	 */
	public void generateAsync(File[] pages, IAsyncMonitor monitor) {
		if (monitor == null) {
			return;
		}
		
		final File[] fPages = pages;
		final IAsyncMonitor fMonitor = monitor;
		
		// ����һ���µ��̣߳�����ģ���ļ�
		new Thread() {
			public void run() {
				if (fMonitor.isCancellationRequested()) {
					fMonitor.onCompleted(CompletionType.Cancelled, null, null);
				} else {
					try {
						generate(fPages, fMonitor);
					} catch (Exception e) {
					
						fMonitor.onCompleted(CompletionType.Exception, e, null);
					}
				}
			}
		}.start();
	}
	
	/**
	 * ���ݴ������ҳ��������ģ��
	 * 
	 * @param pages ������ҳ�ļ�·�����ַ�����
	 * @param monitor	������
	 */
	private void generate(File[] pages, IAsyncMonitor monitor) {
		Document rawHtmlDoc = null;
		List<Element> roots = new ArrayList<Element>();// Դ����list
		for (File file : pages) {
			String name = file.getAbsolutePath();
			System.out.println(name);
			rawHtmlDoc = XmlHelp.getHtmlDocument(name);
			if(rawHtmlDoc == null){
				continue;
			}
			Element root = rawHtmlDoc.getRootElement();
			roots.add(root);
		}
		//����ģ���ļ�
		List<Element> roots1 = XmlHelp.getRootList(roots);
		generateTemplate(roots1, monitor);
	}
}

class GeneratorOld {
	
	// �ļ�Ŀ¼
	private String directory;
	// ���ɵ�ģ����
	private int templateNum;
	// ģ����ڵ�
	private Element root;
	// ģ��ۺ���
	private int total;
	// ���ƶ�
	protected double rate;
	
	private List<Element> srcRoots;
	private List<Element> newRoots;
	
	protected Matcher matchAlign = new Matcher();
	private XmlHelp xmlHelp = new XmlHelp();
	
	/**
	 * ����ҳdom����ÿ���ڵ���б�Ŵ���
	 * 
	 * @param root dom���ĸ��ڵ�
	 */
	@SuppressWarnings("unchecked")
	private void processTemplate(Element root) {
		List<Element> elements = new ArrayList<Element>();
		elements.add(root);
		int count = 1;
		
		// ����ҳ�ڵ���б��
		while (elements.size() > 0) {
			
			Element temp = elements.remove(0);
			temp.addAttribute("my_count_id", Integer.toString(count++));
			elements.addAll(temp.elements());
		}
	}

	/**
	 * ���ú����㷨�е���ƥ���㷨������������ҳdom���Ƿ�����
	 * @param templateRoot	ģ����ҳ�ļ����ڵ�
	 * @param alignRoot		������ҳ�ļ����ڵ�
	 * @return				���ƶ��Ƿ���ڸ��������ƶ�
	 */
	protected boolean matchAlign(Element templateRoot, Element alignRoot) {
		
		List<Element> nodes1 = new ArrayList<Element>();
		List<Element> nodes2 = new ArrayList<Element>();
		
		int w = matchAlign.simpleTreeMatch(templateRoot, alignRoot, nodes1, nodes2);
		int m = XmlHelp.getElementCount(alignRoot);
		System.out.println("���ƶȣ�" + rate);
		// ����������ҳdom���Ƿ�����
		if ((double) w / m >= rate) {
			// ����������
			matchAlign.alignTrees(templateRoot, alignRoot, nodes1, nodes2);
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * ���ݴ������ҳ��dom�����ڵ㣬����ģ���ļ�
	 * 
	 * @param roots		��ҳ��dom�����ڵ�
	 * @return			���ɵ�ģ����
	 */
	protected int generateTemplate(List<Element> roots) {
		return this.generateTemplate(roots, null);
	}
	
	/**
	 * ģ������
	 * ����ģ�������㷨������ģ���ļ������������ɵ�ģ������
	 * 
	 * @param roots		��ҳ��dom�����ڵ�
	 * @param monitor	������
	 * @return			���ɵ�ģ����
	 */
	@SuppressWarnings("static-access")
	protected int generateTemplate(List<Element> roots, IAsyncMonitor monitor) {
		
		// ��ʼ������
		
		srcRoots = roots;
		newRoots = new ArrayList<Element>();
		int num = roots.size();
		double totalNum = (double)num;
		
		// ѭ��������ֱ�������ļ����Ѿ����й��Ա�
		while (num > 0) {
			
			if (monitor != null && monitor.isCancellationRequested()) {
				monitor.onCompleted(CompletionType.Cancelled, null, null);
				return 0;
			}
			
			num--;
			templateNum++;
			total = 1;
			root = srcRoots.get(0);
			srcRoots.remove(0);
			boolean flag1 = false;
			boolean flag2 = false;
			while (srcRoots.size() > 0) {
				if (monitor != null && monitor.isCancellationRequested()) {
					monitor.onCompleted(CompletionType.Cancelled, null, null);
					return templateNum;
				}
				Element root2 = srcRoots.get(0);
				srcRoots.remove(0);
				// ���ú����㷨�е���ƥ���㷨������������ҳdom���Ƿ�����
				if (matchAlign(root, root2)) {
					flag1 = true;
					total++;
					num--;
					if (monitor != null) {
						double dNum = (double)num;
						int percentage = (int)((1.0 - dNum / totalNum) * 100);
						
						monitor.onProgressChanged(percentage);
					}
				} else {
					newRoots.add(root2);
					flag2 = true;
				}
				if (srcRoots.size() == 0 && flag1 && flag2) {
					srcRoots.addAll(newRoots);
					newRoots.clear();
					flag1 = false;
					flag2 = false;
				}
			}
			if (flag2) {
				srcRoots.addAll(newRoots);
				newRoots.clear();
			}
			//nums[templateNum - 1] = total;
			xmlHelp.reduceElement(root, (total * 800 / 1000));
			addHtml(root);
			processTemplate(root);
			String templateName = "template" + templateNum + "-" + total
					+ ".htm";
			xmlHelp.writeDocument(directory + "/" + templateName,
					root.getDocument());
			
			if (monitor != null) {
				monitor.onProgressChanged((int)((1.0 - (double)num / totalNum) * 100));
			}
		}
		
		if (monitor != null) {
			monitor.onCompleted(CompletionType.Normal, null, null);
		}
		return templateNum;
	}

	/**
	 * ��js�ű��ļ����뵽ģ���ļ�ͷ��
	 * @param src	js�ű��ļ���λ��
	 * @param element	js�ű��ļ�����Ҫ��ӵ��Ľڵ�
	 */
	private void addScript(String src, Element element) {
		Element jsElement = element.addElement("script");
		jsElement.setText(" ");
		jsElement.addAttribute("src", src);
		jsElement.addAttribute("type", "text/javascript");
	}

	/**
	 * ��css�ű��ļ����뵽ģ���ļ�ͷ��
	 * 
	 * @param href	css��ʽ�ļ���λ��
	 * @param element	css��ʽ�ļ�����Ҫ��ӵ��Ľڵ�
	 */
	private void addLink(String href, Element element) {
		Element cssElement = element.addElement("link");
		cssElement.addAttribute("rel", "stylesheet");
		cssElement.addAttribute("href", href);
		cssElement.addAttribute("type", "text/css");
	}

	public void addHtml(Element root) {
		Node headNode = root.selectSingleNode("//head");
		if (headNode.getNodeType() == Node.ELEMENT_NODE) {
			Element headElement = (Element) headNode;
			addLink("include/template.css", headElement);
			addScript("include/jquery.js", headElement);
			addScript("include/template.js", headElement);
		}
	}


	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public String getDirectory() {
		return directory;
	}

	protected void setDirectory(String directory) {
		this.directory = directory;
	}

	private Element getRootNode(Document doc) {
		return doc.getRootElement();
	}

}
