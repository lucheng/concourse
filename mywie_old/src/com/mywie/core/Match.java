package com.mywie.core;

import com.mywie.utils.FileHelp;
import com.mywie.utils.XmlHelp;

public class Match {
	static {
		System.loadLibrary("matchDll");
		System.loadLibrary("jniDll");
	}

	public native static int sum(int a, int b);

	public native static void matchAndAlign(String dir, double rate);

	public static void main(String argv[]) {
		System.out.println(sum(2, 3));
		String dir = "C:/Users/xiaoxinchen/Desktop/ยÛฮฤ/อ๘าณ/taobao1/";
		FileHelp.makedir(dir + "/template");
		matchAndAlign(dir, 0.9);		
	}
}