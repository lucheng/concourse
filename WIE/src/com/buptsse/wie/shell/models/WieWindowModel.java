package com.buptsse.wie.shell.models;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.Shell;

import com.buptsse.wie.shell.ResultViewerWindow;
import com.buptsse.wie.shell.TemplateEditorWindow;

/**
 * 主界面模块
 * 用于主界面逻辑控制
 */
public class WieWindowModel extends ModelBase {

	public WieWindowModel(Shell shell) {
		super(shell);
		// TODO Auto-generated constructor stub
	}

	//处理按钮动作
	protected void handleAction(String actionName) {
		if (actionName == "launchEditor") {
			//启动模板编辑器
			FileDialog dialog = new FileDialog(getShell(), SWT.SINGLE | SWT.OPEN);
			dialog.setText("选择模板文件");
			dialog.setFilterNames(new String[] {"模板文件(*.html;*.htm)", "所有文件(*.*)"});
			dialog.setFilterExtensions(new String[] {"*.htm;*.html", "*.*"});
			
			String target = dialog.open();
			
			if (target != null) {
				TemplateEditorWindow win = new TemplateEditorWindow(getShell(),
					target);
				win.open();
			}
		} else if (actionName.equals("launchViewer")) {
			//启动结果查看器
			FileDialog dialog = new FileDialog(getShell(), SWT.SINGLE | SWT.OPEN);
			dialog.setText("选择抽取结果文件");
			dialog.setFilterNames(new String[] {"抽取结果(*.xml)", "所有文件(*.*)"});
			dialog.setFilterExtensions(new String[] {"*.xml", "*.*"});
			
			String target = dialog.open();
			
			if (target != null) {
				ResultViewerWindow win = new ResultViewerWindow(getShell(),
					target);
				win.open();
			}
		} else {
			super.handleAction(actionName);
		}
	}
}
