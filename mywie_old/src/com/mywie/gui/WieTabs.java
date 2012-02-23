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
							statusBar.setStatus("欢迎使用");
							break;
						case 1:
							statusBar.setStatus("生成模板");
							break;
						case 2:
							statusBar.setStatus("编辑模板");
							break;
						case 3:
							statusBar.setStatus("抽取本地数据");
							break;
						case 4:
							statusBar.setStatus("抽取在线数据");
							break;
						default:
							break;
						}
					}
				});

		TabItem tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("欢迎使用");
		welCom = new WelcomeScreen(tabFolder, SWT.NONE);
		welCom.setStatusBar(statusBar);
		tabItem.setControl(welCom);

		tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("生成模板");
		genCom = new GenerateComposite(tabFolder, SWT.NONE);
		genCom.setStatusBar(statusBar);
		tabItem.setControl(genCom);

		tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("编辑模板");
		ediCom = new EditComposite(tabFolder, SWT.NONE);
		ediCom.setStatusBar(statusBar);
		tabItem.setControl(ediCom);

		tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("抽取数据");
		extLCom = new ExtractLocalComposite(tabFolder, SWT.NONE);
		extLCom.setStatusBar(statusBar);
		tabItem.setControl(extLCom);

		/*tabItem = new TabItem(tabFolder, SWT.NONE);
		tabItem.setText("抽取数据-在线");
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
