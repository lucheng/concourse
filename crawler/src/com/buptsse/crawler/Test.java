package com.buptsse.crawler;

import java.util.ArrayList;
import java.util.List;

import com.liu.core.BrowserMainWindow;
import com.trolltech.qt.gui.QApplication;

public class Test {
	public static void main(String[] args) {
		QApplication.initialize(args);
		List<String> urlList = new ArrayList<String>();
		for(int i = 1; i < 99999; i++) {
			urlList.add("http://baike.baidu.com/view/"+ i +".htm");
		}
		BrowserMainWindow ww = new BrowserMainWindow(urlList,"D:/panguso/baidu/","bufanye.js");
		ww.show();
		QApplication.exec();
	}
}

