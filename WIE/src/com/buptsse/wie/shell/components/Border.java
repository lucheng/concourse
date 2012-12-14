package com.buptsse.wie.shell.components;

import org.eclipse.swt.SWT;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Composite;

public class Border extends Composite {

	public Border(Composite parent, int style) {
		super(parent, style | SWT.BORDER);
		
		setLayout(new FillLayout());
	}
}
