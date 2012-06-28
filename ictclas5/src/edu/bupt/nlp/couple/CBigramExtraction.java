package edu.bupt.nlp.couple;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Vector;
import java.util.concurrent.ConcurrentHashMap;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import edu.bupt.nlp.single.CSingleTermExtraction;
import edu.bupt.nlp.utils.Constant;
import edu.bupt.nlp.utils.SplitWord;

/**
 * This class extracts bigrams. First it extracts candidate terms from the
 * tagged files. Then it calculate to extract bigrams from the candidate terms.
 * 
 * @author ZhuYan
 * 
 */

public class CBigramExtraction {

	private Logger log = Logger.getLogger(getClass());
	
	private ArrayList<HashMap<String, Integer>> maps;
	private HashSet<String> userDictList;
	private ArrayList<Vector<String[]>> vecList;

	public CBigramExtraction(HashSet<String> userDictList,
			CSingleTermExtraction ste) {
		maps = new ArrayList<HashMap<String, Integer>>();
		vecList = ste.getVecList();
		this.userDictList = userDictList;
		
	}

	/**
	 * create maps. the map contains candidate term, its
	 * frequency and the frequency of the single word in the term.
	 */
	public void createMaps() {

		Match matchObject = new Match();
		SplitWord splitWord = new SplitWord();
        HashMap<String, Integer> map = new HashMap<String, Integer>();
		Iterator<Vector<String[]>> vecIter = vecList.iterator();
		while (vecIter.hasNext()) {
			Vector<String[]> vec = vecIter.next();
			String subStr;
			for (int i = 1; i < vec.size(); i++) {
				String[] tempRes = vec.get(i);
				String[] result = new String[vec.get(i).length];
				for (int j = 0; j < tempRes.length; j++) {
					result[j] = tempRes[j];
				}
				for (int k = 0; k < result.length - 1; k++) { // 当一行有多于一个词的时候，进入循环
					if (result[k].length() > 0 && result[k + 1].length() > 0) {
						if (matchObject.match(result[k], result[k + 1])) { // 判断挨着的两个词是否都时n或者vn
							subStr = result[k] +" "+ result[k + 1];
							subStr = splitWord.split(subStr); // 将两个名词合成双术语
								if (map.containsKey(subStr)) { // 若map中已写入该双术语，则将该双术语的次数加1
									int count = map.get(subStr);
									count += 1;
									map.put(subStr,count);									
								} else { // 若map中还没写入该双术语，则增加该双术语，且记其次数为1
									int temp = 1;
									map.put(subStr, temp);										
								}							
						}
					}
				}
			}
		}
		maps.add(map);
	}

	/**
	 * calculate to extract terms from the candidate terms.
	 * @throws IOException 
	 */
	public void extract() throws IOException {
		BufferedWriter bw = new BufferedWriter(new FileWriter(Constant.RESULT_FILE,true));
		bw.newLine();
		// 训练文本中的所有单词数目
		for (int i = 0; i < maps.size(); i++) {
			HashMap<String, Integer> map = maps.get(i);
			ConcurrentHashMap<String, Integer> conMap = new ConcurrentHashMap<String, Integer>(map);
			for (Entry<String, Integer> entry : conMap.entrySet()) {
				int temp = entry.getValue();
				String key = entry.getKey();
					// 判断该词是否在用户词典中
					if (!userDictList.contains(key)) {
						if (temp < Constant.DOUBLETHRESHOLD) {
							conMap.remove(key);
						} else {
//								log.info(key+temp);
								bw.write(key+temp);
								bw.newLine();
							}
						}
					}
			map.clear();
			map.putAll(conMap);
			}
			bw.flush();
			bw.close();
			
		}
	
	
	public ArrayList<HashMap<String, Integer>> getMaps() {
		return maps;
	}

}
