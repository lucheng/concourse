package com.mywie.gui;

import java.awt.GridLayout;
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
import org.dom4j.Element;
import org.eclipse.swt.SWT;
import org.eclipse.swt.browser.Browser;
import org.eclipse.swt.graphics.Font;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.layout.FillLayout;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.Display;
import org.eclipse.swt.widgets.List;

import com.mywie.core.EditHtml;
import com.mywie.gui.impl.CompositeImpl;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class EditTemplate extends CompositeImpl {
	private Browser browser = null;
	private String windowStatus;
	private String url = "http://www.baidu.com";
	private Button addButton = null;
	private Button removeButton1 = null;
	private Button removeButton2 = null;
	private Button removeButton3 = null;
	private Button submitButton = null;
	private Button cancelButton = null;
	//private List list = null;
	private List list1 = null;
	private List list2 = null;
	private List list3 = null;
	//private Map<String, String> extractions = new HashMap<String, String>();
	private Map<String, String> extractions1 = new HashMap<String, String>();
	private Map<String, String> extractions2 = new HashMap<String, String>();
	private Map<String, String> extractions3 = new HashMap<String, String>();
	/*
	 * 1.semantic
	 * 2.remove
	 * 3.select
	 */
	
	private EditHtml editHtml = new EditHtml();
	private XmlHelp xmlHelp = new XmlHelp();
	
	//Edit
	private String value;
	private JFrame f;
	private JCheckBox c1 = new JCheckBox("Mark");
	private JCheckBox c2 = new JCheckBox("Remove tag");
	private JCheckBox c3 = new JCheckBox("Select");
	private JTextField text1 = new JTextField(20);
	private JTextField text2 = new JTextField(20);
	private JTextField text3 = new JTextField(20);
	private boolean markState = false;
	private boolean selectState = false;
	private boolean removeState = false;
	

	public EditTemplate(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private String initList() {
		
		Document doc = XmlHelp.cleanHtml(getUrl());
		extractions1 = xmlHelp.getExtractions(doc,"semantic");
		for (String k : extractions1.keySet()) {
			list1.add(k);
		}
		extractions2 = xmlHelp.getExtractions(doc,"remove");
		for (String k : extractions2.keySet()) {
			list2.add(k);
		}
		extractions3 = xmlHelp.getExtractions(doc,"select");
		for (String k : extractions3.keySet()) {
			list3.add(k);
		}
		
//		System.out.println(doc.asXML());
		XmlHelp.writeDocument(getUrl() + ".htm", doc);
		return getUrl() + ".htm";
//		extractions = XmlHelp.getExtractions(getUrl());
//		for (String k : extractions.keySet()) {
//			list.add(k);
//		}
	}

	private void initialize() {
		this.setSize(new Point(1000, 680));
		createBrowser();
		//createInputDialog();

		addButton = new Button(this, SWT.NONE);
		addButton.setBounds(new Rectangle(450, 515, 40, 30));
		addButton.setText("选择");
		addButton.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						createInputDialog();
					}
				});
		removeButton1 = new Button(this, SWT.NONE);
		removeButton1.setBounds(new Rectangle(275, 550, 40, 80));
		removeButton1.setText("↑↑");
		removeButton1
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						int index = list1.getSelectionIndex();
						if(index >= 0){
							extractions1.remove(list1.getItem(index));
							list1.remove(list1.getSelectionIndex());
						}
					}
				});

		removeButton2 = new Button(this, SWT.NONE);
		removeButton2.setBounds(new Rectangle(605, 550, 40, 80));
		removeButton2.setText("↑↑");
		removeButton2
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						int index = list2.getSelectionIndex();
						if(index >= 0){
							extractions2.remove(list2.getItem(index));
							list2.remove(list2.getSelectionIndex());
						}
					}
				});
		
		removeButton3 = new Button(this, SWT.NONE);
		removeButton3.setBounds(new Rectangle(935, 550, 40, 80));
		removeButton3.setText("↑↑");
		removeButton3
				.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						int index = list3.getSelectionIndex();
						if(index >= 0){
							extractions3.remove(list3.getItem(index));
							list3.remove(list3.getSelectionIndex());
						}
					}
				});
		
		list1 = new List(this, SWT.V_SCROLL);
		list1.setBounds(new Rectangle(5, 547, 250, 100));
		list1.setFont(new Font(Display.getDefault(), "\u5fae\u8f6f\u96c5\u9ed1",
				10, SWT.BOLD));
		
		list1.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						int index = list1.getSelectionIndex();
						if(index >= 0){
							String countId = extractions1.get(list1.getItem(index));
							browser.execute("showSelected('" + countId + "');");
						}
					}
				});

		list2 = new List(this, SWT.V_SCROLL);
		list2.setBounds(new Rectangle(335, 547, 250, 100));
		list2.setFont(new Font(Display.getDefault(), "\u5fae\u8f6f\u96c5\u9ed1",
				10, SWT.BOLD));
		
		list2.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						int index = list2.getSelectionIndex();
						if(index >= 0){
							String countId = extractions2.get(list2.getItem(index));
							browser.execute("showSelected('" + countId + "');");
						}
					}
				});
		
		list3 = new List(this, SWT.V_SCROLL);
		list3.setBounds(new Rectangle(665, 547, 250, 100));
		list3.setFont(new Font(Display.getDefault(), "\u5fae\u8f6f\u96c5\u9ed1",
				10, SWT.BOLD));
		
		list3.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						int index = list3.getSelectionIndex();
						if(index >= 0){
							String countId = extractions3.get(list3.getItem(index));
							browser.execute("showSelected('" + countId + "');");
						}
					}
				});
		
		submitButton = new Button(this, SWT.NONE);
		submitButton.setBounds(new Rectangle(847,650,55, 30));
		submitButton.setText("确定");
		submitButton.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						editHtml.setExtractions(extractions1,"semantic");
						editHtml.setExtractions(extractions2,"remove");
						editHtml.setExtractions(extractions3,"select");
						
						editHtml.setTemplateFile(getUrl());
						editHtml.edit();
						getShell().close();
					}
				});
		cancelButton = new Button(this, SWT.NONE);
		cancelButton.setBounds(new Rectangle(927, 650, 55, 30));
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
		browser.setBounds(new Rectangle(5, 13, 990, 497));
		browser.addStatusTextListener(new org.eclipse.swt.browser.StatusTextListener() {
					public void changed(
						org.eclipse.swt.browser.StatusTextEvent e) {
							if (Pattern.matches("[1-9][0-9]*", e.text.trim()))
								setWindowStatus(e.text);// 需要修改
					}
				});
		browser.setUrl(url);

	}

	private void gao() {
		Display.getDefault().asyncExec(new Runnable() {
			public void run() {
				if (markState) {
					value = text1.getText();
					list1.add(value);
					extractions1.put(value, windowStatus);
				}
				if (removeState) {
					value = text2.getText();
					list2.add(value);
					extractions2.put(value, windowStatus);
				}
				if (selectState) {
					value = text3.getText();
					list3.add(value);
					extractions3.put(value, windowStatus);
				}
			}
		});
	}

	private void createInputDialog() {
		f = new JFrame("");
		f.setLayout(new GridLayout(4,1,5,5));
		JPanel p1 = new JPanel();
		JPanel p2 = new JPanel();
		JPanel p3 = new JPanel();
		JPanel p4 = new JPanel();
		JButton yes = new JButton("确定");
		JButton cancel = new JButton("取消");
		
		p1.setBorder(new TitledBorder(" "));
		p1.setLayout(new GridLayout(1,2,0,0));
		p2.setBorder(new TitledBorder(" "));
		p2.setLayout(new GridLayout(1,2,0,0));
		p3.setBorder(new TitledBorder(" "));
		p3.setLayout(new GridLayout(1,2,0,0));
		
		text1.setText("");
		text1.setEditable(false);
		text2.setText("");
		text2.setEditable(false);
		text3.setText("");
		text3.setEditable(false);
		
		c1.setSelected(false);
		c2.setSelected(false);
		c3.setSelected(false);
		markState = false;
		selectState = false;
		removeState = false;

		c1.addItemListener(new ItemListener(){
			public void itemStateChanged(ItemEvent e) {
				if(e.getStateChange() == ItemEvent.DESELECTED){
					markState = false;	
					text1.setEditable(markState);
				}
				if(e.getStateChange() == ItemEvent.SELECTED){
					markState = true; 
					text1.setEditable(markState);
				}
			}});
		
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
		
		c3.addItemListener(new ItemListener(){
			public void itemStateChanged(ItemEvent e) {
				if(e.getStateChange() == ItemEvent.DESELECTED){
					selectState = false;
					text3.setEditable(selectState);
				}
				if(e.getStateChange() == ItemEvent.SELECTED){
					selectState = true;
					text3.setEditable(selectState);
				}
			}});
		
		yes.addActionListener(new ActionListener(){
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
		p3.add(c3);
		p3.add(text3);
		p4.add(yes);
		p4.add(cancel);
		
		f.add(p1);
		f.add(p2);
		f.add(p3);
		f.add(p4);
		
		f.setLocationRelativeTo(null);
		f.setSize(350, 280);
		f.setVisible(true);
		
		//f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
//		inputDialog = new InputDialog(getShell(), "请输入一个名称来标示所选的数据",
//				"请输入一个名称来标示所选的数据", "", null);
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
//		Document doc = ;
		browser.setUrl(initList());
	}
	
}


