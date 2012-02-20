package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.TabFolder;
import org.eclipse.swt.widgets.TabItem;

public class WieTabs extends Composite {

	public WieStatusBar statusBar;
	public TabFolder tabFolder;
	public WelcomeScreen welCom; // welcome composite
	public GenerateComposite genCom; // generate template composite
	public EditComposite ediCom; // edit template composite
	public ExtractComposite extOCom; // extract online data composite
	public ExtractQuickComposite extLCom; // extract local data composite
	
	public TabItem welComTabItem;
	
	public TabItem genComTabItem;
	public TabItem ediComTabItem;
	public TabItem extOComTabItem;
	public TabItem extLComTabItem;
	
	public WieTabs(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {
		createStatusBar();
		createTabFolder();
		this.setSize(new Point(500, 350));
		this.setLayout(null);
	}

	private void createStatusBar() {
		statusBar = new WieStatusBar(this, SWT.BORDER);
		statusBar.setBounds(new Rectangle(0, 300, 500, 50));
	}

	private void createTabFolder() {
		
		tabFolder = new TabFolder(this, SWT.NONE);
		tabFolder.setBounds(new Rectangle(0, 0, 500, 300));
		
		tabFolder.addSelectionListener(new org.eclipse.swt.events.SelectionAdapter() {
					public void widgetSelected(org.eclipse.swt.events.SelectionEvent e) {
						switch (tabFolder.getSelectionIndex()) {
							case 0:
								statusBar.setStatus("��ӭʹ��");
								break;
							case 1:
								statusBar.setStatus("����ģ��");
								break;
							case 2:
								statusBar.setStatus("��ע�ļ�");
								break;
							case 3:
								statusBar.setStatus("��ȡ����");
								break;
							case 4:
								statusBar.setStatus("��ȡ����");
								break;
							default:
								break;
							}
					}
				});

		welComTabItem = new TabItem(tabFolder, SWT.NONE);
		
		welComTabItem.setText("��ӭʹ��");
		welCom = new WelcomeScreen(tabFolder, SWT.NONE);
		welCom.setStatusBar(statusBar);
		welComTabItem.setControl(welCom);

		genComTabItem = new TabItem(tabFolder, SWT.NONE);
		genComTabItem.setText("����ģ��");
		genCom = new GenerateComposite(tabFolder, SWT.NONE);
		genCom.setStatusBar(statusBar);
		genComTabItem.setControl(genCom);
		
		ediComTabItem = new TabItem(tabFolder, SWT.NONE);
		ediComTabItem.setText("��ע�ļ�");
		ediCom = new EditComposite(tabFolder, SWT.NONE);
		ediCom.setStatusBar(statusBar);
		ediComTabItem.setControl(ediCom);
		
		extOComTabItem = new TabItem(tabFolder, SWT.NONE);
		extOComTabItem.setText("ģ���ȡ");
		extOCom = new ExtractComposite(tabFolder, SWT.NONE);
		extOCom.setStatusBar(statusBar);
		extOComTabItem.setControl(extOCom);
		
	}

	public WieStatusBar getStatusBar() {
		return statusBar;
	}

	public void setStatusBar(WieStatusBar statusBar) {
		this.statusBar = statusBar;
	}
	
	/*public void selectGenerateTab(){
		
		removeAll();
		
		genComTabItem = new TabItem(tabFolder, SWT.NONE);
		genComTabItem.setText("����ģ��");
		genCom = new GenerateComposite(tabFolder, SWT.NONE);
		genCom.setStatusBar(statusBar);
		genComTabItem.setControl(genCom);
		
		ediComTabItem = new TabItem(tabFolder, SWT.NONE);
		ediComTabItem.setText("��ע�ļ�");
		ediCom = new EditComposite(tabFolder, SWT.NONE);
		ediCom.setStatusBar(statusBar);
		ediComTabItem.setControl(ediCom);
		

		extOComTabItem = new TabItem(tabFolder, SWT.NONE);
		extOComTabItem.setText("ģ���ȡ");
		extOCom = new ExtractNormalComposite(tabFolder, SWT.NONE);
		extOCom.setStatusBar(statusBar);
		extOComTabItem.setControl(extOCom);
		
	}*/
	
	/*public void selectQuickTab(){
		
		removeAll();
		
		ediComTabItem = new TabItem(tabFolder, SWT.NONE);
		ediComTabItem.setText("��ע�ļ�");
		ediCom = new EditComposite(tabFolder, SWT.NONE);
		ediCom.setStatusBar(statusBar);
		ediComTabItem.setControl(ediCom);
		
		extLComTabItem = new TabItem(tabFolder, SWT.NONE);
		extLComTabItem.setText("��ȡ����");
		extLCom = new ExtractQuickComposite(tabFolder, SWT.NONE);
		extLCom.setStatusBar(statusBar);
		extLComTabItem.setControl(extLCom);

	}*/
	
	/*public void removeAll(){
		
		if(genComTabItem != null){
			genComTabItem.dispose();
		}
		if(ediComTabItem != null){
			ediComTabItem.dispose();
		}
		if(extOComTabItem != null){
			extOComTabItem.dispose();
		}
		if(extLComTabItem != null){
			extLComTabItem.dispose();
		}
	}*/

}
