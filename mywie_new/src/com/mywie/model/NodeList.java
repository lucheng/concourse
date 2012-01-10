package com.mywie.model;

import java.util.ArrayList;
import java.util.List;
import org.dom4j.Element;

public class NodeList {
	private List<Element> nodes = null;

	public List<Element> getNodes() {
		if (nodes == null)
			nodes = new ArrayList<Element>();
		return nodes;
	}
}
