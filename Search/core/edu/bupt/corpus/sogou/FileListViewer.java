package edu.bupt.corpus.sogou;

import java.io.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * 读取目录及子目录下指定文件名的路径 并放到一个数组里面返回遍历
 * 
 * @author DAWN
 * 
 */
public final class FileListViewer {

	public static List<String> fileList = new ArrayList<String>();

	/**
	 * 获取path目录下所有以suffix为后缀名的文件路径列表,(可以递归遍历）.
	 * 
	 * @param path
	 *            文件路径
	 * @param suffix
	 *            后缀名
	 * @param isdepth
	 *            是否遍历子目录
	 * @return
	 */
	public static List<String> getFileList(String fileDir, String suffix,
			boolean isdepth) {
		File file = new File(fileDir);
		FileListViewer.generateFilePathList(file, suffix, isdepth);
		return fileList;
	}

	private static void generateFilePathList(File f, String suffix,
			boolean isdepth) {
		// 是目录，同时需要遍历子目录
		if (f.isDirectory() && isdepth == true) {
			File[] t = f.listFiles();
			for (int i = 0; i < t.length; i++) {
				generateFilePathList(t[i], suffix, isdepth);
			}
		} else {
			String filePath = f.getAbsolutePath();
			if (suffix != null && suffix != "") {
				// 最后一个.(即后缀名前面的.)的索引
				int begIndex = filePath.lastIndexOf(".");
				String tempsuffix = "";
				if (begIndex != -1)// 有后缀名.
				{
					tempsuffix = filePath.substring(begIndex + 1,
							filePath.length());
				}
				if (tempsuffix.equals(suffix)) {// 满足后缀匹配
					fileList.add(filePath);
				}
			} else {
				// 后缀名为null则为所有文件
				fileList.add(filePath);
			}
		}
	}

	public static void main(String[] args) {
		List<String> arrayList = FileListViewer.getFileList(
				"D:\\语料库\\Sogou语料库\\SogouCA.reduced", "txt", true);
		if (arrayList.isEmpty()) {
			System.out.println("没有找到符号后缀要求的文件");
		} else {
			String message = "";
			message += "符号要求的文件数：" + arrayList.size() + "\r\n";
			System.out.println(message);

			for (Iterator<String> i = arrayList.iterator(); i.hasNext();) {
				String temp = (String) i.next();
				System.out.println(temp);
				message += temp + "\r\n";
			}
		}
	}
}