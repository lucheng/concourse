package com.buptsse.wie.shell.models;

import java.io.File;

import com.buptsse.wie.CompletionType;
import com.buptsse.wie.IAsyncMonitor;
import com.buptsse.wie.MyWIE;
import com.buptsse.wie.utilities.FileHelp;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.*;

/**
 * 生成模板界面类
 * 用于控制模板生成时界面的显示
 * 
 */
public class TemplateGenerationModel extends ModelBase {
	private ProgressBar progress;
	private Display display;
	private Text pageFolder;
	
	boolean isRunning = false;
	boolean isCancelling = false;
	
	public TemplateGenerationModel(Shell shell, ProgressBar progress, Display display, Text pageFolder) {
		super(shell);
		this.progress = progress;
		this.display = display;
		this.pageFolder = pageFolder;
	}
	
	public void generateTemplateAsync() {
		String pageFolder = (String) this.getProperty("pageFolder");
		double simIndex = (double)((Integer) this.getProperty("simIndex")) / 100.0;
		
		File dir = new File(pageFolder);
		if (!dir.exists()) {
			MessageBox mbox = new MessageBox(getShell(),
					SWT.ICON_INFORMATION | SWT.OK);
			mbox.setMessage("指定的网页集目录不存在");
			mbox.open();
			
			return;
		}
		
		String output = pageFolder + "/template";
		FileHelp.makedir(output);
		
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
						// TODO Auto-generated method stub
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
						// TODO Auto-generated method stub
						MessageBox mbox = null;
						
						if (type == CompletionType.Normal) {
							mbox = new MessageBox(getShell(), SWT.OK | SWT.ICON_INFORMATION);
							mbox.setMessage("生成完成");
						} else if (type == CompletionType.Cancelled) {
							return;
						} else if (type == CompletionType.NotRunning) {
							mbox = new MessageBox(getShell(), SWT.OK | SWT.ICON_WARNING);
							mbox.setMessage("启动参数异常");
						} else if (type == CompletionType.Exception) {
							mbox = new MessageBox(getShell(), SWT.OK | SWT.ICON_ERROR);
							mbox.setMessage("生成出现错误");
						}
						
						mbox.open();
					}
				});
				isRunning = false;
				isCancelling = false;
				ModelBase.publishGlobalEvent("generateEnd", null);
			}
			
			@Override
			public boolean isCancellationRequested() {
				// TODO Auto-generated method stub
				return isCancelling;
			}
		});
	}
	
	protected void handleAction(String actionName) {
		if (actionName.equals("genasync")) {
			if (!isRunning) {
				generateTemplateAsync();
			} else {
				ModelBase.publishGlobalEvent("generateCancel", null);
				isCancelling = true;
			}
		} else if (actionName.equals("browsePageFolder")) {
			DirectoryDialog dialog = new DirectoryDialog(getShell());
			dialog.setMessage("选择网页集位置");
			String target = dialog.open();
			
			if (target != null) {
				pageFolder.setText(target);
			}
		} else {
			super.handleAction(actionName);
		}
	}
	
	protected void updateProgress(int progress) {
		if (isRunning) {
			this.progress.setSelection(progress);
		}
	}
}
