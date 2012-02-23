package com.mywie.gui;

import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Point;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.TabFolder;
import org.eclipse.swt.widgets.TabItem;

public class WieTabs extends Composite {

	private WieStatusBar statusBar;
	private TabFolder tabFolder;
	private WelcomeScreen welCom; // welcome composite
	private GenerateComposite genCom; // generate template composite
	private EditComposite ediCom; // edit template composite
	private ExtractLocalComposite extLCom; // extract local data composite
	private ExtractOnLineComposite extOCom; // extract online data composite

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
					public void widgetSelected(
							org.eclipse.swt.events.SelectionEvent e) {
						switch (tabFolder.getSelectionIndex()) {
						case 0:
							statusBar.setStatus("��ӭʹ��");
							break;
						case 1:
							statusBar.setStatus("����ģ��");
							break;
						case 2:
							statusBar.setStatus("�༭ģ��");
							break;
						case 3:
							statusBar.setStatus("��ȡ��������");
							break;
						case 4:
							statusBar.setStatus("��ȡ��������");
							break;
						default:
							break;
						}
					}
				});

		TabItem tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("��ӭʹ��");
		welCom = new WelcomeScreen(tabFolder, SWT.NONE);
		welCom.setStatusBar(statusBar);
		tabItem.setControl(welCom);

		tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("����ģ��");
		genCom = new GenerateComposite(tabFolder, SWT.NONE);
		genCom.setStatusBar(statusBar);
		tabItem.setControl(genCom);

		tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("�༭ģ��");
		ediCom = new EditComposite(tabFolder, SWT.NONE);
		ediCom.setStatusBar(statusBar);
		tabItem.setControl(ediCom);

		tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("��ȡ����");
		extLCom = new ExtractLocalComposite(tabFolder, SWT.NONE);
		extLCom.setStatusBar(statusBar);
		tabItem.setControl(extLCom);

		/*tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("��ȡ����-����");
		extOCom = new ExtractOnLineComposite(tabFolder, SWT.NONE);
		extOCom.setStatusBar(statusBar);
		tabItem.setControl(extOCom);*/
	}

	public WieStatusBar getStatusBar() {
		return statusBar;
	}

	public void setStatusBar(WieStatusBar statusBar) {
		this.statusBar = statusBar;
	}

}
