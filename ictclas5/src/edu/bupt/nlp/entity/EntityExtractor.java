package edu.bupt.nlp.entity;

import java.io.IOException;

import org.apache.log4j.Logger;

/**
 * 提取实体类
 * 
 * @author linzhe
 * @email m23linzhe@gmail.com
 * @date 2012-5-31
 */
public class EntityExtractor {
	
	private static Logger logger = Logger.getLogger(EntityExtractor.class);

	final public static String BAIKE_XML_PATH = "\\\\buptsse215-02\\data\\baidu\\";
	final public static String ENTITY_FILE_PATH = "./ICTCLAS_CONFIG/entity.txt";
	
	final public static String PAGE_FILE_PATH = "\\\\buptsse215-02\\data\\baidu\\";
	final public static String TAG_FILE_NAME = "d:\\data\\tags\\tags.txt";
	final public static String TITLE_FILE_NAME = "d:\\data\\tags\\titles.txt";

	
	
	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {

		EntityExtractor extractor = new EntityExtractor();
		
	}

}
