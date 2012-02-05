package com.mywie.gui;

//import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.border.TitledBorder;

import org.dom4j.Document;
import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.browser.StatusTextListener;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.layout.GridData;
import org.eclipse.swt.layout.GridLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.List;

import com.mywie.core.EditHtml;
import com.mywie.gui.impl.CompositeImpl;
import com.mywie.utils.XmlHelp;
//
public class EditTemplate extends CompositeImpl{
	
	private Browser browser = null;
	public Browser getBrowser() {
		return browser;
	}

	public void setBrowser(Browser browser) {
		this.browser = browser;
	}

	private String windowStatus;
	private String url = "http://www.baidu.com";
	private Button addButton = null;
	private Button removeButton1 = null;
	private Button submitButton = null;
	private Button cancelButton = null;
	private List list1 = null;

	private Map<String, String> extractions1 = new HashMap<String, String>();
	
	private EditHtml editHtml = new EditHtml();
	private String value;
	private JFrame f;
	private JCheckBox c1 = new JCheckBox("标注标签");
	private JCheckBox c2 = new JCheckBox("选择块");
//	private JCheckBox c3 = new JCheckBox("Select");
	private JTextField text1 = new JTextField(20);
	private JTextField text2 = new JTextField(20);
	private JTextField text3 = new JTextField(20);
	private boolean markState = false;
	private boolean selectState = false;
	private boolean removeState = false;
	
private String initList() {
		
//		Document doc = XmlHelp.cleanHtml(getUrl());
//		extractions1 = XmlHelp.getExtractions(doc,"semantic");
//		for (String k : extractions1.keySet()) {
//			list1.add(k);
//		}
//		XmlHelp.writeDocument(getUrl() + ".htm", doc);
		return getUrl() + ".htm";
	}

	public EditTemplate(Composite parent, int style) {
		
		super(parent, style);
		setSize(new Point(1000, 680));
		
		parent = this;
		parent.setLayout(new GridLayout(2, false));
		
		browser = new Browser(this, SWT.HORIZONTAL | SWT.RESIZE | SWT.VERTICAL);
		browser.setUrl(url);
		
		GridData gd_browser = new GridData(SWT.FILL, SWT.FILL, true, false, 2, 1);
		
		gd_browser.heightHint = 523;
		gd_browser.widthHint = 332;
		
		browser.setLayoutData(gd_browser);
		
		browser.addStatusTextListener(new StatusTextListener() {
			
			public void changed(org.eclipse.swt.browser.StatusTextEvent e) {
				if (Pattern.matches("[1-9][0-9]*", e.text.trim())){
					setWindowStatus(e.text);// 需要修改
				}
			}
			
		});
		
		
		/*list1 = new List(parent, SWT.NONE);
		list1.setLayoutData(new GridData(SWT.FILL, SWT.FILL, true, true, 1, 2));
		list1.setFont(new Font(Display.getDefault(), "\u5fae\u8f6f\u96c5\u9ed1", 10, SWT.BOLD));
		
		list1.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
			public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
				int index = list1.getSelectionIndex();
				if(index >= 0){
					String countId = extractions1.get(list1.getItem(index));
					browser.execute("showSelected('" + countId + "');");
				}
			}
		});*/
		
		addButton = new Button(parent, SWT.NONE);
		addButton.setText("选择");
		addButton.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
			public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
				createInputDialog();
			}
		});
				
		removeButton1 = new Button(parent, SWT.NONE);
		removeButton1.setText("删除");
		removeButton1.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
			public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
				int index = list1.getSelectionIndex();
				if(index >= 0){
					extractions1.remove(list1.getItem(index));
					list1.remove(list1.getSelectionIndex());
				}
			}
		});
		
		/*cancelButton = new Button(this, SWT.NONE);
		cancelButton.setText("取消");
		cancelButton.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						getShell().close();
					}
				});*/
		
		submitButton = new Button(parent, SWT.NONE);
		submitButton.setText("确定");
//		new Label(this, SWT.NONE);
		submitButton.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
			public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
//				editHtml.setExtractions(extractions1,"semantic");
//				editHtml.setTemplateFile(getUrl());
//				editHtml.edit();
//				parent.dispose();
			}
		});
	}

	private void gao() {
		Display.getDefault().asyncExec(new Runnable() {
			public void run() {
				if (markState) {
					value = text1.getText();
					list1.add(value);
					extractions1.put(value, windowStatus);
				}
				
			}
		});
	}

	private void createInputDialog() {
		
		System.out.println(extractions1);
		f = new JFrame("");
		f.setLayout(new java.awt.GridLayout(4,1,5,5));
		JPanel p1 = new JPanel();
		JPanel p2 = new JPanel();
		JPanel p3 = new JPanel();
		JPanel p4 = new JPanel();
		JButton yes = new JButton("确定");
		JButton cancel = new JButton("取消");
		
		p1.setBorder(new TitledBorder(" "));
		p1.setLayout(new java.awt.GridLayout(1,2,0,0));
		p2.setBorder(new TitledBorder(" "));
		p2.setLayout(new java.awt.GridLayout(1,2,0,0));
		p3.setBorder(new TitledBorder(" "));
		p3.setLayout(new java.awt.GridLayout(1,2,0,0));
		
		text1.setText("");
		text1.setEditable(false);
		text2.setText("");
		text2.setEditable(false);
		text3.setText("");
		text3.setEditable(false);
		
		c1.setSelected(false);
		c2.setSelected(false);
//		c3.setSelected(false);
		markState = false;
		selectState = false;
		removeState = false;

		c1.addItemListener(new ItemListener(){
			
			@Override
			public void itemStateChanged(ItemEvent e) {
				if(e.getStateChange() == ItemEvent.DESELECTED){
					markState = false;	
					text1.setEditable(markState);
				}
				if(e.getStateChange() == ItemEvent.SELECTED){
					markState = true; 
					text1.setEditable(markState);
				}
			}

			
		});
		
		c2.addItemListener(new ItemListener(){
			public void itemStateChanged(ItemEvent e) {
				if(e.getStateChange() == ItemEvent.DESELECTED){
					removeState = false;
					text2.setEditable(removeState);
				}
				if(e.getStateChange() == ItemEvent.SELECTED){
					removeState = true;
					text2.setEditable(removeState);
				}
			}});
		
		/*c3.addItemListener(new ItemListener(){
			public void itemStateChanged(ItemEvent e) {
				if(e.getStateChange() == ItemEvent.DESELECTED){
					selectState = false;
					text3.setEditable(selectState);
				}
				if(e.getStateChange() == ItemEvent.SELECTED){
					selectState = true;
					text3.setEditable(selectState);
				}
			}});*/
		
		yes.addActionListener(new ActionListener(){
			@Override
			public void actionPerformed(ActionEvent e) {
				//f.setVisible(false);
				f.dispose();
				gao();
			}

			
		});
		
		cancel.addActionListener(new ActionListener(){
			public void actionPerformed(ActionEvent e){
				//f.setVisible(false);
				f.dispose();
				markState = removeState = selectState = false;
			}
		});
		
		p1.add(c1);
		p1.add(text1);
		p2.add(c2);
		p2.add(text2);
//		p3.add(c3);
//		p3.add(text3);
		p4.add(yes);
		p4.add(cancel);
		
		f.add(p1);
		f.add(p2);
		f.add(p3);
		f.add(p4);
		
		f.setLocationRelativeTo(null);
		f.setSize(350, 280);
		f.setVisible(true);
		
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
		browser.setUrl(initList());
	}
	
}


