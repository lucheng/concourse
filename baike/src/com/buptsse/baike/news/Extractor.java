package com.buptsse.baike.news;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;

import com.buptsse.baike.module.Page;
import com.buptsse.baike.utils.FileHelp;
import com.buptsse.baike.utils.Parser;

/**
 * 提取实体类
 * 
 * @author linzhe
 * @email m23linzhe@gmail.com
 * @date 2012-5-31
 */
public class Extractor {
	
	private static Logger logger = Logger.getLogger(Extractor.class);

	final private static String BAIKE_XML_PATH = "\\\\buptsse215-02\\data\\baidu\\";
	final private static String ENTITY_FILE_PATH = "./ICTCLAS_CONFIG/entity.txt";
	
	final private static String PAGE_FILE_PATH = "\\\\buptsse215-02\\data\\baidu\\";
	final private static String TAG_FILE_NAME = "d:\\data\\tags\\tags.txt";
	final private static String TITLE_FILE_NAME = "d:\\data\\tags\\titles.txt";
	final private static String CONTENT_FILE_PATH = "d:\\data\\contents\\";

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
		
		for (int i = 2172; i < 7000000; i++) {
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
	 * 提取Tag
	 */
	public void extractTags(List<NewsItem> itemList, String fileName) throws IOException {

		File tagFile = new File(fileName);
		if (tagFile.exists()) {
			System.out.println("文件存在");
		} else {
			System.out.println("文件不存在，正在创建...");
			if (tagFile.createNewFile()) {
				System.out.println("文件创建成功！");
			} else {
				System.out.println("文件创建失败！");
			}
		}
		BufferedWriter output = new BufferedWriter(new FileWriter(tagFile, true));
		
		for (int i = 0; i < itemList.size(); i++) {
			NewsItem newsItem = itemList.get(i);
			logger.info(newsItem.getTitle());
			List<Tag> tags = newsItem.getTagList();
			for(int j = 0; j < tags.size(); j++){
				output.append(tags.get(j).getTag() + "@@tag" + System.getProperty("line.separator"));
			}
		}
		output.close();
	}
	
	public void extractTitles(List<NewsItem> itemList, String fileName) throws IOException {

		File tagFile = new File(fileName);
		if (tagFile.exists()) {
			System.out.println("文件存在");
		} else {
			System.out.println("文件不存在，正在创建...");
			if (tagFile.createNewFile()) {
				System.out.println("文件创建成功！");
			} else {
				System.out.println("文件创建失败！");
			}
		}
		BufferedWriter output = new BufferedWriter(new FileWriter(tagFile, true));
		
		for (int i = 0; i < itemList.size(); i++) {
			NewsItem newsItem = itemList.get(i);
			logger.info(newsItem.getTitle());
			output.append(newsItem.getTitle() + System.getProperty("line.separator"));
		}
		output.close();
	}

	
	public void extractContents(List<NewsItem> itemList, String filePath) throws IOException {

		for (int i = 0; i < itemList.size(); i++) {
			
			File contentFile = new File(filePath + i + ".txt");
			if (contentFile.exists()) {
				System.out.println("文件存在");
			} else {
				System.out.println("文件不存在，正在创建...");
				if (contentFile.createNewFile()) {
					System.out.println("文件创建成功！");
				} else {
					System.out.println("文件创建失败！");
				}
			}
			BufferedWriter output = new BufferedWriter(new FileWriter(contentFile, true));
			
			NewsItem newsItem = itemList.get(i);
//			logger.info(newsItem.getSummary());
			output.append(newsItem.getSummary());
			output.close();
		}
	}
	public List<NewsItem> parse(String filePath){
		
		
		List<NewsItem> newsItems = new ArrayList<NewsItem>();
		List<String> filelist = new ArrayList<String>();
		
		FileHelp.refreshFileList(filePath, filelist, ".xml");
		
		
		for(String fileName : filelist){
			try{
				ItemParser parser = new ItemParser();
				NewsItem newsItem = parser.parse(fileName);
				newsItems.add(newsItem);
			}catch(Exception e){
				continue;
			}
		}
		
		return newsItems;
	}
	
	/**
     * 以行为单位读取文件，常用于读面向行的格式化文件
     */
    public static void readFileByLines(String fileName) {
        File file = new File(fileName);
        BufferedReader reader = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
                System.out.println("line " + line + ": " + tempString);
                line++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
    }
    
	public void split(String fileName, String newFileName){
		
		String content = "";
		File file = new File(fileName);
        BufferedReader reader = null;
        try {
            System.out.println("以行为单位读取文件内容，一次读一整行：");
            reader = new BufferedReader(new FileReader(file));
            String tempString = null;
            int line = 1;
            // 一次读入一行，直到读入null为文件结束
            while ((tempString = reader.readLine()) != null) {
                // 显示行号
//                System.out.println("line " + line + ": " + tempString);
                content += tempString;
                line++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
        content = content.replace("  ", ",");
        content = content.replace("，", ",");
        content = content.replace("@@tag", ",");
        String[] contents = content.split(",");
        
        Set<String> tagSet = new HashSet<String>();
        for(int i = 0; i < contents.length; i++){
        	if(!contents[i].equals("")){
        		System.out.println("==" + contents[i].trim());
        		tagSet.add(contents[i].trim());
        	}
        }
        
        String clearStr = "";
        for(String str : tagSet){
        	clearStr += str + System.getProperty("line.separator");
        }
        FileHelp.writeFile(TAG_FILE_NAME + ".txt", clearStr);
        logger.info(tagSet.size());
	}
	
	public static void f(int n)
	{
		for(int i=0;i<n;i++)
		{
			for(int j=0;j<n;j++)
			{
				System.out.print(Math.min(i,j));
			}
			System.out.println();
		}
	}
	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		
		Extractor extractor = new Extractor();
		/*try {
			extractBaike();
		} catch (IOException e) {
			e.printStackTrace();
		}*/
		
		/*List<NewsItem> itemList = extractor.parse("D:/data/xml");
		extractor.extractTags(itemList, TAG_FILE_NAME);*/
		
		/*List<NewsItem> itemList = extractor.parse("D:/data/xml");
		extractor.extractTitles(itemList, TITLE_FILE_NAME);*/
		
		/*List<NewsItem> itemList = extractor.parse("D:/data/xml");
		extractor.extractContents(itemList, CONTENT_FILE_PATH);*/
		
//		extractor.split(TAG_FILE_NAME, "");
	}

}
