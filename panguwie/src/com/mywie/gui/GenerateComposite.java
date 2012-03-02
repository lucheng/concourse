package com.mywie.gui;

import org.apache.log4j.Logger;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionAdapter;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.DirectoryDialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Scale;
import org.eclipse.swt.widgets.Text;

import com.mywie.core.HtmlMatch;
import com.mywie.gui.impl.CompositeImpl;

public class GenerateComposite extends CompositeImpl {
	
	private static Logger logger = Logger.getLogger(GenerateComposite.class.getName());
	
	private Label FilePathLabel = null;
	private Label label2 = null;
	private Text htmlDirectory = null;
	private Button openFilePathFile = null;
	private Button start = null;
	private Scale scale = null;
	private HtmlMatch htmlMatch;

	public GenerateComposite(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {
		title = new Label(this, SWT.NONE);
		title.setBounds(new Rectangle(200, 45, 110, 35));
		title.setFont(new Font(Display.getDefault(),
				"\u5fae\u8f6f\u96c5\u9ed1", 18, SWT.NORMAL));
		title.setText("生成模板");

		FilePathLabel = new Label(this, SWT.NONE);
		FilePathLabel.setBounds(new Rectangle(20, 105, 70, 25));
		FilePathLabel.setText("网页集目录");
		
		htmlDirectory = new Text(this, SWT.BORDER);
		htmlDirectory.setEditable(false);
		htmlDirectory.setBounds(new Rectangle(100, 105, 300, 25));

	
		openFilePathFile = new Button(this, SWT.NONE);
		openFilePathFile.setBounds(new Rectangle(410, 105, 80, 25));
		openFilePathFile.setText("选择");
		openFilePathFile.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						DirectoryDialog dd = new DirectoryDialog(getShell());
						dd.setText("选择网页集目录");
						String url = dd.open();
						if (url != null)
							htmlDirectory.setText(url);
					}
				});

		FilePathLabel = new Label(this, SWT.NONE);
		FilePathLabel.setBounds(new Rectangle(20, 160, 60, 25));
		FilePathLabel.setText("相似度");

		FilePathLabel = new Label(this, SWT.NONE);
		FilePathLabel.setBounds(new Rectangle(90, 160, 10, 25));
		FilePathLabel.setText("0");

		label2 = new Label(this, SWT.NONE);
		label2.setBounds(new Rectangle(400, 160, 25, 20));
		label2.setText("0.85");

		scale = new Scale(this, SWT.HORIZONTAL);
		scale.setBounds(new Rectangle(100, 170, 350, 50));
		scale.setMaximum(100);
		scale.setMinimum(0);
		scale.setIncrement(1);
		scale.setSelection(85);
		scale.addSelectionListener(new SelectionAdapter() {
			public void widgetSelected(SelectionEvent e) {
				label2.setText(Double
						.toString((double) scale.getSelection() / 100));
				label2.setLocation(100 + scale.getSelection() * 33 / 10, 160);

			}
		});

		FilePathLabel = new Label(this, SWT.NONE);
		FilePathLabel.setBounds(new Rectangle(455, 160, 10, 25));
		FilePathLabel.setText("1");

		start = new Button(this, SWT.NONE);
		start.setBounds(new Rectangle(200, 220, 110, 50));
		start.setText("开始执行");
		start.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
				public void widgetSelected(
						org.eclipse.swt.events.SelectionEvent e) {

					if ("".equals(htmlDirectory.getText().trim())) {
						messageBox.setMessage("请先选择网页集目录");
						messageBox.open();
					} else {
						start.setEnabled(false);
						htmlMatch = new HtmlMatch();
						htmlMatch.setStart(start);
						htmlMatch.setDirectory(htmlDirectory.getText());
						htmlMatch.setRate((double) scale.getSelection() / 100);
						htmlMatch.setStatusBar(statusBar);
						htmlMatch.start();
					}
				}
			});
	}

}
