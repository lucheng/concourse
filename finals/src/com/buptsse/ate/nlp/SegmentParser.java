package com.buptsse.ate.nlp;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import ICTCLAS.I3S.AC.ICTCLAS50;

import com.buptsse.ate.utils.Constant;

public class SegmentParser {

	private Logger logger = Logger.getLogger(getClass());
	private ICTCLAS50 ICTCLAS = new ICTCLAS50();
	private StopList stopList = new StopList();
	
//	private Map<String, Integer> singleWords = new HashMap<String, Integer>();
//	private Map<String, Integer> doubleWords = new HashMap<String, Integer>();
//	private Map<String, Integer> trigramWords = new HashMap<String, Integer>();
	
	public SegmentParser(){
		
	}
	
	public boolean match(String word, String regex){
		
		Pattern expression = Pattern.compile(regex);
		Matcher matcher = expression.matcher(word);
		if(matcher.find()){
//			logger.info(word);
			return true;
		}
		return false;
	}
	/**
	 * @param args
	 * @throws Exception 
	 */
	public Map<String, Integer> singleProcess(String content, int weight) throws Exception {
		
		Map<String, Integer> singleWords = new HashMap<String, Integer>();
		
		String segment =  ICTCLAS.testICTCLAS_ParagraphProcess(content);
		String[] list = segment.split("\\s");
		
		for(String str : list){
			
//			logger.info(str);
			if(!match(str, "/n|/x|/vn")){
				continue;
			}
			int pos = str.lastIndexOf("/");
			if(pos > 0){
//				logger.info(str);
				str = str.substring(0, pos).toLowerCase().trim();
				if(str.length() > 1 && !stopList.find(str)){
					if(singleWords.get(str) == null){
						singleWords.put(str, 1);
					}else {
						singleWords.put(str, (singleWords.get(str)+1) * weight);
					}
				}
			}
		}
		return singleWords;
	}
	
	public void doubleProcess(String content){
		
			/*String subStr = "";
			for (int i = 1; i < singlelist.size(); i++) {
				
				for (int k = 0; k < singlelist.size() - 1; k++) { // 当一行有多于一个词的时候，进入循环
					if (singlelist.get(i).length() > 0 && singlelist.get(i+1).length() > 0) {
						if (macth(singlelist.get(i), singlelist.get(i+1))) { // 判断挨着的两个词是否都时n或者vn
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
		}*/
	}

}