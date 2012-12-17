package com.buptsse.wie.shell.models;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseListener;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Shell;
import org.eclipse.swt.widgets.Slider;
import org.eclipse.swt.widgets.Text;

/**
 * ����ģ��Ļ���
 * �ṩȫ���¼�����/����,��ע��ؼ�����/�����Ȼ�������.
 * 
 */
public abstract class ModelBase {
	
	//���ݱ�
	private Map<String, Object> data;
	private Shell shell;
	//ȫ���¼���
	private static Map<String, ArrayList<Callback>> events = new HashMap<String, ArrayList<Callback>>();
	
	//����ȫ���¼�,ָ�����ֵ�ʱ�䷢���󽫵��ûص��ӿ�.
	public static void subscribeGlobalEvent(String event, Callback callback) {
		if (!events.containsKey(event)) {
			events.put(event, new ArrayList<Callback>());
		}
		
		events.get(event).add(callback);
	}
	
	//����ȫ���¼�,����ָ�����Ƶ��¼�,�����������ݸ����ж����ߵĻص��ӿ�
	public static void publishGlobalEvent(String event, Object param) {
		if (events.containsKey(event)) {
			for (Callback callback : events.get(event)) {
				if (callback != null) {
					callback.invoke(param);
				}
			}
		}
	}
	
	public ModelBase(Shell shell) {
		data = new HashMap<String, Object>();
		this.shell = shell;
	}
	
	protected Shell getShell() {
		return shell;
	}
	
	//ע���ı���,�����ı�����,���ĺ��ı�����Ϊָ������������.
	public void registerTextProperty(String propertyName, Text text) {	
		final String property = propertyName;
		final Text widget = text;
		
		data.put(property, widget.getText());
		text.addModifyListener(new ModifyListener() {
			
			@Override
			public void modifyText(ModifyEvent arg0) {
				// TODO Auto-generated method stub
				data.put(property, widget.getText());
			}
		});
	}
	
	//ע�Ử��,�����������,���ĺ�ֵ����Ϊָ����������.
	public void registerSliderProperty(String propertyName, Slider slider) {
		final String property = propertyName;
		final Slider widget = slider;
		
		data.put(property, widget.getSelection());
		slider.addSelectionListener(new SelectionListener() {
			
			@Override
			public void widgetSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				data.put(property, widget.getSelection());
			}
			
			@Override
			public void widgetDefaultSelected(SelectionEvent arg0) {
				// TODO Auto-generated method stub
				widgetSelected(arg0);
			}
		});
	}
	
	//ע�ᰴť����,��ť���º󽫴���ָ�����Ƶ�Action
	public void registerButtonAction(String actionName, Button button) {
		final String action = actionName;
		final Button widget = button;
		
		button.addMouseListener(new MouseListener() {
			
			@Override
			public void mouseUp(MouseEvent arg0) {
				// TODO Auto-generated method stub
				if (arg0.button == 1) {
					handleAction(action);
				}
			}
			
			@Override
			public void mouseDown(MouseEvent arg0) {
				// TODO Auto-generated method stub
				
			}
			
			@Override
			public void mouseDoubleClick(MouseEvent arg0) {
				// TODO Auto-generated method stub
				
			}
		});
	}
	
	//��ȡָ�����ֵ�����ֵ.
	protected Object getProperty(String propertyName) {
		if (data.containsKey(propertyName)) {
			return data.get(propertyName);
		}
		else {
			return null;
		}
	}
	
	//����Action,����Ӧ��д�˷����Դ����Լ��İ�ť����.
	protected void handleAction(String actionName) {
		if (actionName == "exit") {
			shell.close();
		}
	}
	
	protected void updateProgress(int progress) {
		
	}
}
