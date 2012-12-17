package com.buptsse.wie.shell;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.*;

import com.buptsse.wie.shell.models.Callback;
import com.buptsse.wie.shell.models.ExtractionModel;
import com.buptsse.wie.shell.models.ModelBase;

/**
 * 抽取控件面板
 * 负责主界面抽取部分的UI逻辑。
 * 
 */
public class ExtractionControlGroup extends Composite {
	
	ExtractionModel model;

	public ExtractionControlGroup(Composite parent, int style) {
		super(parent, style);
		
		//控件组：数据抽取
		Group group = new Group(this, SWT.NONE);
		group.setText("数据抽取");
		
		//标签：模板文件
		Label templateFileLabel = new Label(group, SWT.NONE);
		templateFileLabel.setText("模板文件:");
		//文本框：模板文件
		final Text templateFileText = new Text(group, SWT.BORDER);
		//按钮：浏览模板文件
		final Button templateBrowseButton = new Button(group, SWT.PUSH);
		templateBrowseButton.setText("浏览...");
		//标签：网页集位置
		Label pageFolderLabel = new Label(group, SWT.NONE);
		pageFolderLabel.setText("网页集位置:");
		//文本框：网页集位置
		final Text pageFolderText = new Text(group, SWT.BORDER);
		//按钮：浏览网页集目录
		final Button pageBrowseButton = new Button(group, SWT.PUSH);
		pageBrowseButton.setText("浏览...");
		//按钮：开始抽取
		final Button startButton = new Button(group, SWT.PUSH);
		startButton.setText("开始抽取");
		//进度条
		final ProgressBar progress = new ProgressBar(group, SWT.NONE);
		progress.setVisible(false);
		
		//侦听抽取开始事件
		ModelBase.subscribeGlobalEvent("extractBegin", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// 抽取开始，设置取消按钮，disable 部分控件。
						templateFileText.setEnabled(false);
						templateBrowseButton.setEnabled(false);
						pageFolderText.setEnabled(false);
						pageBrowseButton.setEnabled(false);
						progress.setVisible(true);
						
						startButton.setText("取消");
					}
				});
			}
		});
		
		//侦听抽取取消事件
		ModelBase.subscribeGlobalEvent("extractCancel", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// 设置按钮
						startButton.setText("正在取消");
						startButton.setEnabled(false);
					}
				});
			}
		});
		
		//侦听抽取结束事件
		ModelBase.subscribeGlobalEvent("extractEnd", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// 恢复控件到默认状态
						templateFileText.setEnabled(true);
						templateBrowseButton.setEnabled(true);
						pageFolderText.setEnabled(true);
						pageBrowseButton.setEnabled(true);
						progress.setVisible(false);
						progress.setSelection(0);
						
						startButton.setText("开始抽取");
						startButton.setEnabled(true);
					}
				});
			}
		});
		
		//初始化抽取模块。
		model = new ExtractionModel(getShell(), progress, getDisplay(), pageFolderText, templateFileText);
		//为模块注册控件属性
		model.registerTextProperty("pageFolder", pageFolderText);
		model.registerTextProperty("template", templateFileText);
		model.registerButtonAction("browsePageFolder", pageBrowseButton);
		model.registerButtonAction("browseTemplate", templateBrowseButton);
		model.registerButtonAction("extract", startButton);
		
		//设定位置和大小
		int groupTop = 10;
		int groupLeft = 10;
		int groupWidth = 560;
		int groupHeight = 160;
		
		int column0Left = 30;
		int column0Width = 90;
		int column1Left = 130;
		int column1Width = 300;
		int column2Left = 440;
		int column2Width = 100;
		
		int row0Top = 25;
		int row0Height = 32;
		int row1Top = 67;
		int row1Height = 32;
		int row2Top = 104;
		int row2Height = 32;
		
		group.setBounds(groupTop, groupLeft, groupWidth, groupHeight);
		templateFileLabel.setBounds(column0Left, row0Top, column0Width, row0Height);
		templateFileText.setBounds(column1Left, row0Top - 2, column1Width, row0Height - 2);
		templateBrowseButton.setBounds(column2Left, row0Top - 3, column2Width, row0Height);
		pageFolderLabel.setBounds(column0Left, row1Top, column0Width, row1Height);
		pageFolderText.setBounds(column1Left, row1Top - 2, column1Width, row1Height - 2);
		pageBrowseButton.setBounds(column2Left, row1Top - 3, column2Width, row1Height);
		startButton.setBounds(column0Left, row2Top, column0Width, row2Height);
		progress.setBounds(column1Left, row2Top + 1, column1Width, row2Height - 2);
	}

}
