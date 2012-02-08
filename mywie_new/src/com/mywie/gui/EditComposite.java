package com.mywie.gui;

import java.io.File;

import org.apache.log4j.Logger;
import org.dom4j.Document;
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

import com.mywie.gui.impl.CompositeImpl;
import com.mywie.model.ExtractData;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class EditComposite extends CompositeImpl {
	
	private static Logger logger = Logger.getLogger(ExtractData.class.getName());
	private Label label = null;
	private Text templateFilePath = null;
	private Button openFile = null;
	private Button start = null;
	private Shell subShell;

	public EditComposite(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {
		
		title = new Label(this, SWT.NONE);
		title.setBounds(new Rectangle(200, 35, 110, 35));
		title.setFont(new Font(Display.getDefault(),
				"\u5fae\u8f6f\u96c5\u9ed1", 18, SWT.NORMAL));
		title.setText("标注文件");

		label = new Label(this, SWT.NONE);
		label.setBounds(new Rectangle(20, 100, 70, 25));
		label.setText("标注文件");

		templateFilePath = new Text(this, SWT.BORDER);
		templateFilePath.setEditable(false);
		templateFilePath.setBounds(new Rectangle(100, 100, 300, 25));

		openFile = new Button(this, SWT.NONE);
		openFile.setBounds(new Rectangle(410, 100, 80, 25));
		openFile.setText("选择");
		openFile.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
			public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
				FileDialog fd = new FileDialog(getShell());
				String[] filterExtensions = {"*.html;*.htm"};
				fd.setFilterExtensions(filterExtensions);
				fd.setText("选择文件");
				String url = fd.open();
				if (url != null)
					templateFilePath.setText(url);
			}
		});

		start = new Button(this, SWT.NONE);
		start.setBounds(new Rectangle(200, 180, 110, 50));
		start.setText("标  注");
		start.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
			public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
				if ("".endsWith(templateFilePath.getText().trim())) {
					messageBox.setMessage("请先选择一个文件");
					messageBox.open();
				} else {
					try {
						showEditTemplate(templateFilePath.getText());
					} catch (Exception e1) {
						e1.printStackTrace();
					}
				}
			}
		});
	}

	private void copyFiles(String directory) {

		FileHelp.makedir(directory + "/include");
		FileHelp.copyJarFile("include/jquery.js", directory + "/include/jquery.js");
		FileHelp.copyJarFile("include/template.css", directory + "/include/template.css");
		FileHelp.copyJarFile("include/template.js", directory + "/include/template.js");
	}
	
	private String initUrl(String url){
		
		Document doc = XmlHelp.cleanHtml(url);
		XmlHelp.writeDocument(url + ".htm", doc);
		return url + ".htm";
	}
	
	private void showEditTemplate(String url) {
		
		subShell = new Shell(getDisplay());
		subShell.setText("编辑器");
		subShell.setMaximized(true);
		
		/**
		 * 先将文件copy到临时文件夹中，再对文件进行操
		 */
		String tempfile = FileHelp.TEMPDIR + "temp.html";
		FileHelp.makedir(FileHelp.TEMPDIR);
		
		FileHelp.copyFile(new File(url), new File(tempfile));
//		String filePath = url.substring(0, url.lastIndexOf("\\"));
		
		SimpleBrowser simpleBrowser = new SimpleBrowser(subShell, SWT.CLOSE, initUrl(tempfile));
		try{
			simpleBrowser.createContents();
		} catch(Exception e){
			logger.error(e.getStackTrace());
			e.printStackTrace();
		}
		
		copyFiles(FileHelp.TEMPDIR);
		subShell.pack();
		subShell.open();
	}
	
}
