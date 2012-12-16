package com.buptsse.wie.shell;

import org.eclipse.jface.dialogs.Dialog;
import org.eclipse.jface.dialogs.IDialogConstants;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.*;
import org.eclipse.swt.graphics.*;
import org.eclipse.swt.layout.*;
import org.eclipse.swt.widgets.*;

/**
 * 关于WIE对话框
 * 用于显示关于WIE信息抽取系统信息的描述
 * 
 */
public class AboutBox extends Dialog {

	public AboutBox(Shell parentShell) {
		super(parentShell);
		// TODO Auto-generated constructor stub
	}
	
	@Override
	protected Control createContents(Composite parent) {
		// TODO Auto-generated method stub
		parent.setSize(640, 350);
		getShell().setText("关于WIE信息抽取系统");
		
		return super.createContents(parent);
	}
	
	@Override
	protected Control createDialogArea(Composite parent) {
		// TODO Auto-generated method stub
		Composite root = new Composite(parent, SWT.NONE);
		root.setLayoutData(new GridData(GridData.FILL_BOTH));
		
		Canvas canvas = new Canvas(root, SWT.NO_REDRAW_RESIZE);
		
		ImageData sselogoData = new ImageData(getClass().getResourceAsStream("sselogo.png"));
		final Image sselogo = new Image(parent.getDisplay(), sselogoData);
		
	    canvas.addPaintListener(new PaintListener() {
			
			@Override
			public void paintControl(PaintEvent arg0) {
				// TODO Auto-generated method stub
				arg0.gc.drawImage(sselogo, 0, 0);
			}
		});
	    
	    canvas.setBounds(70, 30, 500, 81);
	    
	    Label line = new Label(root, SWT.SEPARATOR | SWT.HORIZONTAL);
	    line.setBounds(25, 120, 583, 20);
	    
	    int x = 100, y = 150;
	    
	    Label name = new Label(root, SWT.NONE);
	    name.setText("BUPTSSE WIE 信息抽取系统");
	    name.setBounds(x, y, 500, 22);
	    
	    Label version = new Label(root, SWT.NONE);
	    version.setText("版本 1.2.1");
	    version.setBounds(x, y + 25, 500, 22);
	    
	    Label copyright = new Label(root, SWT.NONE);
	    copyright.setText("© 2012 北京邮电大学软件学院。保留所有权利。");
	    copyright.setBounds(x, y + 50, 500, 22);
		
		return parent;
	}
	
	@Override
	protected void createButtonsForButtonBar(Composite parent) {
		// TODO Auto-generated method stub
		createButton(parent,
					 IDialogConstants.OK_ID,
					 "确定",
					 true);
	}
}
