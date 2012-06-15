package edu.bupt.nlp.resources;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.TreeSet;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import edu.bupt.nlp.textrank.Word;

/**
 * 实体类
 * @author linzhe
 * @email  m23linzhe@gmail.com
 * @date   2012-6-7
 */

public class WebEntities {

	private static Logger logger = Logger.getLogger(WebEntities.class);
	
	TreeSet<String> eWord = new TreeSet<String>();
	String dicPath = "./ICTCLAS_CONFIG/webentities.txt";
	HashMap<String, Long> lastModTime = new HashMap<String, Long>();

	public WebEntities(String dicPath1,boolean b){
		this.dicPath = dicPath1;
		// 定期监视文件改动
		Timer timer = new Timer(true);
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				read(dicPath);
			}


		}, new Date(System.currentTimeMillis() + 10000), 24*60*60*1000);
	}
	/**
	 * 构造函数
	 * @param dicPath
	 *        实体文件所在地址
	 */

	public WebEntities(String dicPath) {		
		this.dicPath = dicPath;
		read(dicPath);		
	}
	
	public WebEntities() {		
		read(dicPath);		
	}

	/**
	 * 读取实体文件
	 * @param dicPath 实体文件所在地址
	 * @throws FileNotFoundException
	 */

	public void read(String dicPath) {

		File path = new File(dicPath);
		if(path.isDirectory()){
			String[] subdir = path.list(new FilenameFilter() {

				@Override
				public boolean accept(File dir, String name) {
					if(name.toLowerCase().endsWith("txt"))
						return true;
					else
						return false;
				}
			});
			for(int i=0;i<subdir.length;i++){
				read(path+"/"+subdir[i]);
			}
			return;
		}
		Long newTime = path.lastModified();
		Long lastTime = lastModTime.get(dicPath);
		if(lastTime ==null || !lastTime.equals(newTime)){
			//路径是文件
			try{
				InputStreamReader read = new InputStreamReader(new FileInputStream(path), "UTF-8");
				BufferedReader in = new BufferedReader(read);
				String s;
				while ((s = in.readLine()) != null){ 
					s = s.trim();
					if (!s.matches("^$"))
						eWord.add(s.toLowerCase());
				}
				in.close();
			}catch (Exception e) {
				System.err.println("实体文件路径错误");
			}
		}
	}

	

	Pattern noise = Pattern.compile(".*["+CharSets.allRegexPunc+"\\d]+.*");
	
	public boolean isWebEntity(String word) {
		
		word = word.toLowerCase();
		
		if (word.length() == 1)
			return false;

		if (noise.matcher(word).matches())
			return false;

		if (eWord.contains(word))
			return true;

		return false;
	}
	public static void main(String[] args){
		WebEntities entityDic = new WebEntities("./ICTCLAS_CONFIG/webentities.txt");
		System.out.println(entityDic.isWebEntity("Google"));
		System.out.println(entityDic.isWebEntity("我#"));	
		System.out.println(entityDic.isWebEntity(" "));	
	}
	
}
