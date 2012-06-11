package com.buptsse.ate.cSingle;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map.Entry;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.buptsse.ate.utils.Constant;
import com.buptsse.ate.utils.SplitWord;

/**
 * This class extracts single terms. First it extracts candidate terms from the
 * tagged files. Then it calculate to extract single terms from the candidate terms.
 * 
 * @author ZhuYan
 * 
 */
public class CSingleTermExtraction {

	private Logger log = Logger.getLogger(getClass());
	
	private ArrayList<HashMap<String, Integer>> maps;
	private String inPath;
	private HashSet<String> userDictList;
	private ArrayList<Vector<String[]>> vecList;

	public CSingleTermExtraction(String path, HashSet<String> userDictList) {
		maps = new ArrayList<HashMap<String, Integer>>();
		vecList = new ArrayList<Vector<String[]>>();
		this.inPath = path;
		this.userDictList = userDictList;
		
	}
	
	/**
	 * extract nouns and their frequency from the single file and store the
	 * results into maps.
	 * 
	 * @throws FileNotFoundException
	 * @throws IOException
	 */
	public void createMap() {
		
		StopList stopList = new StopList();
		Match match = new Match();
		SplitWord splitWord = new SplitWord();
		ArrayList<File> inDir = new ArrayList<File>();
		File rootDir = new File(inPath);
		inDir.add(rootDir);
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		/**
		 * Change the implementation: allowing nested directories.
		 */
		while (!inDir.isEmpty()) {
			File currentFile = inDir.remove(0);
			File[] currentFiles = currentFile.listFiles();
			for (int k = 0; k < currentFiles.length; k++) {
				if (currentFiles[k].isDirectory()) {
					inDir.add(currentFiles[k]);
				} else {
					try {
						FileReader fin = new FileReader(currentFiles[k]); 
						BufferedReader bin = new BufferedReader(fin);
						
						String str;
						
						Vector<String[]> vector = new Vector<String[]>();
						String[] name = new String[1];
						name[0] = currentFiles[k].getAbsolutePath().toString();
						vector.add(0, name);
						while ((str = bin.readLine()) != null) {
							
							String[] result = str.trim().split(Constant.DELIMITER);
							String[] temp = new String[result.length];
							for (int j = 0; j < result.length; j++) 
							{
								temp[j] = result[j];
							}
							vector.add(temp);
							
							for (int i = 0; i < result.length; i++) {

								// 去掉一个字的词
								if (result[i].length() > 3) {
									
									if (match.match(result[i])) {
										result[i] = splitWord.split(result[i]);
                                        //result[i].replaceAll( "\\s", "");
//										log.info(result[i]);
										if (!stopList.find(result[i])) {
											if (map.containsKey(result[i])) {
												int count = map.get(result[i]);
												map.put(result[i], count + 1);
												//System.out.println(result[i]+(count + 1));
											} else {
												map.put(result[i], 1);
//												log.info(result[i]+"1");
											}
										}
									}
								}
							}
						}
						bin.close();
						fin.close();
						map.put(name[0], -999);
//						log.info("name:" + name[0]);
						vecList.add(vector);
					} catch (Exception e) {
						e.printStackTrace();
						log.info(e.getMessage());
					}
				}
			}
		}
		maps.add(map);
	} 
	
	/**
	 * calculate to extract terms from the candidate terms.
	 * @throws IOException 
	 * 
	 */
	public void extract() throws IOException {
		
		BufferedWriter bw = new BufferedWriter(new FileWriter(Constant.RESULT_FILE,true));
		
		for (int i = 0; i < maps.size(); i++) {
			HashMap<String, Integer> map = maps.get(i);
			ConcurrentHashMap<String, Integer> conMap = new ConcurrentHashMap<String, Integer>(map);
			for (Entry<String, Integer> entry : conMap.entrySet()) {
				int k = entry.getValue();
				// 保留文件路径和名称，若不是则需对该词进行判断后抽取
				if (k != -999) {
					String key = entry.getKey();
					
					// 如果不是用户字典里的词，且该词出现的次数小于单术语次数的阀值3，就去掉该词。否则，将其次数加2
					if (!userDictList.contains(key)) {
						if (k < Constant.SINGLETHRESHOLD) {
							conMap.remove(key);
						} else {
//							log.info(key+k);
							bw.write(key+k);
							bw.newLine();
						}
					}
				}
			}
			map.clear();
			map.putAll(conMap);
		}
		bw.flush();
		bw.close();
		//outputStreamWriter.close();   
		//fileOutputStream.close();  

		
	}
	
	public ArrayList<HashMap<String, Integer>> getMaps() {
		return maps;
	}
	
	public ArrayList<Vector<String[]>> getVecList() {
		return vecList;
	}

}
