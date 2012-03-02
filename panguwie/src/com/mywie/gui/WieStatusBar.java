package com.mywie.gui;

import java.io.InputStream;

import org.eclipse.swt.SWT;
import org.eclipse.swt.graphics.Image;
import org.eclipse.swt.graphics.ImageData;
import org.eclipse.swt.graphics.ImageLoader;
import org.eclipse.swt.graphics.Rectangle;
import org.eclipse.swt.widgets.Composite;
import org.eclipse.swt.widgets.FileDialog;
import org.eclipse.swt.widgets.Label;

import com.mywie.gui.impl.CompositeImpl;

public class WieStatusBar extends CompositeImpl {
	private Label status = null;
	ImageViewer runningImage = null;
	ImageViewer statusImage = null;

	public WieStatusBar(Composite parent, int style) {
		super(parent, style);
		initialize();
	}

	private void initialize() {
		this.setLayout(null);
		status = new Label(this, SWT.NONE);
		status.setBounds(new Rectangle(0, 15, 300, 50));
		createRunningImage();
		createStatusImage();
		setStatus("Ready.");
	}

	public void createRunningImage() {
		runningImage = new ImageViewer(this);

		runningImage.setBounds(new Rectangle(350, 0, 150, 50));
		InputStream is = WieStatusBar.class.getResourceAsStream("running.gif");
		ImageLoader loader = new ImageLoader();
		ImageData[] imageDatas = loader.load(is);
		if (imageDatas.length == 0)
			return;
		else if (imageDatas.length == 1) {
			runningImage.setImage(imageDatas[0]);
		} else {
			runningImage.setImages(imageDatas, loader.repeatCount);
		}
		runningImage.pack();
		runningImage.setVisible(false);
	}

	public void createStatusImage() {
		statusImage = new ImageViewer(this);

		statusImage.setBounds(new Rectangle(450, 0, 50, 50));
		InputStream is = WieStatusBar.class.getResourceAsStream("status.gif");
		ImageLoader loader = new ImageLoader();
		ImageData[] imageDatas = loader.load(is);
		if (imageDatas.length == 0)
			return;
		else if (imageDatas.length == 1) {
			statusImage.setImage(imageDatas[0]);
		} else {
			statusImage.setImages(imageDatas, loader.repeatCount);
		}
		statusImage.pack();
	}

	public void changeToRunning() {
		runningImage.setVisible(true);
		statusImage.setVisible(false);
	}

	public void changeToStatus() {
		runningImage.setVisible(false);
		statusImage.setVisible(true);
	}

	public void setStatus(String text) {
		status.setText(text);
	}

}
