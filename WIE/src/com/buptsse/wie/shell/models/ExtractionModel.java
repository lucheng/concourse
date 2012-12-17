package com.buptsse.wie.shell.models;

import java.io.File;
import java.io.IOException;

import org.eclipse.swt.*;
import org.eclipse.swt.widgets.*;

import com.buptsse.wie.CompletionType;
import com.buptsse.wie.ExtractionResultCollection;
import com.buptsse.wie.IAsyncMonitor;
import com.buptsse.wie.MyWIE;

/**
 * ���ݳ�ȡģ��
 * �����ȡ�߼�����
 * 
 */
public class ExtractionModel extends ModelBase {
	
	//���ֿؼ�����,�������ƽ�����ʾ
	private ProgressBar progress;
	private Display display;
	private Text pageFolder;
	private Text templateFile;
	
	private String outputFolder;
	
	//״̬����
	boolean isRunning = false;
	boolean isCancelling = false;

	public ExtractionModel(Shell shell, ProgressBar progress, Display display,
			Text pageFolder, Text templateFile) {
		super(shell);
		// TODO Auto-generated constructor stub
		this.progress = progress;
		this.display = display;
		this.pageFolder = pageFolder;
		this.templateFile = templateFile;
	}
	
	//�첽��ȡ����
	public void extractDataAsync() {
		//�ӻ����ȡ�ؼ�����.
		String pageFolder = (String)this.getProperty("pageFolder");
		String templateFile = (String)this.getProperty("template");
		
		//�жϿ�ʼ����
		File folder = new File(pageFolder);
		File template = new File(templateFile);
		
		if (!folder.exists()) {
			MessageBox mbox = new MessageBox(getShell(),
					SWT.ICON_INFORMATION | SWT.OK);
			mbox.setMessage("ָ������ҳ��Ŀ¼������");
			mbox.open();
			
			return;
		}
		
		if (!template.exists()) {
			MessageBox mbox = new MessageBox(getShell(),
					SWT.ICON_INFORMATION | SWT.OK);
			mbox.setMessage("ָ����ģ���ļ�������");
			mbox.open();
			
			return;
		}
		
		//������ȡ��ʼȫ���¼�
		ModelBase.publishGlobalEvent("extractBegin", null);
		isRunning = true;
		outputFolder = pageFolder + "/result";
		//�����첽��ȡ����
		MyWIE.extractDataAsync(new File(templateFile), new File(pageFolder), new IAsyncMonitor() {
			
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
				
				//�����ȡ���
				ExtractionResultCollection rc = (ExtractionResultCollection)result;
				boolean saveOk = false;
				
				try {
					File output = new File(outputFolder);
					if (!output.exists()) {
						output.mkdir();
					}
					
					rc.saveXml(outputFolder + "/extraction-result.xml");
					saveOk = true;
				} catch (Exception e) {
					// TODO Auto-generated catch block
				    MessageBox mbox = new MessageBox(getShell(), SWT.OK | SWT.ICON_ERROR);
					mbox.setMessage("д�����ļ�����");
				}
				
				if (saveOk) {
					display.asyncExec(new Runnable() {

						@Override
						public void run() {
							// ���������Ϣ
							MessageBox mbox = null;

							if (type == CompletionType.Normal) {
								mbox = new MessageBox(getShell(), SWT.OK
										| SWT.ICON_INFORMATION);
								mbox.setMessage("��ȡ���");
							} else if (type == CompletionType.Cancelled) {
								return;
							} else if (type == CompletionType.NotRunning) {
								mbox = new MessageBox(getShell(), SWT.OK
										| SWT.ICON_WARNING);
								mbox.setMessage("���������쳣");
							} else if (type == CompletionType.Exception) {
								mbox = new MessageBox(getShell(), SWT.OK
										| SWT.ICON_ERROR);
								mbox.setMessage("��ȡ���ִ���");
							}

							mbox.open();
						}
					});
				}
				isRunning = false;
				isCancelling = false;
				outputFolder = null;
				//������ȡ����ȫ���¼�
				ModelBase.publishGlobalEvent("extractEnd", null);
			}
			
			@Override
			public boolean isCancellationRequested() {
				// ����ȡ��״̬
				return isCancelling;
			}
		});
	}
	
	//����ΪButtonע���Action
	@Override
	protected void handleAction(String actionName) {
		
		if (actionName.equals("extract")) {
			//��ȡ
			if (!isRunning) {
				this.extractDataAsync();
			} else {
				//ȡ��
				ModelBase.publishGlobalEvent("extractCancel", null);
				isCancelling = true;
			}
		} else if (actionName.equals("browsePageFolder")) {
			//�����ҳ��Ŀ¼
			DirectoryDialog dialog = new DirectoryDialog(getShell());
			dialog.setMessage("ѡ����ҳ��λ��");
			String target = dialog.open();
			
			if (target != null) {
				pageFolder.setText(target);
			}
		} else if (actionName.equals("browseTemplate")) {
			//���ģ���ļ�
			FileDialog dialog = new FileDialog(getShell(), SWT.SINGLE | SWT.OPEN);
			dialog.setText("ѡ��ģ���ļ�");
			dialog.setFilterNames(new String[] {"ģ���ļ�(*.html;*.htm)", "�����ļ�(*.*)"});
			dialog.setFilterExtensions(new String[] {"*.htm;*.html", "*.*"});
			
			String target = dialog.open();
			
			if (target != null) {
				templateFile.setText(target);
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
