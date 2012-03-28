package com.buptsse.ate.cBigram;


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

import com.buptsse.ate.cSingle.CSingleTermExtraction;
import com.buptsse.ate.utils.Constant;
import com.buptsse.ate.utils.SplitWord;

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
//	private String inPath;
	private HashSet<String> userDictList;
	private ArrayList<Vector<String[]>> vecList;

	public CBigramExtraction(HashSet<String> userDictList,
			CSingleTermExtraction ste) {
		maps = new ArrayList<HashMap<String, Integer>>();
		vecList = ste.getVecList();
//		this.inPath = inPath;
		this.userDictList = userDictList;
		PropertyConfigurator.configure(Constant.LOG4J);
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
				for (int k = 0; k < result.length - 1; k++) { // ��һ���ж���һ���ʵ�ʱ�򣬽���ѭ��
					if (result[k].length() > 0 && result[k + 1].length() > 0) {
						if (matchObject.match(result[k], result[k + 1])) { // �жϰ��ŵ��������Ƿ�ʱn����vn
							subStr = result[k] +" "+ result[k + 1];
							subStr = splitWord.split(subStr); // ���������ʺϳ�˫����
								if (map.containsKey(subStr)) { // ��map����д���˫����򽫸�˫����Ĵ�����1
									int count = map.get(subStr);
									count += 1;
									map.put(subStr,count);									
								} else { // ��map�л�ûд���˫��������Ӹ�˫����Ҽ������Ϊ1
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
		// ѵ���ı��е����е�����Ŀ
		for (int i = 0; i < maps.size(); i++) {
			HashMap<String, Integer> map = maps.get(i);
			ConcurrentHashMap<String, Integer> conMap = new ConcurrentHashMap<String, Integer>(map);
			for (Entry<String, Integer> entry : conMap.entrySet()) {
				int temp = entry.getValue();
				String key = entry.getKey();
					// �жϸô��Ƿ����û��ʵ���
					if (!userDictList.contains(key)) {
						if (temp < Constant.DOUBLETHRESHOLD) {
							conMap.remove(key);
						} else {
								log.info(key+temp);
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
