package com.bupt.utility;


import java.util.Iterator;


/**
 * 主题词查找
 * @author susie
 *
 */
public class SearchTopic {

/**
 * 主题词查找
 * @param content
 *        分词后的字符串
 * @return
 */
public static boolean haveTopic(String content){
	boolean foundT = false;
	Object val = null;
	Object key = null;

		for (Iterator iter = ImportSentimentDictionary.topics.keySet().iterator(); iter.hasNext();) {
			key = iter.next();
		    val = ImportSentimentDictionary.topics.get(key);
			if(content.contains((String)key)){
				foundT = true;
				//System.out.print("have topic");
			}
		}
			return foundT;
	}


}

