package com.mywie.operate;

import java.util.ArrayList;
import java.util.List;

import org.dom4j.Element;

import com.mywie.model.NodeCompare;
import com.mywie.model.NodeList;


public class MatchAlign {

	private NodeCompare nodeCompare = new NodeCompare();
	
	@SuppressWarnings({ "unchecked", "static-access" })
	public int match(Element templateRoot, Element alignRoot, List<Element> matchNodes1, List<Element> matchNodes2) {

		List<Element> templateElements = templateRoot.elements();
		List<Element> alignRootElements = alignRoot.elements();
		
		int templateSize = templateElements.size();
		int alignSize = alignRootElements.size();
		
//		System.out.println("templateSize:" + templateSize);
//		System.out.println("alignSize:" + alignSize);
		
		int c[][] = new int[templateSize + 1][alignSize + 1];
		int b[][] = new int[templateSize + 1][alignSize + 1];
		
		NodeList p[][] = new NodeList[templateSize + 1][alignSize + 1];
		NodeList q[][] = new NodeList[templateSize + 1][alignSize + 1];

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
				
				matchType = nodeCompare.compare(templateElements.get(i - 1), alignRootElements.get(j - 1));
				
				w = 0;
				if (matchType != NodeCompare.DIFFERENT) {
					w = match(templateElements.get(i - 1), alignRootElements.get(j - 1), p[i][j].getNodes(), q[i][j].getNodes());
				}
				
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
				
				if (matchType == NodeCompare.EQUALITY){
//					System.out.println("equality");
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

		matchNodes1.add(templateRoot);
		matchNodes2.add(alignRoot);
		
		int result = c[templateSize][alignSize] + 1;
		return result;
	}
	

	@SuppressWarnings("unchecked")
	public void alignTrees(Element node1, Element node2, List<Element> matchNodes1, List<Element> matchNodes2) {
		
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
		for (i = 0; i < nodes1.size(); i++) {
			int num = Integer.valueOf(nodes1.get(i).attributeValue("num"));
			nodes1.get(i).attribute("num").setText(Integer.toString(num + 1));
			alignTrees(nodes1.get(i), nodes2.get(i), matchNodes1, matchNodes2);
		}
	}
}
