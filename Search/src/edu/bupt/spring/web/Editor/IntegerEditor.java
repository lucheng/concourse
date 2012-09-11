package edu.bupt.spring.web.Editor;

import java.beans.PropertyEditorSupport;

public class IntegerEditor extends PropertyEditorSupport {

	public String getAsText() {
		Integer value = (Integer) getValue();
		if (null == value) {
			value = new Integer(0);
		}
		return value.toString();
	}

	public void setAsText(String text) throws IllegalArgumentException {
		Integer value = null;
		if (null != text && !text.equals("")) {
			value = Integer.valueOf(text);
		}
		setValue(value);
	}
}