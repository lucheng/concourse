package com.buptsse.wie.shell.models;

import java.io.File;

import com.buptsse.wie.CompletionType;
import com.buptsse.wie.IAsyncMonitor;
import com.buptsse.wie.MyWIE;
import com.buptsse.wie.utilities.FileHelp;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.*;

/**
 * 模板生成模块
 * 负责模板生成的控制逻辑
 */
public class TemplateGenerationModel extends ModelBase {
	//控件引用用来控制界面显示
	private ProgressBar progress;
	private Display display;
	private Text pageFolder;
	
	//状态变量
	boolean isRunning = false;
	boolean isCancelling = false;
	
	public TemplateGenerationModel(Shell shell, ProgressBar progress, Display display, Text pageFolder) {
		super(shell);
		this.progress = progress;
		this.display = display;
		this.pageFolder = pageFolder;
	}
	
	//异步开始生成模板
	public void generateTemplateAsync() {
		//从模块基类获取控件属性
		String pageFolder = (String) this.getProperty("pageFolder");
		double simIndex = (double)((Integer) this.getProperty("simIndex")) / 100.0;
		
		//判断开始条件
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
		
		//发布生成开始全局事件
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
						// 更新进度
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
						// 弹出完成消息
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
				//发布生成结束全局事件
				ModelBase.publishGlobalEvent("generateEnd", null);
			}
			
			@Override
			public boolean isCancellationRequested() {
				
				return isCancelling;
			}
		});
	}
	
	//处理按钮动作
	protected void handleAction(String actionName) {
		if (actionName.equals("genasync")) {
			if (!isRunning) {
				//开始
				generateTemplateAsync();
			} else {
				//取消
				ModelBase.publishGlobalEvent("generateCancel", null);
				isCancelling = true;
			}
		} else if (actionName.equals("browsePageFolder")) {
			//浏览网页集
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
	
	//更新进度
	protected void updateProgress(int progress) {
		if (isRunning) {
			this.progress.setSelection(progress);
		}
	}
}
