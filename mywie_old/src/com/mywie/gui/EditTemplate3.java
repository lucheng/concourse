package com.mywie.gui;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import org.eclipse.jface.dialogs.InputDialog;
import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.List;

import com.mywie.core.EditHtml;
import com.mywie.gui.impl.CompositeImpl;
import com.mywie.utils.XmlHelp;

public class EditTemplate3 extends CompositeImpl {
	private Browser browser = null;
	private String windowStatus;
	private String url = "http://www.baidu.com";
	private Button addButton = null;
	private Button removeButton = null;
	private Button submitButton = null;
	private Button cancelButton = null;
	private List list = null;
	private InputDialog inputDialog = null;
	private Map<String, String> extractions = new HashMap<String, String>();
	private EditHtml editHtml = new EditHtml();

	public EditTemplate3(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initList() {
		extractions = XmlHelp.getExtractions(getUrl());
		for (String k : extractions.keySet()) {
			list.add(k);
		}
	}

	private void initialize() {
		this.setSize(new Point(800, 600));
		createBrowser();
		createInputDialog();

		addButton = new Button(this, SWT.NONE);
		addButton.setBounds(new Rectangle(650, 100, 40, 30));
		addButton.setText(">>");
		addButton.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						if (inputDialog.open() == InputDialog.OK) {
							String value = inputDialog.getValue();
							if (value != null) {
								list.add(value);
								extractions.put(value, windowStatus);
							}
						}
					}
				});
		removeButton = new Button(this, SWT.NONE);
		removeButton.setBounds(new Rectangle(650, 300, 40, 30));
		removeButton.setText("<<");
		removeButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						extractions.remove(list.getItem(list
								.getSelectionIndex()));
						list.remove(list.getSelectionIndex());
					}
				});

		list = new List(this, SWT.NONE);
		list.setBounds(new Rectangle(700, 20, 90, 500));
		list.setFont(new Font(Display.getDefault(), "\u5fae\u8f6f\u96c5\u9ed1",
				10, SWT.BOLD));
		list.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						String countId = extractions.get(list.getItem(list
								.getSelectionIndex()));
						browser.execute("showSelected('" + countId + "');");
					}
				});

		submitButton = new Button(this, SWT.NONE);
		submitButton.setBounds(new Rectangle(250, 550, 60, 30));
		submitButton.setText("确定");
		submitButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						editHtml.setExtractions(extractions);
						editHtml.setTemplateFile(getUrl());
						editHtml.edit();
						getShell().close();
					}
				});
		cancelButton = new Button(this, SWT.NONE);
		cancelButton.setBounds(new Rectangle(650, 550, 60, 30));
		cancelButton.setText("取消");
		cancelButton
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						getShell().close();
					}
				});
	}

	private void createBrowser() {
		browser = new Browser(this, SWT.NONE);
		browser.setBounds(new Rectangle(5, 20, 640, 500));
		browser.addStatusTextListener(new org.eclipse.swt.browser.StatusTextListener() {
					public void changed(
							org.eclipse.swt.browser.StatusTextEvent e) {																								
						if (Pattern.matches("[1-9][0-9]*", e.text.trim()))
							setWindowStatus(e.text);// 需要修改
					}
				});
		browser.setUrl(url);
	}

	private void createInputDialog() {
		inputDialog = new InputDialog(getShell(), "请输入一个名称来标示所选的数据",
				"请输入一个名称来标示所选的数据", "", null);
	}

	public String getWindowStatus() {
		return windowStatus;
	}

	public void setWindowStatus(String windowStatus) {
		this.windowStatus = windowStatus;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
		browser.setUrl(url);
		initList();
	}
	
	
}
