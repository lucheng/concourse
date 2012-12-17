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
 * 数据抽取模块
 * 负责抽取逻辑控制
 * 
 */
public class ExtractionModel extends ModelBase {
	
	//部分控件引用,用来控制界面显示
	private ProgressBar progress;
	private Display display;
	private Text pageFolder;
	private Text templateFile;
	
	private String outputFolder;
	
	//状态变量
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
	
	//异步抽取数据
	public void extractDataAsync() {
		//从基类获取控件属性.
		String pageFolder = (String)this.getProperty("pageFolder");
		String templateFile = (String)this.getProperty("template");
		
		//判断开始条件
		File folder = new File(pageFolder);
		File template = new File(templateFile);
		
		if (!folder.exists()) {
			MessageBox mbox = new MessageBox(getShell(),
					SWT.ICON_INFORMATION | SWT.OK);
			mbox.setMessage("指定的网页集目录不存在");
			mbox.open();
			
			return;
		}
		
		if (!template.exists()) {
			MessageBox mbox = new MessageBox(getShell(),
					SWT.ICON_INFORMATION | SWT.OK);
			mbox.setMessage("指定的模板文件不存在");
			mbox.open();
			
			return;
		}
		
		//发布抽取开始全局事件
		ModelBase.publishGlobalEvent("extractBegin", null);
		isRunning = true;
		outputFolder = pageFolder + "/result";
		//调用异步抽取方法
		MyWIE.extractDataAsync(new File(templateFile), new File(pageFolder), new IAsyncMonitor() {
			
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
				
				//保存抽取结果
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
					mbox.setMessage("写入结果文件错误");
				}
				
				if (saveOk) {
					display.asyncExec(new Runnable() {

						@Override
						public void run() {
							// 弹出完成信息
							MessageBox mbox = null;

							if (type == CompletionType.Normal) {
								mbox = new MessageBox(getShell(), SWT.OK
										| SWT.ICON_INFORMATION);
								mbox.setMessage("抽取完成");
							} else if (type == CompletionType.Cancelled) {
								return;
							} else if (type == CompletionType.NotRunning) {
								mbox = new MessageBox(getShell(), SWT.OK
										| SWT.ICON_WARNING);
								mbox.setMessage("启动参数异常");
							} else if (type == CompletionType.Exception) {
								mbox = new MessageBox(getShell(), SWT.OK
										| SWT.ICON_ERROR);
								mbox.setMessage("抽取出现错误");
							}

							mbox.open();
						}
					});
				}
				isRunning = false;
				isCancelling = false;
				outputFolder = null;
				//发布抽取结束全局事件
				ModelBase.publishGlobalEvent("extractEnd", null);
			}
			
			@Override
			public boolean isCancellationRequested() {
				// 返回取消状态
				return isCancelling;
			}
		});
	}
	
	//处理为Button注册的Action
	@Override
	protected void handleAction(String actionName) {
		
		if (actionName.equals("extract")) {
			//抽取
			if (!isRunning) {
				this.extractDataAsync();
			} else {
				//取消
				ModelBase.publishGlobalEvent("extractCancel", null);
				isCancelling = true;
			}
		} else if (actionName.equals("browsePageFolder")) {
			//浏览网页集目录
			DirectoryDialog dialog = new DirectoryDialog(getShell());
			dialog.setMessage("选择网页集位置");
			String target = dialog.open();
			
			if (target != null) {
				pageFolder.setText(target);
			}
		} else if (actionName.equals("browseTemplate")) {
			//浏览模板文件
			FileDialog dialog = new FileDialog(getShell(), SWT.SINGLE | SWT.OPEN);
			dialog.setText("选择模板文件");
			dialog.setFilterNames(new String[] {"模板文件(*.html;*.htm)", "所有文件(*.*)"});
			dialog.setFilterExtensions(new String[] {"*.htm;*.html", "*.*"});
			
			String target = dialog.open();
			
			if (target != null) {
				templateFile.setText(target);
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
