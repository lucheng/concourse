package com.buptsse.wie.core;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Element;

/**
 * ���㷨�࣬��������ƥ�䡢�����뷽��
 * ��������ȡ���ߵĺ����㷨��
 */
public class Matcher {

	/**
	 * ����ƥ���㷨
	 * 
	 * @param templateRoot
	 * @param alignRoot
	 * @param matchNodes1
	 * @param matchNodes2
	 * @return
	 */
	public int simpleTreeMatch(Element templateRoot, Element alignRoot, List<Element> matchNodes1, List<Element> matchNodes2) {

		//ģ��ڵ������ڵ�����
		List<Element> templateElements = templateRoot.elements();
		List<Element> alignRootElements = alignRoot.elements();
		
		int templateSize = templateElements.size();
		int alignSize = alignRootElements.size();
		
		//�������Ӧ��������б�ǣ���¼��������е��м���
		int c[][] = new int[templateSize + 1][alignSize + 1];
		int b[][] = new int[templateSize + 1][alignSize + 1];
		
		NodeList p[][] = new NodeList[templateSize + 1][alignSize + 1];
		NodeList q[][] = new NodeList[templateSize + 1][alignSize + 1];

		//��ʼ��
		for (int i = 0; i <= templateSize; i++) {
			for (int j = 0; j <= alignSize; j++) {
				c[i][j] = 0;
				b[i][j] = 0;
				p[i][j] = new NodeList();
				q[i][j] = new NodeList();
			}
		}
		
		for (int i = 1; i <= templateSize; i++) {
			
			int j = 1;
			int matchType;
			int w;
			while (j <= alignSize) {
				
				//�ж������ڵ�����ƶ�
				matchType = NodeComparer.compare(templateElements.get(i - 1), alignRootElements.get(j - 1));
				
				w = 0;
				if (matchType != NodeComparer.DIFFERENT) {
					//��������ԱȽڵ����ƻ�����ͬ����Ա���һ�����ӽڵ�
					w = simpleTreeMatch(templateElements.get(i - 1), alignRootElements.get(j - 1), p[i][j].getNodes(), q[i][j].getNodes());
				}
				
				//��¼�ڵ�����ƶ�
				c[i][j] = c[i - 1][j - 1] + w;
				if (c[i][j - 1] > c[i][j]) {
					c[i][j] = c[i][j - 1];
					b[i][j] = 1;
				}
				if (c[i - 1][j] > c[i][j]) {
					c[i][j] = c[i - 1][j];
					b[i][j] = 2;
				}
				j++;
				
				if (matchType == NodeComparer.SAME_CONTENT){
					break;
				}
			}
			for (int k = j; k <= alignSize; k++) {
				c[i][k] = c[i][k - 1];
				b[i][k] = 1;
			}
		}

		int i = templateSize;
		int j = alignSize;
		
		while (i != 0 && j != 0) {
			if (b[i][j] == 0) {
				matchNodes1.addAll(p[i][j].getNodes());
				matchNodes2.addAll(q[i][j].getNodes());
				i--;
				j--;
			} else {
				if (b[i][j] == 1) {
					j--;
				} else {
					if (b[i][j] == 2) {
						i--;
					}
				}
			}
		}

		//����ͬ�Ľڵ���ӵ�������
		matchNodes1.add(templateRoot);
		matchNodes2.add(alignRoot);
		
		//�õ����յ����ƶȽ����������
		int result = c[templateSize][alignSize] + 1;
		return result;
	}
	
