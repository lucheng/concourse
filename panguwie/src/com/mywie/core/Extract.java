package com.mywie.core;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;
import org.eclipse.swt.widgets.Button;
import org.eclipse.swt.widgets.MessageBox;
import org.eclipse.swt.widgets.Text;

import com.mywie.gui.WieStatusBar;
import com.mywie.model.ExtractData;
import com.mywie.operate.MatchAlign;
import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class Extract extends Thread {
	
	private static String templateFile;
	private String markedFile;
	private Element root;
	private String directory;
	private Text textArea;
	
	private Button startButton;
	private MessageBox messageBox;
	
	public MessageBox getMessageBox() {
		return messageBox;
	}

	public void setMessageBox(MessageBox messageBox) {
		this.messageBox = messageBox;
	}

	public Button getStartButton() {
		return startButton;
	}

	public void setStartButton(Button startButton) {
		this.startButton = startButton;
	}

	private WieStatusBar statusBar;
	private String statusText;
	
	private MatchAlign matchAlign = new MatchAlign();
	
	private int extractType = 0;
	public static int QUICK = 1;
	public static int NORMAL = 2;
	
	private static Logger logger = Logger.getLogger(ExtractData.class.getName());

	public String getMarkedFile() {
		return markedFile;
	}

	public void setMarkedFile(String markedFile) {
		this.markedFile = markedFile;
	}
	
	public int getExtractType() {
		return extractType;
	}

	public void setExtractType(int extractType) {
		this.extractType = extractType;
	}
	
	public Text getTextArea() {
		return textArea;
	}

	public void setTextArea(Text textArea) {
		this.textArea = textArea;
	}

	public void extract() {
		
		if (this.getStatusBar() != null
				&& !this.getStatusBar().getDisplay().isDisposed()) {
			this.getStatusBar().getDisplay().syncExec(new Runnable() {
				public void run() {
					getStatusBar().changeToRunning();
					getStatusBar().setStatus("正在抽取数据...");
				}

			});
		}
		
		logger.info("#############信息抽取开始#############");
		long startTime = System.currentTimeMillis();

		try{
			
			ExtractData ed = new ExtractData(directory, templateFile);
			
			String[] extractFiles = FileHelp.getFiles(directory);
			
			for (int i = 0; i < extractFiles.length; i++) {
				
				Document doc = XmlHelp.getDocumentWithClean(extractFiles[i]);
				Element root2 = doc.getRootElement();
				List<Element> result = new ArrayList<Element>();
				List<Element> matchNodes1 = new ArrayList<Element>();
				List<Element> matchNodes2 = new ArrayList<Element>();
				
				/**
				 * 进行简单树匹配，得到所要抽取的节点
				 */
				matchAlign.match(root, root2, matchNodes1, matchNodes2);
				
				for (int j = 0; j < matchNodes1.size(); j++) {
					
					if (matchNodes1.get(j).attributeValue("semantic") != null) {
						
						matchNodes2.get(j).addAttribute("semantic", matchNodes1.get(j).attributeValue("semantic"));
						
						if(matchNodes1.get(j).attributeValue("block") != null){
							matchNodes2.get(j).addAttribute("block", matchNodes1.get(j).attributeValue("block"));
						}
						result.add(matchNodes2.get(j));
					}
				}
				if (result.size() > 0) {
					ed.extract(extractFiles[i], result);
				}
				
			}
			ed.close();
			
			logger.info("#############信息抽取结束#############");
			long endTime = System.currentTimeMillis();
			statusText = "数据抽取结束，用时" + (endTime - startTime) + "ms...";
			if (this.getStatusBar() != null
					&& !this.getStatusBar().getDisplay().isDisposed()) {
				this.getStatusBar().getDisplay().syncExec(new Runnable() {
					public void run() {
						getStatusBar().changeToStatus();
						getStatusBar().setStatus(statusText);
						getStartButton().setEnabled(true);
					}
				});
			}
			logger.info(statusText);
		}catch(Exception e){
			e.printStackTrace();
			logger.error("抽取错误：" + e.getMessage());
			statusText = "抽取错误...";
			if (this.getStatusBar() != null
					&& !this.getStatusBar().getDisplay().isDisposed()) {
				this.getStatusBar().getDisplay().syncExec(new Runnable() {
					public void run() {
						getStatusBar().changeToStatus();
						getStatusBar().setStatus(statusText);
						getStartButton().setEnabled(true);
						messageBox.setMessage("抽取错误");
						messageBox.open();
					}
				});
			}
		}
	}

	public void setTemplateFile(String templateFile) {
		this.templateFile = templateFile;
		this.root = XmlHelp.getDocument(templateFile).getRootElement();
	}

	public static String getTemplateFile() {
		return templateFile;
	}

	public Element getRoot() {
		return root;
	}

	public void setRoot(Element root) {
		this.root = root;
	}


	public String getDirectory() {
		return directory;
	}

	public void setDirectory(String directory) {
		this.directory = directory;
	}

	public void run(){
		extract();
	}

	public WieStatusBar getStatusBar() {
		return statusBar;
	}

	public void setStatusBar(WieStatusBar statusBar) {
		this.statusBar = statusBar;
	}
}
