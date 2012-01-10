package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Control;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.TabItem;

import com.mywie.gui.impl.CompositeImpl;

public class WelcomeScreen extends CompositeImpl {
	
	private Label title = null;
	private Button button_1 = null;
	private Button button_2 = null;
	

	public WelcomeScreen(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {		
		
		title = new Label(this, SWT.NONE);
		title.setBounds(new Rectangle(100, 45, 300, 35));
		title.setFont(new Font(Display.getDefault(), "\u5fae\u8f6f\u96c5\u9ed1", 18, SWT.NORMAL));
		title.setText("欢迎使用Web信息抽取工具");
		
		button_1 = new Button(this, SWT.RADIO);
		button_1.setBounds(new Rectangle(100, 120, 120, 40));
		button_1.setFont(new Font(Display.getDefault(), "\u5fae\u8f6f\u96c5\u9ed1", 14, SWT.NORMAL));
		button_1.setText("博客类抽取");
		button_1.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				
				WieTabs tabs = WieShell.tabs;
				tabs.selectGenerateTab();
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				
				
			}
		});
		
		button_2 = new Button(this, SWT.RADIO);
		button_2.setBounds(new Rectangle(100, 160, 120, 40));
		button_2.setFont(new Font(Display.getDefault(), "\u5fae\u8f6f\u96c5\u9ed1", 14, SWT.NORMAL));
		button_2.setText("电商类抽取");
		button_2.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				
				WieTabs tabs = WieShell.tabs;
				tabs.selectQuickTab();
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				
				System.out.println("widgetDefaultSelected");
			}
		});
		
	}
	
	
}
