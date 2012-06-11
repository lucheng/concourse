package com.buptsse.ate.topicmain;


import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.buptsse.ate.utils.Constant;
/**
 * This class check whether a string exists in the stoplist.
 * 
 * @author zhuyan
 */

public class StopList {
	private HashSet<String> wordsPrefix, wordsPostfix, words;
	private Logger log = Logger.getLogger(getClass());

	public StopList() {
		wordsPrefix = new HashSet<String>(); 
		wordsPostfix = new HashSet<String>();
		words = new HashSet<String>();
		
		createList();

	}

	/**
	 * read the words in the StopLists into the memory.
	 * 
	 * @throws IOException
	 */
	private void createList(){
		try {
			FileReader fin1 = new FileReader(Constant.PRECSTOPLIST);
			BufferedReader in1 = new BufferedReader(fin1);
			String str;
			while ((str = in1.readLine()) != null)
				wordsPrefix.add(str);
			in1.close();
			fin1.close();
			FileReader fin2 = new FileReader(Constant.POSTCSTOPLIST);
			BufferedReader in2 = new BufferedReader(fin2);
			while ((str = in2.readLine()) != null) {
				wordsPostfix.add(str);
			}
			in2.close();
			fin2.close();
			FileReader fin3 = new FileReader(Constant.SINGLECSTOPLIST);
			BufferedReader bin = new BufferedReader(fin3);
			while((str = bin.readLine())!=null)
				words.add(str);
			bin.close();
			fin3.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info(e.getMessage());
		}	
	}

	/**
	 * check whether the String is in the StopLists.
	 * 
	 * @param str The String to be checked
	 * @return if in, return true; else false.
	 */
	public boolean check(String str) {
		String[] result = str.split(Constant.DELIMITER);
		if (result.length > 2) {
			return wordsPrefix.contains(result[0]) || wordsPostfix.contains(result[1]) || words.contains(result[0] + result[1]);
		} else {
			return true;
		}
	}
}
