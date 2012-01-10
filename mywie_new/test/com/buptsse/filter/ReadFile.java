package com.buptsse.filter;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class ReadFile {

	public static StringBuffer content = new StringBuffer();
	
	public static void main(String[] args) {
		read();
//		write("product_urls.txt", content.toString());
	}

	public static void read() {
		String path = "crawl.log";// 定义文件路径
		String outpath = "product_urls.txt";// 定义文件路径
//		String content = "";// content保存文件内容，
		BufferedReader reader = null;// 定义BufferedReader
		BufferedWriter writer = null;
		File file = new File(outpath);
		try {
			reader = new BufferedReader(new FileReader(path));
			
			writer = new BufferedWriter(new FileWriter(file));
			// 按行读取文件并加入到content中。
			// 当readLine方法返回null时表示文件读取完毕。
			String line = null;
			int counter = 0;
			System.out.println("121212");
			while ((line = reader.readLine()) != null) {
				if (line.startsWith("fetching http://www.360buy.com/product/")){
//					System.out.println(line);
					writer.write(line + "\n");
					counter++;
				}
			}
			System.out.println(counter);
			writer.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 最后要在finally中将reader对象关闭
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
//		System.out.println("文件内容：" + content);
	}
}
