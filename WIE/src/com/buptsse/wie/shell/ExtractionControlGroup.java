package com.buptsse.wie.shell;

import org.eclipse.swt.SWT;
import org.eclipse.swt.widgets.*;

import com.buptsse.wie.shell.models.Callback;
import com.buptsse.wie.shell.models.ExtractionModel;
import com.buptsse.wie.shell.models.ModelBase;

/**
 * ��ȡ�ؼ����
 * �����������ȡ���ֵ�UI�߼���
 * 
 */
public class ExtractionControlGroup extends Composite {
	
	ExtractionModel model;

	public ExtractionControlGroup(Composite parent, int style) {
		super(parent, style);
		
		//�ؼ��飺���ݳ�ȡ
		Group group = new Group(this, SWT.NONE);
		group.setText("���ݳ�ȡ");
		
		//��ǩ��ģ���ļ�
		Label templateFileLabel = new Label(group, SWT.NONE);
		templateFileLabel.setText("ģ���ļ�:");
		//�ı���ģ���ļ�
		final Text templateFileText = new Text(group, SWT.BORDER);
		//��ť�����ģ���ļ�
		final Button templateBrowseButton = new Button(group, SWT.PUSH);
		templateBrowseButton.setText("���...");
		//��ǩ����ҳ��λ��
		Label pageFolderLabel = new Label(group, SWT.NONE);
		pageFolderLabel.setText("��ҳ��λ��:");
		//�ı�����ҳ��λ��
		final Text pageFolderText = new Text(group, SWT.BORDER);
		//��ť�������ҳ��Ŀ¼
		final Button pageBrowseButton = new Button(group, SWT.PUSH);
		pageBrowseButton.setText("���...");
		//��ť����ʼ��ȡ
		final Button startButton = new Button(group, SWT.PUSH);
		startButton.setText("��ʼ��ȡ");
		//������
		final ProgressBar progress = new ProgressBar(group, SWT.NONE);
		progress.setVisible(false);
		
		//������ȡ��ʼ�¼�
		ModelBase.subscribeGlobalEvent("extractBegin", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// ��ȡ��ʼ������ȡ����ť��disable ���ֿؼ���
						templateFileText.setEnabled(false);
						templateBrowseButton.setEnabled(false);
						pageFolderText.setEnabled(false);
						pageBrowseButton.setEnabled(false);
						progress.setVisible(true);
						
						startButton.setText("ȡ��");
					}
				});
			}
		});
		
		//������ȡȡ���¼�
		ModelBase.subscribeGlobalEvent("extractCancel", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// ���ð�ť
						startButton.setText("����ȡ��");
						startButton.setEnabled(false);
					}
				});
			}
		});
		
		//������ȡ�����¼�
		ModelBase.subscribeGlobalEvent("extractEnd", new Callback() {
			
			@Override
			public void invoke(Object param) {
				// TODO Auto-generated method stub
				getDisplay().asyncExec(new Runnable() {
					
					@Override
					public void run() {
						// �ָ��ؼ���Ĭ��״̬
						templateFileText.setEnabled(true);
						templateBrowseButton.setEnabled(true);
						pageFolderText.setEnabled(true);
						pageBrowseButton.setEnabled(true);
						progress.setVisible(false);
						progress.setSelection(0);
						
						startButton.setText("��ʼ��ȡ");
						startButton.setEnabled(true);
					}
				});
			}
		});
		
		//��ʼ����ȡģ�顣
		model = new ExtractionModel(getShell(), progress, getDisplay(), pageFolderText, templateFileText);
		//Ϊģ��ע��ؼ�����
		model.registerTextProperty("pageFolder", pageFolderText);
		model.registerTextProperty("template", templateFileText);
		model.registerButtonAction("browsePageFolder", pageBrowseButton);
		model.registerButtonAction("browseTemplate", templateBrowseButton);
		model.registerButtonAction("extract", startButton);
		
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
