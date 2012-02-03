package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;

import com.mywie.gui.impl.CompositeImpl;

public class ViewResult extends CompositeImpl {
	private Browser browser = null;
	private Button closeButton;
	private String url = "www.baidu.com";

	public ViewResult(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {
		this.setSize(new Point(800, 600));
		createBrowser();
		closeButton = new Button(this, SWT.NONE);
		closeButton.setBounds(new Rectangle(300, 530, 60, 30));
		closeButton.setText("¹Ø±Õ");
		closeButton.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
			public void widgetSelected(
					org.eclipse.swt.events.SelectionEvent e) {
				getShell().close();
			}
		});
	}

	private void createBrowser() {
		browser = new Browser(this, SWT.NONE);
		browser.setUrl(url);
		browser.setBounds(new Rectangle(5, 20, 700, 500));
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
		browser.setUrl(url);
	}
	
	
}
