package com.buptsse.wie.shell.models;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.Shell;

import com.buptsse.wie.shell.ResultViewerWindow;
import com.buptsse.wie.shell.TemplateEditorWindow;

/**
 * ������ģ��
 * �����������߼�����
 */
public class WieWindowModel extends ModelBase {

	public WieWindowModel(Shell shell) {
		super(shell);
		// TODO Auto-generated constructor stub
	}

	//����ť����
	protected void handleAction(String actionName) {
		if (actionName == "launchEditor") {
			//����ģ��༭��
			FileDialog dialog = new FileDialog(getShell(), SWT.SINGLE | SWT.OPEN);
			dialog.setText("ѡ��ģ���ļ�");
			dialog.setFilterNames(new String[] {"ģ���ļ�(*.html;*.htm)", "�����ļ�(*.*)"});
			dialog.setFilterExtensions(new String[] {"*.htm;*.html", "*.*"});
			
			String target = dialog.open();
			
			if (target != null) {
				TemplateEditorWindow win = new TemplateEditorWindow(getShell(),
					target);
				win.open();
			}
		} else if (actionName.equals("launchViewer")) {
			//��������鿴��
			FileDialog dialog = new FileDialog(getShell(), SWT.SINGLE | SWT.OPEN);
			dialog.setText("ѡ���ȡ����ļ�");
			dialog.setFilterNames(new String[] {"��ȡ���(*.xml)", "�����ļ�(*.*)"});
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
