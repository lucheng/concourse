package com.buptsse.wie.shell.models;

import java.util.*;
import java.util.concurrent.Callable;

import org.eclipse.swt.events.ModifyEvent;
import org.eclipse.swt.events.ModifyListener;
import org.eclipse.swt.events.MouseEvent;
import org.eclipse.swt.events.MouseListener;
import org.eclipse.swt.events.SelectionEvent;
import org.eclipse.swt.events.SelectionListener;
import org.eclipse.swt.widgets.*;

public abstract class ModelBase {
	private Map<String, Object> data;
	private Shell shell;
	private static Map<String, ArrayList<Callback>> events = new HashMap<String, ArrayList<Callback>>();
	
	public static void subscribeGlobalEvent(String event, Callback callback) {
		if (!events.containsKey(event)) {
			events.put(event, new ArrayList<Callback>());
		}
		
		events.get(event).add(callback);
	}
	
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
	
	protected Object getProperty(String propertyName) {
		if (data.containsKey(propertyName)) {
			return data.get(propertyName);
		}
		else {
			return null;
		}
	}
	
	protected void handleAction(String actionName) {
		if (actionName == "exit") {
			shell.close();
		}
	}
	
	protected void updateProgress(int progress) {
		
	}
}
