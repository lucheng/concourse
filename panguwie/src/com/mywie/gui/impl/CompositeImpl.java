package com.mywie.gui.impl;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Shell;

import com.mywie.gui.WieStatusBar;

public class CompositeImpl extends Composite {
	
	protected Label title = null;
	protected MessageBox messageBox = null;
	protected WieStatusBar statusBar;
	
	public CompositeImpl(Composite parent, int style) {
		super(parent, style);
//		this.setBackground(Display.getDefault().getSystemColor(SWT.COLOR_WIDGET_BACKGROUND));
		createMessageBox();
	}

	protected void createMessageBox() {
		messageBox = new MessageBox(getShell(), SWT.ICON_WARNING | SWT.CHECK | SWT.CANCEL);
		messageBox.setText("³ö´íÁË£¡");
	}
	
	public void setStatusBar(WieStatusBar statusBar) {
		this.statusBar=statusBar;
	}
	
	public static void main(String[] args){
		Shell shell = new Shell();
		new CompositeImpl(shell, SWT.CLOSE).createMessageBox();
	}
}
