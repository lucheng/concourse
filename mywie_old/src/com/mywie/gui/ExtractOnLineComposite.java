package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.mywie.core.Extract;
import com.mywie.gui.impl.CompositeImpl;
import com.mywie.utils.FileHelp;

public class ExtractOnLineComposite extends CompositeImpl {

	private Label label;
	private Text templateFilePath;
	private Button openFile;
	private Text urlFilePath;
	private Button openURls;
	private Button editButton;
	private Button viewButton;
	private Extract extractData = new Extract();

	public ExtractOnLineComposite(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {
		title = new Label(this, SWT.NONE);
		title.setBounds(new Rectangle(200, 35, 110, 35));
		title.setFont(new Font(Display.getDefault(),
				"\u5fae\u8f6f\u96c5\u9ed1", 18, SWT.NORMAL));
		title.setText("��ȡ����");

		label = new Label(this, SWT.NONE);
		label.setBounds(new Rectangle(20, 85, 70, 25));
		label.setText("ģ���ļ�");

		templateFilePath = new Text(this, SWT.BORDER);
		templateFilePath.setBounds(new Rectangle(100, 85, 300, 25));

		openFile = new Button(this, SWT.NONE);
		openFile.setBounds(new Rectangle(410, 85, 80, 25));
		openFile.setText("ѡ��");
		openFile
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						FileDialog fd = new FileDialog(getShell());
						fd.setText("ѡ��ģ���ļ�");
						String url = fd.open();
						if (url != null)
							templateFilePath.setText(url);
					}
				});

		label = new Label(this, SWT.NONE);
		label.setBounds(new Rectangle(20, 130, 70, 25));
		label.setText("����ȡ����ַ�ļ�");
		label.setDragDetect(true);

		urlFilePath = new Text(this, SWT.BORDER);
		urlFilePath.setBounds(new Rectangle(100, 130, 300, 25));

		openURls = new Button(this, SWT.NONE);
		openURls.setBounds(new Rectangle(410, 130, 80, 25));
		openURls.setText("ѡ��");
		openURls
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						FileDialog fd = new FileDialog(getShell());
						fd.setText("��ѡ����ַ�ļ�");
						String url = fd.open();
						if (url != null)
							urlFilePath.setText(url);
					}
				});

		editButton = new Button(this, SWT.NONE);
		editButton.setBounds(new Rectangle(150, 200, 100, 50));
		editButton.setText("��  ȡ");
		editButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						if ("".equals(templateFilePath.getText().trim())
								|| "".equals(urlFilePath.getText())) {
							messageBox.setMessage("����ѡ��ģ���ļ��ʹ���ȡ����ַ�ļ�");
							messageBox.open();
						} else {
							extractData.setTempalteFile(templateFilePath
									.getText()
									+ ".xml");
							extractData.setUrlFile(urlFilePath.getText());
							extractData.setDestDirectory(urlFilePath.getText());
							try {
								extractData.extractOnLine();
								viewButton.setEnabled(true);
							} catch (Exception e1) {
								e1.printStackTrace();
							}
						}
					}
				});

		viewButton = new Button(this, SWT.NONE);
		viewButton.setBounds(new Rectangle(300, 200, 100, 50));
		viewButton.setText("�鿴��ȡ���");
		viewButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						showResult("file:///"
								+ FileHelp.getDir(urlFilePath.getText())
								+ "/extraction/extraction.xml");
					}
				});
		viewButton.setEnabled(false);
	}

	private void showResult(String url) {
		Shell subShell = new Shell(getDisplay());
		ViewResult viewResult = new ViewResult(subShell, SWT.NONE);
		viewResult.setUrl(url);
		subShell.setText("�鿴��ȡ���");
		subShell.pack();
		subShell.open();
		viewResult.setUrl(url);
	}
	
	
}
