package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Shell;

public class WieShell{
	
	private Display display = null;
	private Shell sShell = null;
	private WieMenu menu = null;
	public static WieTabs tabs = null;	

	private void createSShell() {
		display = new Display();
		sShell = new Shell(display,SWT.CLOSE | SWT.RESIZE);
		sShell.setText("Web知识获取工具");
		sShell.setLocation(300, 200);
		
		initialize();
		sShell.setMenuBar(menu);
		
		sShell.pack();
		sShell.open();
		while (!sShell.isDisposed()) {
			if (!display.readAndDispatch())
				display.sleep();
		}
		display.dispose();
	}

	private void initialize() {
//		menu = new WieMenu(sShell, SWT.BAR);
		tabs = new WieTabs(sShell, SWT.BORDER);		
	}	

	public WieTabs getTabs() {
		return tabs;
	}

	public void setTabs(WieTabs tabs) {
		this.tabs = tabs;
	}
	
	public static void main(String[] argv) {
		WieShell ws = new WieShell();
		ws.createSShell();
	}
}
