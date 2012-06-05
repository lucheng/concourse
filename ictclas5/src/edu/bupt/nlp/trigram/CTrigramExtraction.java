package edu.bupt.nlp.trigram;

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
 * This class extracts trigrams. First it extracts candidate terms from the
 * tagged files. Then it calculate to extract trigrams from the cadidate terms.
 * 
 * @author ZhuYan
 * 
 */

public class CTrigramExtraction {

	private Logger log = Logger.getLogger(getClass());
	
	private ArrayList<HashMap<String, Integer>> maps;
	private HashSet<String> userDictList;
	private ArrayList<Vector<String[]>> vecList;

	public CTrigramExtraction(HashSet<String> userDictList,
			CSingleTermExtraction ste) {
		maps = new ArrayList<HashMap<String, Integer>>();
		vecList = ste.getVecList();
		this.userDictList = userDictList;
		
	}

	public ArrayList<HashMap<String, Integer>> getMaps() {
		return maps;
	}

	/**
	 * extract candidate trigrams and corresponding frequency from the single
	 * files, and store the results into maps.
	 */
	public void createMaps() {

		Match matchObject = new Match();
		SplitWord splitWord = new SplitWord();
		
		Iterator<Vector<String[]>> vecIter = vecList.iterator();
		while(vecIter.hasNext())
		{
			Vector<String[]> vec = vecIter.next();		
			String subStr;
			HashMap<String, Integer> map = new HashMap<String, Integer>();
			String name = vec.get(0)[0];
			
			for (int i = 1; i < vec.size(); i++)
			{
				String[] result = vec.get(i);
				for (int k = 0; k < result.length - 2; k++) {
					if (result[k].length() > 0
							&& result[k + 1].length() > 0
							&& result[k + 2].length() > 0) {
						if (matchObject.match(result[k],
								result[k + 1], result[k + 2])) {
							subStr = result[k] + " "
									+ result[k + 1] + " "
									+ result[k + 2];
							subStr = splitWord.split(subStr);
							
						
								if (map.containsKey(subStr)) {
									int n = map.get(subStr);
									map.put(subStr, n + 1);
								} else {
									map.put(subStr, 1);
									
								
							}
						}
					}
				}
			}
			map.put(name, -999);
			maps.add(map);
		}
	}

	/**
	 * calculate to extract trigrams from the candidate terms.
	 * @throws IOException 
	 * 
	 */
	public void extract() throws IOException {
		BufferedWriter bw = new BufferedWriter(new FileWriter(Constant.RESULT_FILE,true));
		bw.newLine();
		for (int i = 0; i < maps.size(); i++) {
			HashMap<String, Integer> map = maps.get(i);
			ConcurrentHashMap<String, Integer> conMap = new ConcurrentHashMap<String, Integer>(
					map);
			for (Entry<String, Integer> entry : conMap.entrySet()) {
				int k = entry.getValue();
				String key = entry.getKey();
				if (k != -999) {
					if (!userDictList.contains(key)) {
						if (k < Constant.TRIPLETHRESHOLD) 
							conMap.remove(key);
						else
						{	
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
	}

}
