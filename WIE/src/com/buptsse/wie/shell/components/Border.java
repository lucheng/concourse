package com.buptsse.wie.shell.components;

import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Composite;

/**
 * 边框控件
 * 用来包裹部分不支持BORDER的控件.
 * 
 */
public class Border extends Composite {

	public Border(Composite parent, int style) {
		super(parent, style | SWT.BORDER);
		
		setLayout(new FillLayout());
	}
}
