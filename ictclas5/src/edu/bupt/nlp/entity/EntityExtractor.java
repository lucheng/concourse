package edu.bupt.nlp.entity;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

import com.buptsse.ate.module.Page;
import com.buptsse.ate.topicmain.KeyWordsExtractor;
import com.buptsse.ate.utils.FileHelp;
import com.buptsse.ate.utils.Parser;

/**
 * 提取实体类
 * 
 * @author linzhe
 * @email m23linzhe@gmail.com
 * @date 2012-5-31
 */
public class EntityExtractor {

	final private static String BAIKE_XML_PATH = "\\\\buptsse215-02\\data\\baidu\\";
	final private static String ENTITY_FILE_PATH = "./ICTCLAS_CONFIG/entity.txt";

	public static void extractBaike() throws IOException {

		String fileName = "";
		
		File entityFile = new File(ENTITY_FILE_PATH);
		if (entityFile.exists()) {
			System.out.println("文件存在");
		} else {
			System.out.println("文件不存在，正在创建...");
			if (entityFile.createNewFile()) {
				System.out.println("文件创建成功！");
			} else {
				System.out.println("文件创建失败！");
			}
		}
		BufferedWriter output = new BufferedWriter(new FileWriter(entityFile, true));
		
		for (int i = 1960; i < 700000; i++) {
			if(i % 70 == 0){
				output.flush();
			}
			try {
				fileName = BAIKE_XML_PATH + i + ".xml";
				File file = new File(fileName);
				System.out.println(i);
				if (file.exists()) {
					Page page = Parser.parseXmlFile(fileName);
					output.append(page.getTitle() + "@@ne" + System.getProperty("line.separator"));
//					System.out.println(page.getTitle());
				} else {
					// System.out.println("file is not exists");
				}
			} catch (Exception e) {
//				e.printStackTrace();
				System.out.println(fileName);
				/*String newfilename = "D:/data/error"
						+ fileName.substring(fileName.lastIndexOf("/",
								fileName.length()));
				FileHelp.copyFile(new File(fileName), new File(newfilename));*/
				continue;
			}
		}
		
		output.close();
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		try {
			extractBaike();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
