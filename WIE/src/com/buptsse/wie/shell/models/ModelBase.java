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
 * 界面模块的基类
 * 提供全局事件发布/侦听,和注册控件属性/动作等基础服务.
 * 
 */
public abstract class ModelBase {
	
	//数据表
	private Map<String, Object> data;
	private Shell shell;
	//全局事件表
	private static Map<String, ArrayList<Callback>> events = new HashMap<String, ArrayList<Callback>>();
	
	//订阅全局事件,指定名字的时间发布后将调用回调接口.
	public static void subscribeGlobalEvent(String event, Callback callback) {
		if (!events.containsKey(event)) {
			events.put(event, new ArrayList<Callback>());
		}
		
		events.get(event).add(callback);
	}
	
	//发布全局事件,发布指定名称的事件,并将参数传递给所有订阅者的回调接口
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
	
	//注册文本框,侦听文本更改,更改后将文本保存为指定的属性名称.
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
	
	//注册滑块,侦听滑块更改,更改后将值保存为指定的属性名.
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
	
	//注册按钮动作,按钮按下后将触发指定名称的Action
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
	
	//获取指定名字的属性值.
	protected Object getProperty(String propertyName) {
		if (data.containsKey(propertyName)) {
			return data.get(propertyName);
		}
		else {
			return null;
		}
	}
	
	//处理Action,子类应重写此方法以处理自己的按钮动作.
	protected void handleAction(String actionName) {
		if (actionName == "exit") {
			shell.close();
		}
	}
	
	protected void updateProgress(int progress) {
		
	}
}
