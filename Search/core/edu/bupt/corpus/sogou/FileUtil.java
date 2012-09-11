package edu.bupt.corpus.sogou;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;

/**
 * 文件相关的处理函数
 * 
 * @author DAWN
 * 
 */
public class FileUtil {

	/**
	 * 用GBK编码读取一个文件，返回文件内容为一个字符串
	 * 
	 * @param file
	 *            文件名
	 * @return 一个字符串代表文件内容
	 * @throws IOException
	 */
	public static String readEntire(String file) {
		return readEntire(file, "gbk");
	}

	/**
	 * 用指定编码读取一个文件，返回文件内容为一个字符串
	 * 
	 * @param file
	 *            文件名
	 * @param encoding
	 *            编码
	 * @return 一个字符串代表文件内容
	 * @throws IOException
	 */
	public static String readEntire(String file, String encoding) {
		BufferedReader reader = null;
		try {
			reader = new BufferedReader(new InputStreamReader(
					new FileInputStream(file), encoding));
		} catch (UnsupportedEncodingException e) {
			System.out.println("编码格式不支持!");
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			System.out.println("文件没有发现 !");
			e.printStackTrace();
		}
		StringBuilder sb = new StringBuilder();
		String line = null;
		try {
			while (true) {
				line = reader.readLine();
				if (line == null)
					break;
				sb.append(line).append("\n");
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				reader.close();
			} catch (IOException e) {
				System.out.println("输入流没有关闭!");
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	/**
	 * 读取一个文件，返回文件内容为一个字符串.(默认情况下使用GBK，中英文支持).
	 * 
	 * @param file
	 *            文件对象.
	 * @return 文件内容的字符串.
	 */
	public static String readEntire(File file) throws IOException {
		StringBuffer sb = new StringBuffer();
		String line;
		BufferedReader br = new BufferedReader(new InputStreamReader(
				new FileInputStream(file), "GBK"));
		while ((line = br.readLine()) != null) {
			sb = sb.append(line).append("\n\r");
		}
		br.close();
		String text = sb.toString();
		return text;
	}

	/**
	 * 读取文件路径，返回文件内容为一个字符串.
	 * 
	 * @param dir
	 *            文件所在父路径.
	 * @param filename
	 *            文件名称.
	 * @return 文件内容的字符串.
	 */
	public static String getFileContentString(String dir, String filename)
			throws IOException {
		File file = new File(dir, filename);
		String text = readEntire(file);
		return text;
	}

	/**
	 * 返回文件夹fileDir下面的文件名称String[].
	 * 
	 * @param fileDir
	 */
	public static String[] getFileList(String fileDir) throws IOException {
		File files = new File(fileDir);
		if (files.list() == null) {
			System.out.println("files.list()指针为空！");
		}
		if (files.list().length == 0)
			System.out.println("文件夹" + fileDir + "下面没有文件");
		return files.list();

	}

	/**
	 * 判断一个文件(夹)是否存在.
	 * 
	 * @param filepath
	 * @return true=存在 false=不存在
	 */
	public static boolean isFileExisted(String filepath) {
		if (!new File(filepath).exists()) {
			System.out.println("File:" + filepath + " did not exist!");
			return false;
		}
		return true;
	}

}