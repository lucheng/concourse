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
 * ģ���������
 * ����������ģ�����ɵ�UI�߼�
 * 
 */
public class TemplateGenerationControlGroup extends Composite {
	
	TemplateGenerationModel model;

	public TemplateGenerationControlGroup(Composite parent, int style) {
		super(parent, style);
		
		//�ؼ��飺����ģ��
		Group group = new Group(this, SWT.NONE);
		group.setText("����ģ��");
		//��ǩ����ҳλ��
		Label pageFolderLabel = new Label(group, SWT.NONE);
		pageFolderLabel.setText("��ҳ��λ��:");
		//�ı�����ҳλ��
		final Text pageFolderText = new Text(group, SWT.BORDER);
		//��ť�����
		final Button browseButton = new Button(group, SWT.PUSH);
		browseButton.setText("���...");
		//��ǩ�����ƶ�
		Label simIndexLabel = new Label(group, SWT.NONE);
		simIndexLabel.setText("���ƶ���ֵ:");
		//���飺���ƶ�
		final Slider simIndexSlider = new Slider(group, SWT.NONE);
		simIndexSlider.setValues(0, 0, 100, SWT.NONE, 1, 10);
		simIndexSlider.setMaximum(110);
		simIndexSlider.setSelection(80);
		//��ǩ�����ƶ�ֵ
		Label simIndexValueLabel = new Label(group, SWT.NONE);
		simIndexValueLabel.setText("80%");
		//��ť����ʼ
		final Button startButton = new Button(group, SWT.PUSH);
		startButton.setText("��ʼ����");
		//�����������ɽ���
		final ProgressBar progress = new ProgressBar(group, SWT.NONE);
		progress.setVisible(false);
		
		//������ȡ��ʼ�¼�
		ModelBase.subscribeGlobalEvent("generateBegin", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// ����ȡ����ť,disable���ֿؼ�
						pageFolderText.setEnabled(false);
						browseButton.setEnabled(false);
						simIndexSlider.setEnabled(false);
						progress.setVisible(true);
						
						startButton.setText("ȡ��");
					}
				});
			}
		});
		
		//������ȡȡ���¼�
		ModelBase.subscribeGlobalEvent("generateCancel", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// TODO Auto-generated method stub
						startButton.setText("����ȡ��");
						startButton.setEnabled(false);
					}
				});
			}
		});
		
		//������ȡ�����¼�
		ModelBase.subscribeGlobalEvent("generateEnd", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// �ָ��ؼ�״̬
						pageFolderText.setEnabled(true);
						browseButton.setEnabled(true);
						simIndexSlider.setEnabled(true);
						progress.setVisible(false);
						progress.setSelection(0);
						
						startButton.setText("��ʼ����");
						startButton.setEnabled(true);
					}
				});
			}
		});
		
		//����ģ������ģ��
		model = new TemplateGenerationModel(getShell(), progress, getDisplay(),
				pageFolderText);
		//Ϊģ��ע��ؼ�����֪ͨ
		model.registerTextProperty("pageFolder", pageFolderText);
		model.registerSliderProperty("simIndex", simIndexSlider);
		model.registerButtonAction("genasync", startButton);
		model.registerButtonAction("browsePageFolder", browseButton);
		
		final Slider fSlider = simIndexSlider;
		final Label fLabel = simIndexValueLabel;
		simIndexSlider.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// ͬ������Ͱٷֱ���ʾ
				fLabel.setText(
					Integer.valueOf(fSlider.getSelection()).toString()
					+ "%");
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
		
		//�趨λ�úʹ�С
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
