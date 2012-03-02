package com.mywie.gui.xmlview;

import java.util.List;

import org.eclipse.jface.viewers.ICellModifier;
import org.eclipse.jface.viewers.Viewer;
import org.eclipse.swt.widgets.Item;

public class DataCellModifier implements ICellModifier {
	private Viewer viewer;
	private List<String> titles;

	public DataCellModifier(Viewer viewer, List<String> titles) {
		this.viewer = viewer;
		this.titles = titles;
	}

	/**
	 * Returns whether the property can be modified
	 * 
	 * @param element
	 *            the element
	 * @param property
	 *            the property
	 * @return boolean
	 */
	public boolean canModify(Object element, String property) {
		// Allow editing of all values
		return true;
	}

	/**
	 * Returns the value for the property
	 * 
	 * @param element
	 *            the element
	 * @param property
	 *            the property
	 * @return Object
	 */
	public Object getValue(Object element, String property) {
		Data data = (Data) element;		
		for (int i = 0; i < titles.size(); i++) {			
			if (property.equalsIgnoreCase(titles.get(i))) {
				return data.getValues().get(i);
			}
		}
		return null;
	}

	/**
	 * Modifies the element
	 * 
	 * @param element
	 *            the element
	 * @param property
	 *            the property
	 * @param value
	 *            the value
	 */
	public void modify(Object element, String property, Object value) {
		if (element instanceof Item)
			element = ((Item) element).getData();

		Data data = (Data) element;
		for (int i = 0; i < titles.size(); i++) {
			if (property.equalsIgnoreCase(titles.get(i))) {
				data.getValues().remove(i);
				data.getValues().add(i, (String) value);
				break;
			}
		}
		// Force the viewer to refresh
		viewer.refresh();
	}
}