package com.buptsse.wie.shell;

import org.eclipse.swt.SWT;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.widgets.*;

import com.buptsse.wie.shell.models.Callback;
import com.buptsse.wie.shell.models.ModelBase;
import com.buptsse.wie.shell.models.TemplateGenerationModel;
import com.sun.org.apache.bcel.internal.generic.GETSTATIC;

/**
 * 模板生成面板
 * 负责主界面模板生成的UI逻辑
 * 
 */
public class TemplateGenerationControlGroup extends Composite {
	
	TemplateGenerationModel model;

	public TemplateGenerationControlGroup(Composite parent, int style) {
		super(parent, style);
		
		//控件组：生成模板
		Group group = new Group(this, SWT.NONE);
		group.setText("生成模板");
		//标签：网页位置
		Label pageFolderLabel = new Label(group, SWT.NONE);
		pageFolderLabel.setText("网页集位置:");
		//文本框：网页位置
		final Text pageFolderText = new Text(group, SWT.BORDER);
		//按钮：浏览
		final Button browseButton = new Button(group, SWT.PUSH);
		browseButton.setText("浏览...");
		//标签：相似度
		Label simIndexLabel = new Label(group, SWT.NONE);
		simIndexLabel.setText("相似度阈值:");
		//滑块：相似度
		final Slider simIndexSlider = new Slider(group, SWT.NONE);
		simIndexSlider.setValues(0, 0, 100, SWT.NONE, 1, 10);
		simIndexSlider.setMaximum(110);
		simIndexSlider.setSelection(80);
		//标签：相似度值
		Label simIndexValueLabel = new Label(group, SWT.NONE);
		simIndexValueLabel.setText("80%");
		//按钮：开始
		final Button startButton = new Button(group, SWT.PUSH);
		startButton.setText("开始生成");
		//进度条：生成进度
		final ProgressBar progress = new ProgressBar(group, SWT.NONE);
		progress.setVisible(false);
		
		//侦听抽取开始事件
		ModelBase.subscribeGlobalEvent("generateBegin", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// 设置取消按钮,disable部分控件
						pageFolderText.setEnabled(false);
						browseButton.setEnabled(false);
						simIndexSlider.setEnabled(false);
						progress.setVisible(true);
						
						startButton.setText("取消");
					}
				});
			}
		});
		
		//侦听抽取取消事件
		ModelBase.subscribeGlobalEvent("generateCancel", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// TODO Auto-generated method stub
						startButton.setText("正在取消");
						startButton.setEnabled(false);
					}
				});
			}
		});
		
		//侦听抽取结束事件
		ModelBase.subscribeGlobalEvent("generateEnd", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// 恢复控件状态
						pageFolderText.setEnabled(true);
						browseButton.setEnabled(true);
						simIndexSlider.setEnabled(true);
						progress.setVisible(false);
						progress.setSelection(0);
						
						startButton.setText("开始生成");
						startButton.setEnabled(true);
					}
				});
			}
		});
		
		//创建模板生成模块
		model = new TemplateGenerationModel(getShell(), progress, getDisplay(),
				pageFolderText);
		//为模块注册控件属性通知
		model.registerTextProperty("pageFolder", pageFolderText);
		model.registerSliderProperty("simIndex", simIndexSlider);
		model.registerButtonAction("genasync", startButton);
		model.registerButtonAction("browsePageFolder", browseButton);
		
		final Slider fSlider = simIndexSlider;
		final Label fLabel = simIndexValueLabel;
		simIndexSlider.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// 同步滑块和百分比显示
				fLabel.setText(
					Integer.valueOf(fSlider.getSelection()).toString()
					+ "%");
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
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
		pageFolderLabel.setBounds(column0Left, row0Top, column0Width, row0Height);
		pageFolderText.setBounds(column1Left, row0Top - 2, column1Width, row0Height - 2);
		browseButton.setBounds(column2Left, row0Top - 3, column2Width, row0Height);
		simIndexLabel.setBounds(column0Left, row1Top, column0Width, row1Height);
		simIndexSlider.setBounds(column1Left, row1Top - 3, column1Width, row1Height - 2);
		simIndexValueLabel.setBounds(column2Left, row1Top, column2Width, row1Height);
		startButton.setBounds(column0Left, row2Top, column0Width, row2Height);
		progress.setBounds(column1Left, row2Top + 1, column1Width, row2Height - 2);
	}
}
