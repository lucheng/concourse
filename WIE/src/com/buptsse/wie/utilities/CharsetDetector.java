package com.buptsse.wie.utilities;

import java.io.*;

import org.mozilla.intl.chardet.*;

/**
 * 字符编码检测类
 * 用于读取文件时文件编码的检测
 * 
 */
public class CharsetDetector {
	
	private nsDetector detector;
	
	private boolean found;
	private String charset;
	
	public static int JAPANESE = 1;
	public static int CHINESE = 2;
	public static int SIMPLIFIED_CHINESE = 3;
	public static int TRADITIONAL_CHINESE = 4;
	public static int KOREAN = 5;
	public static int UNKNOWN = 6;

	public CharsetDetector(int lang) {
		// TODO Auto-generated constructor stub
		detector = new nsDetector(lang);
	}
	
	public String detectFileCharset(File file)
		    throws FileNotFoundException, IOException {
		
		detector.Init(new nsICharsetDetectionObserver() {
			
			@Override
			public void Notify(String arg0) {
				// TODO Auto-generated method stub
				found = true;
				charset = arg0;
			}
		});
		
		byte[] buffer = new byte[2048];
		int length;
		
		BufferedInputStream stream = new BufferedInputStream(new FileInputStream(file));
		
		boolean done = false;
		boolean isAscii = true;
		
		while ((length = stream.read(buffer, 0, buffer.length)) != -1) {
			if (isAscii) {
				isAscii = detector.isAscii(buffer, length);
			}
			
			if (!isAscii && !done) {
				done = detector.DoIt(buffer, length, false);
			}
		}
		
		detector.DataEnd();
		
		if (isAscii) {
			charset = "us-ascii";
			found = true;
		}
		
		if (!found) {
			return null;
		}
		
		return charset;
	}
}