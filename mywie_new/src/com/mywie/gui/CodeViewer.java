package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.layout.FormAttachment;
import org.eclipse.swt.layout.FormData;
import org.eclipse.swt.layout.FormLayout;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Shell;

public class CodeViewer {

	private Shell shell;
	private String content;
	
	public CodeViewer(Shell shell, String content) {
		this.shell = shell;
	}

	
	public void createContents() {

		shell.setLayout(new FormLayout());

		Composite controls = new Composite(shell, SWT.NONE);

		FormData data = new FormData();
		data.top = new FormAttachment(0, 0);
		data.left = new FormAttachment(0, 0);
		data.right = new FormAttachment(100, 0);
		controls.setLayoutData(data);

		final Browser browser = new Browser(shell, SWT.NONE);
		data = new FormData();
		data.top = new FormAttachment(controls);
		data.bottom = new FormAttachment(100, 0);
		data.left = new FormAttachment(0, 0);
		data.right = new FormAttachment(100, 0);
		browser.setLayoutData(data);

//		browser.setUrl(url);
		

		controls.setLayout(new GridLayout(6, false));
	}
	
	public static void main(String[] args) {
		Shell shell = new Shell();
		MarkInputDialog dialog = new MarkInputDialog(shell);
		dialog.open();
	}
	
}