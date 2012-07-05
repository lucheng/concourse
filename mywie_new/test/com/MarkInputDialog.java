package com;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Dialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Event;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Listener;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.mywie.gui.LayoutUtil;
import com.mywie.model.MarkData;

class MarkInputDialog extends Dialog {

	
	public MarkInputDialog(Shell parent) {
		super(parent);
	}

	
	public MarkInputDialog(Shell parent, int style) {
		super(parent, style);
	}

	
	public MarkData open() {
		
		final MarkData data = new MarkData();
		
		Shell parent = getParent();
		final Shell shell = new Shell(parent, SWT.CLOSE | SWT.APPLICATION_MODAL | SWT.CLOSE);
		shell.setSize(319, 238);
		shell.setText("标注文件");
		
		GridLayout gridLayout = new GridLayout(3, false);
		gridLayout.horizontalSpacing = 100;
		gridLayout.verticalSpacing = 100;
		gridLayout.marginLeft = 50;
		gridLayout.marginRight = 50;
		gridLayout.marginTop = 30;
		gridLayout.marginBottom = 30;
		
		shell.setLayout(gridLayout);
//		System.out.println(shell.getLocation());
		LayoutUtil.centerSell(shell.getDisplay(), shell);
//		shell.setLocation(100, 299);
//		System.out.println(shell.getLocation());
		
		Label label = new Label(shell, SWT.NULL);
		label.setText("标注名:");
		
				final Text text = new Text(shell, SWT.SINGLE | SWT.BORDER);
				text.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false, 2, 1));
				text.setText("");


				final Button button = new Button(shell, SWT.CHECK);
				button.setText("块选择");
				
				final Text text1 = new Text(shell, SWT.SINGLE | SWT.BORDER);
				text1.setEnabled(false);
				text1.setLayoutData(new GridData(SWT.FILL, SWT.CENTER, false, false, 2, 1));
				text1.setText("");
		
				
				button.addSelectionListener(new SelectionListener(){

					@Override
					public void widgetDefaultSelected(SelectionEvent arg0) {
						
						
					}

					@Override
					public void widgetSelected(SelectionEvent e) {
						
						if(text1.getEnabled()){
							text1.setEnabled(false);
						} else {
							text1.setEnabled(true);
						}
					}
					
				});
		
		final Button buttonOK = new Button(shell, SWT.PUSH);
		buttonOK.setText("确定");
		GridData gd_buttonOK = new GridData(GridData.HORIZONTAL_ALIGN_END);
		gd_buttonOK.widthHint = 80;
		buttonOK.setLayoutData(gd_buttonOK);
		
		Button buttonCancel = new Button(shell, SWT.PUSH);
		GridData gd_buttonCancel = new GridData(SWT.LEFT, SWT.CENTER, false, false, 1, 1);
		gd_buttonCancel.widthHint = 80;
		buttonCancel.setLayoutData(gd_buttonCancel);
		buttonCancel.setText("取消");
		
		buttonOK.addListener(SWT.Selection, new Listener() {
			public void handleEvent(Event event) {
				data.setSemantic(text.getText());
				if(text1.getText() != null && !text1.getText().equals("")){
					data.setBlock(text1.getText());
				}
				shell.dispose();
			}
		});

		buttonCancel.addListener(SWT.Selection, new Listener() {
			public void handleEvent(Event event) {
				shell.dispose();
			}
		});

		shell.addListener(SWT.Traverse, new Listener() {
			public void handleEvent(Event event) {
				if (event.detail == SWT.TRAVERSE_ESCAPE)
					event.doit = false;
			}
		});
		
		shell.pack();
		new Label(shell, SWT.NONE);
		shell.open();

		Display display = parent.getDisplay();
		while (!shell.isDisposed()) {
			if (!display.readAndDispatch())
				display.sleep();
		}
		
		return data;

	}
	
}
