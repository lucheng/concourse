package com.buptsse.wie.shell;

import org.eclipse.jface.window.*;
import org.eclipse.swt.SWT;
import org.eclipse.swt.events.*;
import org.eclipse.swt.widgets.*;
import org.eclipse.swt.graphics.*;

import com.buptsse.wie.shell.models.*;

/**
 * 主窗体.
 */
public class WieWindow extends ApplicationWindow {
	public WieWindow(Shell shell) {
		super(shell);
	}
	
	@Override
	public void create() {
	    setShellStyle(SWT.TITLE | SWT.CLOSE | SWT.MIN);
	    super.create();
	}
	
	protected Control createContents(Composite parent) {
		getShell().setText("WEB 信息抽取系统");
		parent.setSize(630, 480);
		
		Composite root = new Composite(parent, SWT.NONE);
		
		//初始化模板生成和数据抽取两个控件面板
		TemplateGenerationControlGroup templateGroup = new TemplateGenerationControlGroup(root, SWT.NONE);
		ExtractionControlGroup extractionGroup = new ExtractionControlGroup(root, SWT.NONE);
		
		Canvas canvas = new Canvas(root, SWT.NO_REDRAW_RESIZE);
		
		Button templateEditorButton = new Button(root, SWT.PUSH);
		templateEditorButton.setText("编辑模板");
		
		Button resultViewerButton = new Button(root, SWT.PUSH);
		resultViewerButton.setText("查看结果");
		
		Button exitButton = new Button(root, SWT.PUSH);
		exitButton.setText("退出");
		
		templateGroup.setBounds(30, 0, 600, 180);
		extractionGroup.setBounds(30, 180, 600, 180);
		
		templateEditorButton.setBounds(276, 365, 160, 40);
		resultViewerButton.setBounds(441, 365, 160, 40);
		
		WieWindowModel model = new WieWindowModel(getShell());
		model.registerButtonAction("launchEditor", templateEditorButton);
		model.registerButtonAction("launchViewer", resultViewerButton);
		
		ImageData buptlogoData = new ImageData(getClass().getResourceAsStream("buptlogo-trans.png"));
		final Image buptlogo = new Image(parent.getDisplay(), buptlogoData);
		
	    canvas.addPaintListener(new PaintListener() {
			
			@Override
			public void paintControl(PaintEvent arg0) {
				// TODO Auto-generated method stub
				arg0.gc.drawImage(buptlogo, 0, 0);
			}
		});
	    
	    canvas.setBounds(40, 360, 196, 44);
		
		createMenu();
		
		return parent;
	}
	
	//创建菜单栏
	private void createMenu() {
		Shell shell = getShell();
		Menu menuBar = new Menu(shell, SWT.BAR);
		
		MenuItem toolsItem = new MenuItem(menuBar, SWT.CASCADE);
		toolsItem.setText("工具(&T)");
		Menu toolsMenu = new Menu(toolsItem);
		toolsItem.setMenu(toolsMenu);
		
		MenuItem helpItem = new MenuItem(menuBar, SWT.CASCADE);
		helpItem.setText("帮助(&H)");
		Menu helpMenu = new Menu(helpItem);
		helpItem.setMenu(helpMenu);
		
		MenuItem editorItem = new MenuItem(toolsMenu, SWT.PUSH);
		editorItem.setAccelerator(SWT.CTRL | 'e');
		editorItem.setText("模板编辑器(&E)...\tCTRL+E");
		
		MenuItem viewerItem = new MenuItem(toolsMenu, SWT.PUSH);
		viewerItem.setAccelerator(SWT.CTRL | 'r');
		viewerItem.setText("结果查看器(&R)\tCTRL+R");
		
		new MenuItem(toolsMenu, SWT.SEPARATOR);
		
		MenuItem exitItem = new MenuItem(toolsMenu, SWT.PUSH);
		exitItem.setText("退出(&X)");
		
		MenuItem aboutItem = new MenuItem(helpMenu, SWT.PUSH);
		aboutItem.setText("关于WIE(&A)");
		
		aboutItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				AboutBox ab = new AboutBox(getShell());
				
				ab.open();
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		exitItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				getShell().close();
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		viewerItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				ResultViewerWindow viewer = new ResultViewerWindow(getShell(), null);
				viewer.open();
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		editorItem.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				TemplateEditorWindow editor = new TemplateEditorWindow(getShell(), null);
				editor.open();
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		shell.setMenuBar(menuBar);
	}
	
	public static void main(String[] args) {
		WieWindow win = new WieWindow(null);
		win.setBlockOnOpen(true);
		win.open();
		
		Display.getCurrent().dispose();
	}
}