	/**
	 * ��ȡ�㷨�е�ƥ���㷨
	 * matchNodes1��matchNodes2���Ǿ�����ͬ�ڵ�����У���һһ��Ӧ
	 * 
	 * @param node1
	 * @param node2
	 * @param matchNodes1
	 * @param matchNodes2
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public int match(Element node1, Element node2,
			List<Element> matchNodes1, List<Element> matchNodes2) {

		//��ʼ��
		List<Element> elements1 = node1.elements();
		List<Element> elements2 = node2.elements();
		int n = elements1.size();
		int m = elements2.size();
		int c[][] = new int[n + 1][m + 1];
		int b[][] = new int[n + 1][m + 1];
		NodeList p[][] = new NodeList[n + 1][m + 1];
		NodeList q[][] = new NodeList[n + 1][m + 1];

		for (int i = 0; i <= n; i++) {
			for (int j = 0; j <= m; j++) {
				c[i][j] = 0;
				b[i][j] = 0;
				p[i][j] = new NodeList();
				q[i][j] = new NodeList();
			}
		}
		
		int low = 1;
		for (int i = 1; i <= n; i++) {
			for (int k = 1; k < low; k++) {
				c[i][k] = c[i - 1][k];
				b[i][k] = 2;
			}
			
			int j = low;
			int matchType;
			int w;
			while (j <= m) {
				//�ж������ڵ�����ƶ�
				matchType = NodeComparer.compare(elements1.get(i - 1), elements2
						.get(j - 1));
				w = 0;
				if (matchType != NodeComparer.DIFFERENT) {
					//��������ԱȽڵ����ƻ�����ͬ����Ա���һ�����ӽڵ�
					w = match(elements1.get(i - 1), elements2.get(j - 1),
							p[i][j].getNodes(), q[i][j].getNodes());
				}
				if (NodeComparer.isListNode(elements1.get(i - 1))) {
					w = 3;
				}
				//��¼�ڵ�����ƶ�
				c[i][j] = c[i - 1][j - 1] + w;
				if (c[i][j - 1] > c[i][j]) {
					c[i][j] = c[i][j - 1];
					b[i][j] = 1;
				}
				if (c[i - 1][j] > c[i][j]) {
					c[i][j] = c[i - 1][j];
					b[i][j] = 2;
				}
				j++;
				if (matchType == NodeComparer.SAME_CONTENT) {
					low = j;
					break;
				}
			}
			for (int k = j; k <= m; k++) {
				c[i][k] = c[i][k - 1];
				b[i][k] = 1;

			}
		}

		int i = n;
		int j = m;
		while (i != 0 && j != 0) {
			if (b[i][j] == 0) {
				matchNodes1.addAll(p[i][j].getNodes());
				matchNodes2.addAll(q[i][j].getNodes());
				i--;
				j--;
			} else {
				if (b[i][j] == 1) {
					j--;
				} else {
					if (b[i][j] == 2) {
						i--;
					}
				}
			}
		}
		
		//��ӵ���ͬ�ڵ������У�����һһ��Ӧ
		matchNodes1.add(node1);
		matchNodes2.add(node2);

		int result = c[n][m] + 1;
		c = null;
		b = null;
		return result;
	}
	

	/**
	 * �������㷨
	 * ��ģ����ҳ�������ҳ���жԱȣ���������ҳ�е�ģ����ҳû�еĽڵ�
	 * ���뵽ģ����ҳ�ļ���
	 * 
	 */
	@SuppressWarnings("unchecked")
	public void alignTrees(Element node1, Element node2, List<Element> matchNodes1, List<Element> matchNodes2) {
		
		//��ʼ��
		List<Element> elements1 = node1.elements();
		List<Element> elements2 = node2.elements();
		int n = elements1.size();
		int m = elements2.size();
		if (m == 0) {
			return;
		}
		int i = 0;
		int j = 0;
		List<Element> nodes1 = new ArrayList<Element>();
		List<Element> nodes2 = new ArrayList<Element>();
		
		
		while (j < m) {
			
			//����ģ����ҳ��û�У����Ƕ�����ҳ�а����Ľڵ�
			if (j < m && matchNodes2.contains(elements2.get(j))) {
				while (matchNodes1.contains(elements1.get(i)) == false)
					i++;
				nodes1.add(elements1.get(i));
				nodes2.add(elements2.get(j));
				i++;
				j++;
			}
			int o = j;
			while (o < m && matchNodes2.contains(elements2.get(o)) == false)
				o++;
			if (o < m && i < n && matchNodes1.contains(elements1.get(i))) {
				nodes1.add(elements1.get(i));
				nodes2.add(elements2.get(o));
				for (int p = j; p < o; p++) {
					elements1.add(i, elements2.get(p).createCopy());
				}
				i += (o - j) + 1;
				o++;
			} else {
				if (o >= m && i >= n) {
					for (int p = j; p < o; p++) {
						elements1.add(i, elements2.get(p).createCopy());
					}
				}
			}
			j = o;
		}
		for (i = 0; i < nodes1.size(); i++) {
			matchNodes1.remove(nodes1.get(i));
			matchNodes2.remove(nodes2.get(i));
		}
		
		//��������ҳ�еĽڵ���뵽ģ����ҳ��
		for (i = 0; i < nodes1.size(); i++) {
			int num = Integer.valueOf(nodes1.get(i).attributeValue("num"));
			nodes1.get(i).attribute("num").setText(Integer.toString(num + 1));
			//�ݹ�ʵ����һ���ڵ�Ķ���
			alignTrees(nodes1.get(i), nodes2.get(i), matchNodes1, matchNodes2);
		}
	}
}

class NodeList {
	private List<Element> nodes = null;

	public List<Element> getNodes() {
		if (nodes == null)
			nodes = new ArrayList<Element>();
		return nodes;
	}
}
