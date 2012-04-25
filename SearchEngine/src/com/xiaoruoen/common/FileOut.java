package com.xiaoruoen.common;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import org.htmlparser.nodes.TagNode;
/**
 * 写文件的类
 * @author xiaoruoen
 *
 */
public class FileOut {
	private long currenttime = 0;
	private static FileOut instance;
	private FileOut(){
		
	}
	public static FileOut instance(){
		if(instance == null){
			synchronized (FileOut.class) {
				if(instance == null){
					instance = new FileOut();
				}
			}
		}
		return instance;
	}
	/**
	 * 用来一分钟创建一个文件夹，一秒钟写一个文件
	 * @param content
	 */
	public void write(String content){
		File file = null;
		BufferedWriter writer;
		try {
			String path = CommonData.itemrecord;
			long nowtime = System.currentTimeMillis();
			if ((nowtime - currenttime) > 60000) {
				path += ("\\" + nowtime);
				currenttime = nowtime;
				if(file != null){
					file.setReadable(true);
				}
			} else {
				path += ("\\" + currenttime);
			}
			file = new File(path);
			if(!file.exists()){
				file.mkdirs();
			}
			file = new File(path+"\\"+nowtime+".txt");
			writer = new BufferedWriter(new FileWriter(file));
			writer.write(content);
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 用来将内容写到固定位置
	 * @param content
	 * @param dir
	 */
	public void write(String content,String dir){
		File file = null;
		BufferedWriter writer;
		try {
			writer = new BufferedWriter(new FileWriter(dir));
			writer.write(content);
			writer.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
