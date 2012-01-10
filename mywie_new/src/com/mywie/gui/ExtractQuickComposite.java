package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.DirectoryDialog;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.Label;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Text;

import com.mywie.core.Extract;
import com.mywie.gui.impl.CompositeImpl;
import com.mywie.utils.FileHelp;

public class ExtractQuickComposite extends CompositeImpl {

	private Label label;
	private Text markedFilePath;
	private Text templateFilePath;
	private Button openFile;
	private Text extractFilesPath;
	private Button openDir;
	private Button editButton;
	private Button viewButton;
	private Extract extractData;

	public ExtractQuickComposite(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {
		title = new Label(this, SWT.NONE);
		title.setBounds(new Rectangle(200, 45, 110, 35));
		title.setFont(new Font(Display.getDefault(), "\u5fae\u8f6f\u96c5\u9ed1", 18, SWT.NORMAL));
		title.setText("抽取数据");

		label = new Label(this, SWT.NONE);
		label.setBounds(new Rectangle(20, 85, 70, 25));
		label.setText("标注文件");

		markedFilePath = new Text(this, SWT.BORDER);
		markedFilePath.setEditable(false);
		markedFilePath.setBounds(new Rectangle(100, 85, 300, 25));

		openFile = new Button(this, SWT.NONE);
		openFile.setBounds(new Rectangle(410, 85, 80, 25));
		openFile.setText("选择");
		openFile.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						FileDialog fd = new FileDialog(getShell());
						fd.setText("选择标注文件");
//						String[] filterExtensions = { "标注文件 (*.html;*.htm" };
						String[] filterExtensions = {"*.template"};
						fd.setFilterExtensions(filterExtensions);
						String url = fd.open();
						if (url != null)
							markedFilePath.setText(url);
					}
				});
		
		/*label = new Label(this, SWT.NONE);
		label.setBounds(new Rectangle(20, 105, 70, 25));
		label.setText("模板文件");

		templateFilePath = new Text(this, SWT.BORDER);
		templateFilePath.setBounds(new Rectangle(100, 105, 300, 25));

		openFile = new Button(this, SWT.NONE);
		openFile.setBounds(new Rectangle(410, 105, 80, 25));
		openFile.setText("选择");
		openFile.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						FileDialog fd = new FileDialog(getShell());
						fd.setText("选择模板文件");
						String[] filterExtensions = { "模板文件 (*.html;*.htm" };
						fd.setFilterExtensions(filterExtensions);
						String url = fd.open();
						if (url != null)
							templateFilePath.setText(url);
					}
				});*/

		label = new Label(this, SWT.NONE);
		label.setBounds(new Rectangle(20, 150, 70, 25));
		label.setText("待抽取的网页集目录");
		label.setDragDetect(true);

		extractFilesPath = new Text(this, SWT.BORDER);
		extractFilesPath.setBounds(new Rectangle(100, 150, 300, 25));
		extractFilesPath.setEditable(false);

		openDir = new Button(this, SWT.NONE);
		openDir.setBounds(new Rectangle(410, 150, 80, 25));
		openDir.setText("选择");
		openDir.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						DirectoryDialog dd = new DirectoryDialog(getShell());
						dd.setText("选择网页集目录");
						String url = dd.open();
						if (url != null)
							extractFilesPath.setText(url);
					}
				});

		editButton = new Button(this, SWT.NONE);
		editButton.setBounds(new Rectangle(150, 200, 100, 50));
		editButton.setText("抽  取");
		editButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						if ("".equals(markedFilePath.getText().trim())
//								||"".equals(templateFilePath.getText().trim())
								|| "".equals(extractFilesPath.getText())) {
							messageBox.setMessage("请先选择模板文件和待抽取数据的网页集目录");
							messageBox.open();
						} else {
							extractData= new Extract();
							extractData.setMarkedFile(markedFilePath.getText());
//							extractData.setTempalteFile(templateFilePath.getText());
							extractData.setTempalteFile(markedFilePath.getText());
							extractData.setExtractFiles(FileHelp.getFiles(extractFilesPath.getText()));
							extractData.setDestDirectory(extractFilesPath.getText()+"/extraction");
							extractData.setStatusBar(statusBar);
							extractData.setExtractType(Extract.QUICK);
							extractData.start();
							viewButton.setEnabled(true);
						}
					}
				});

		viewButton = new Button(this, SWT.NONE);
		viewButton.setBounds(new Rectangle(300, 200, 100, 50));
		viewButton.setText("查看抽取结果");
		viewButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						String filename = "file:///" + extractFilesPath.getText() + "/extraction/extraction.xml";
//						System.out.println("filename:" + filename);
						showResult(filename);
					}
				});
		viewButton.setEnabled(false);
	}

	private void showResult(String url) {
		Shell subShell = new Shell(getDisplay());
		ViewResult viewResult = new ViewResult(subShell, SWT.NONE);
		viewResult.setUrl(url);
		subShell.setText("查看抽取结果");
		subShell.pack();
		subShell.open();
		viewResult.setUrl(url);
	}

}
