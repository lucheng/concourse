package com.mywie.core;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.Text;

import com.mywie.control.Generater;
import com.mywie.gui.WieStatusBar;

public class HtmlMatch extends Thread {
	
	private String directory;
	private String markedFileName;
	private Text textArea;
	private int templateNum;
	private double rate;
	
	private long endTime;
	private long startTime;

	private WieStatusBar statusBar;
	private String statusText;
	private Button start;
	
	public Button getStart() {
		return start;
	}

	public void setStart(Button start) {
		this.start = start;
	}

	private static Logger logger = Logger.getLogger(HtmlMatch.class.getName());

	
	public String getMarkedFileName() {
		return markedFileName;
	}

	public void setMarkedFileName(String markedFileName) {
		this.markedFileName = markedFileName;
	}
	public Text getTextArea() {
		return textArea;
	}

	public void setTextArea(Text textArea) {
		this.textArea = textArea;
	}

	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}

	public Element getRootNode(Document doc) {
		return doc.getRootElement();
	}

	public void execute() {
		if (this.getStatusBar() != null
				&& !this.getStatusBar().getDisplay().isDisposed()) {
			this.getStatusBar().getDisplay().syncExec(new Runnable() {
				public void run() {
					getStatusBar().changeToRunning();
					getStatusBar().setStatus("正在分析网页集...");
				}

			});
		}
		startTime = System.currentTimeMillis();
		logger.info("#############开始分析网页集#################");
		
		try{
			Generater generate = new Generater(directory, rate);
			templateNum = generate.generateTemplates();
		}catch(Exception e){
			logger.error(e.getMessage());
			e.printStackTrace();
		}
		
		endTime = System.currentTimeMillis();
		
		if (this.getStatusBar() != null && !this.getStatusBar().getDisplay().isDisposed()) {
			this.getStatusBar().getDisplay().syncExec(new Runnable() {
				public void run() {
					if(templateNum <= 0){
						statusText = "网页集分析出错！";
					} else {
						statusText = "网页集分析结束，共生成" + (templateNum) + "个模板，用时" + (endTime - startTime) + "ms...";
						logger.info("##########" + statusText + "###########");
					}
					getStatusBar().changeToStatus();
					getStatusBar().setStatus(statusText);
					getStart().setEnabled(true);
				}

			});
		}
		
	}

	public double getRate() {
		return rate;
	}

	public void setRate(double rate) {
		this.rate = rate;
	}

	public WieStatusBar getStatusBar() {
		return statusBar;
	}

	public void setStatusBar(WieStatusBar statusBar) {
		this.statusBar = statusBar;
	}

	public void run() {
		try {
			execute();
		} catch (Exception e) {
			logger.error(e.getStackTrace());
			e.printStackTrace();
		}

	}
}
