package edu.bupt.nlp.couple;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import edu.bupt.nlp.utils.Constant;
import edu.bupt.nlp.utils.SplitWord;

/**
 * This class has two functions. First, it find out every 
 * word's frequency of occurrence in a single file.
 * Second, it calculate the amount of the words in all the
 * files. 
 * 
 * @author ZhuYan
 */

class Frequency {
	
	// 存放从所有文件中抽取出来的词，及其次数
	private Map<String, Integer> map;
	private String inPath;	
	private Logger log = Logger.getLogger(getClass());

	public Frequency(String path) {
		this.inPath = path;
		map = new HashMap<String, Integer>();
		createMap();
		
	}

	/**
	 * create a map which contains the words and their frequency
	 * for a single file or all the files under the directory specified.
	 * 
	 * @throws IOException
	 */
	private void createMap() {
		
		File file = new File(inPath);
		if(file.isFile()){
			FileReader fin = null;
			try {
				fin = new FileReader(file);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				log.info(e.getMessage());
			}
			BufferedReader bin = new BufferedReader(fin);
			String str;
			Pattern expression = Pattern.compile("[一-龥]+/[a-zA-Z]+");
			Matcher matcher;
			SplitWord splitWord = new SplitWord();
			try {
				while ((str = bin.readLine()) != null) {
					String[] result = str.split(Constant.DELIMITER);
					for (int i = 0; i < result.length; i++) {
						matcher = expression.matcher(result[i]);
						if (matcher.find()) {
							result[i] = splitWord.split(result[i]);
							if (map.containsKey(result[i])) {
								int count = map.get(result[i]);
								map.put(result[i], count + 1);
							} else {
								map.put(result[i], 1);
							}
						}
					}
				}
				bin.close();
				fin.close();
			} catch (IOException e) {
				e.printStackTrace();
				log.info(e.getMessage());
			}
		} else { // If is a directory, do the same job in a recursive way.
			ArrayList<File> inDir = new ArrayList<File>();
			File rootDir = new File(inPath);
			inDir.add(rootDir);
			
			while(!inDir.isEmpty()){
				File currentFile = inDir.remove(0);
				File[] currentFiles = currentFile.listFiles();
				for (int k = 0; k < currentFiles.length; k++) {
					if(currentFiles[k].isDirectory()){
						inDir.add(currentFiles[k]);
					} else {
						FileReader fin = null;
						try {
							fin = new FileReader(currentFiles[k]);
						} catch (FileNotFoundException e) {
							e.printStackTrace();
							log.info(e.getMessage());
						}
						BufferedReader bin = new BufferedReader(fin);
						String str;
						Pattern expression = Pattern.compile("[一-龥]+/[a-zA-Z]+");
						Matcher matcher;
						SplitWord splitWord = new SplitWord();
						try {
							while ((str = bin.readLine()) != null) {
								String[] result = str.split(Constant.DELIMITER);
								for (int i = 0; i < result.length; i++) {
									matcher = expression.matcher(result[i]);
									if (matcher.find()) {
										result[i] = splitWord.split(result[i]);
										if (map.containsKey(result[i])) {
											int count = map.get(result[i]);
											map.put(result[i], count + 1);
										} else {
											map.put(result[i], 1);
										}
									}
								}
							}
							bin.close();
							fin.close();
						} catch (IOException e) {
							e.printStackTrace();
							log.info(e.getMessage());
						}
					}				
				}
			}
		}		
	}

	/**
	 * search for the frequency of a word in a certain file.
	 * @param word
	 * @return the frequency of occurrence of the word
	 */
	public int searchWord(String word) {
		
		if (map.containsKey(word)) {
			int count = map.get(word);
			return count;
		}
		return 0;
		
	}

	/**
	 * calculate the amount of the words in all the original files.
	 * 
	 * @return the amount of the words in all the files
	 * @throws IOException
	 */
	public int sum(){
		
		int sum = 0;
		Pattern expression = Pattern.compile("[一-龥]+/[a-zA-Z]+");
		Matcher matcher;
		File file = new File(inPath);
		if(file.isFile()){
			FileReader fin = null;
			try {
				fin = new FileReader(file);
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				log.info(e.getMessage());
			}
			BufferedReader bin = new BufferedReader(fin);
			String str;

			try {
				while ((str = bin.readLine()) != null) {
					String[] result = str.split(Constant.DELIMITER);
					for (int i = 0; i < result.length; i++) {
						matcher = expression.matcher(result[i]);
						if (matcher.find()) {
							sum++;
						}
					}
				}
				bin.close();
				fin.close();
			} catch (IOException e) {
				e.printStackTrace();
				log.info(e.getMessage());
			}			
		} else { //If is a directory!
			ArrayList<File> inDir = new ArrayList<File>();
			File rootDir = new File(inPath);
			inDir.add(rootDir);
			
			while(!inDir.isEmpty()){
				File currentFile = inDir.remove(0);
				File[] files = currentFile.listFiles();
				for (int count = 0; count < files.length; count++) {
					if(files[count].isDirectory()){
						inDir.add(files[count]);
					} else {
						FileReader fin = null;
						try {
							fin = new FileReader(files[count]);
						} catch (FileNotFoundException e) {
							e.printStackTrace();
							log.info(e.getMessage());
						}
						BufferedReader bin = new BufferedReader(fin);
						String str;

						try {
							while ((str = bin.readLine()) != null) {
								String[] result = str.split(Constant.DELIMITER);
								for (int i = 0; i < result.length; i++) {
									matcher = expression.matcher(result[i]);
									if (matcher.find()) {
										sum++;
									}
								}
							}
							bin.close();
							fin.close();
						} catch (IOException e) {
							e.printStackTrace();
							log.info(e.getMessage());
						}
					}	
				}
			}
		}
		return sum;
		
	}
	
}
