package com.buptsse.wie.shell.models;

import java.io.File;

import com.buptsse.wie.CompletionType;
import com.buptsse.wie.IAsyncMonitor;
import com.buptsse.wie.MyWIE;
import com.buptsse.wie.utilities.FileHelp;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.*;

/**
 * ģ������ģ��
 * ����ģ�����ɵĿ����߼�
 */
public class TemplateGenerationModel extends ModelBase {
	//�ؼ������������ƽ�����ʾ
	private ProgressBar progress;
	private Display display;
	private Text pageFolder;
	
	//״̬����
	boolean isRunning = false;
	boolean isCancelling = false;
	
	public TemplateGenerationModel(Shell shell, ProgressBar progress, Display display, Text pageFolder) {
		super(shell);
		this.progress = progress;
		this.display = display;
		this.pageFolder = pageFolder;
	}
	
	//�첽��ʼ����ģ��
	public void generateTemplateAsync() {
		//��ģ������ȡ�ؼ�����
		String pageFolder = (String) this.getProperty("pageFolder");
		double simIndex = (double)((Integer) this.getProperty("simIndex")) / 100.0;
		
		//�жϿ�ʼ����
		File dir = new File(pageFolder);
		if (!dir.exists()) {
			MessageBox mbox = new MessageBox(getShell(),
					SWT.ICON_INFORMATION | SWT.OK);
			mbox.setMessage("ָ������ҳ��Ŀ¼������");
			mbox.open();
			
			return;
		}
		
		String output = pageFolder + "/template";
		FileHelp.makedir(output);
		
		//�������ɿ�ʼȫ���¼�
		ModelBase.publishGlobalEvent("generateBegin", null);
		isRunning = true;
		MyWIE.generateTemplateAsync(new File(pageFolder), new File(output), simIndex, new IAsyncMonitor() {
			
			@Override
			public void onProgressChanged(int progressInPercentage) {
				// TODO Auto-generated method stub
				final int fProgress = progressInPercentage;
				display.asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// ���½���
						updateProgress(fProgress);
					}
				});
			}
			
			@Override
			public void onCompleted(CompletionType completion, Exception exception, Object result) {
				// TODO Auto-generated method stub
				final CompletionType type = completion;
				display.asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// ���������Ϣ
						MessageBox mbox = null;
						
						if (type == CompletionType.Normal) {
							mbox = new MessageBox(getShell(), SWT.OK | SWT.ICON_INFORMATION);
							mbox.setMessage("�������");
						} else if (type == CompletionType.Cancelled) {
							return;
						} else if (type == CompletionType.NotRunning) {
							mbox = new MessageBox(getShell(), SWT.OK | SWT.ICON_WARNING);
							mbox.setMessage("���������쳣");
						} else if (type == CompletionType.Exception) {
							mbox = new MessageBox(getShell(), SWT.OK | SWT.ICON_ERROR);
							mbox.setMessage("���ɳ��ִ���");
						}
						
						mbox.open();
					}
				});
				isRunning = false;
				isCancelling = false;
				//�������ɽ���ȫ���¼�
				ModelBase.publishGlobalEvent("generateEnd", null);
			}
			
			@Override
			public boolean isCancellationRequested() {
				
				return isCancelling;
			}
		});
	}
	
	//����ť����
	protected void handleAction(String actionName) {
		if (actionName.equals("genasync")) {
			if (!isRunning) {
				//��ʼ
				generateTemplateAsync();
			} else {
				//ȡ��
				ModelBase.publishGlobalEvent("generateCancel", null);
				isCancelling = true;
			}
		} else if (actionName.equals("browsePageFolder")) {
			//�����ҳ��
			DirectoryDialog dialog = new DirectoryDialog(getShell());
			dialog.setMessage("ѡ����ҳ��λ��");
			String target = dialog.open();
			
			if (target != null) {
				pageFolder.setText(target);
			}
		} else {
			super.handleAction(actionName);
		}
	}
	
	//���½���
	protected void updateProgress(int progress) {
		if (isRunning) {
			this.progress.setSelection(progress);
		}
	}
}
