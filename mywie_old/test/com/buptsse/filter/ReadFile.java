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
		String path = "crawl.log";// �����ļ�·��
		String outpath = "product_urls.txt";// �����ļ�·��
//		String content = "";// content�����ļ����ݣ�
		BufferedReader reader = null;// ����BufferedReader
		BufferedWriter writer = null;
		File file = new File(outpath);
		try {
			reader = new BufferedReader(new FileReader(path));
			
			writer = new BufferedWriter(new FileWriter(file));
			// ���ж�ȡ�ļ������뵽content�С�
			// ��readLine��������nullʱ��ʾ�ļ���ȡ��ϡ�
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
			// ���Ҫ��finally�н�reader����ر�
			if (reader != null) {
				try {
					reader.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
//		System.out.println("�ļ����ݣ�" + content);
	}
}
