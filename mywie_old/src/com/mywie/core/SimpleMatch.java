package com.mywie.core;

import java.util.List;

import org.dom4j.Element;
import org.dom4j.Node;

import com.mywie.model.NodeList;
import com.mywie.utils.NodeCompare;
import com.mywie.utils.XmlHelp;

public class SimpleMatch {
	public static int simpleTreeMatch(Node node1, Node node2) {
		if ((node1.getName() != null && !node1.getName().equalsIgnoreCase(
				node2.getName()))
				|| (node2.getName() != null && !node2.getName()
						.equalsIgnoreCase(node1.getName()))
				|| node1.getNodeType() != node2.getNodeType()) {
			return 0;
		}
		if (node1.getNodeType() == Node.ELEMENT_NODE) {
			List<Node> nodes1 = XmlHelp.getNodeList((Element) node1);
			List<Node> nodes2 = XmlHelp.getNodeList((Element) node2);
			int n = nodes1.size();
			int m = nodes2.size();

			int c[][] = new int[n + 1][m + 1];

			for (int i = 0; i <= n; i++) {
				for (int j = 0; j <= m; j++) {
					c[i][j] = 0;
				}
			}
			for (int i = 1; i <= n; i++) {
				for (int j = 1; j <= m; j++) {
					int w = simpleTreeMatch(nodes1.get(i - 1), nodes2
							.get(j - 1));
					c[i][j] = c[i - 1][j - 1] + w;
					if (c[i][j - 1] > c[i][j]) {
						c[i][j] = c[i][j - 1];
					}
					if (c[i - 1][j] > c[i][j]) {
						c[i][j] = c[i - 1][j];
					}
				}
			}
			return c[n][m] + 1;
		} else {
			return 1;
		}
	}

	public static int simpleTreeMatch2(Element node1, Element node2) {
		if (node1.getName() == null
				|| node2.getName() == null
				|| !node1.getName().equalsIgnoreCase(node2.getName())
				|| (node1.attributeValue("title") != null && !node1
						.attributeValue("title").equals(
								node2.attributeValue("title")))) {
			return 0;
		}

		List<Element> elements1 = node1.elements();
		List<Element> elements2 = node2.elements();
		int n = elements1.size();
		int m = elements2.size();
		int c[][] = new int[n + 1][m + 1];

		for (int i = 0; i <= n; i++) {
			for (int j = 0; j <= m; j++) {
				c[i][j] = 0;
			}
		}

		for (int i = 1; i <= n; i++) {
			for (int j = 1; j <= m; j++) {
				int w = simpleTreeMatch2(elements1.get(i - 1), elements2
						.get(j - 1));
				c[i][j] = c[i - 1][j - 1] + w;
				if (c[i][j - 1] > c[i][j]) {
					c[i][j] = c[i][j - 1];
				}
				if (c[i - 1][j] > c[i][j]) {
					c[i][j] = c[i - 1][j];
				}
			}
		}
		return c[n][m] + 1;
	}

	@SuppressWarnings("unchecked")
	public static int match(Element node1, Element node2,
			List<Element> matchNodes1, List<Element> matchNodes2) {

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
				matchType = NodeCompare.compare(elements1.get(i - 1), elements2.get(j - 1));
				w = 0;
				if (matchType != NodeCompare.DIFFERENT) {
					w = match(elements1.get(i - 1), elements2.get(j - 1),
							p[i][j].getNodes(), q[i][j].getNodes());
				}
				// System.out.println("$$$$$$$$$$$$$$$$$$$$$$$$$$$");
				// System.out.println(elements1.get(i - 1).asXML());
				// System.out.println("##############################");
				// System.out.println(elements2.get(j - 1).asXML());
				// System.out.println(matchType);
				// System.out.println(w);
				if (NodeCompare.isListNode(elements1.get(i - 1))){
					w=3;
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
				if (matchType == NodeCompare.EQUALITY) {
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
		
		matchNodes1.add(node1);
		matchNodes2.add(node2);

		return c[n][m] + 1;
	}

}
