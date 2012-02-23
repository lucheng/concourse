package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;

import com.mywie.gui.impl.CompositeImpl;

public class WelcomeScreen extends CompositeImpl {
	private Label title = null;

	public WelcomeScreen(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {		
		title = new Label(this, SWT.NONE);
		title.setBounds(new Rectangle(100, 100, 300, 35));
		title.setFont(new Font(Display.getDefault(),
				"\u5fae\u8f6f\u96c5\u9ed1", 18, SWT.NORMAL));
		title.setText("欢迎使用Web信息抽取工具");
	}
	
	
}
