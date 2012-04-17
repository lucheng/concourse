package com.buptsse.ate.cTrigram;

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
	private HashSet<String> wordsPrefix;
	private HashSet<String> wordsMiddle;
	private HashSet<String> wordsPostfix;
	private HashSet<String> words;
	private Logger log = Logger.getLogger(getClass());
	
	public StopList(){
		wordsPrefix = new HashSet<String>();
		wordsMiddle = new HashSet<String>();
		wordsPostfix = new HashSet<String>();
		words = new HashSet<String>();
		PropertyConfigurator.configure(Constant.LOG4J);
		try {
			createList();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			log.info(e.getMessage());
		}
	}
	
	/**
	 * read the words in the stoplists into the memory.
	 * 
	 * @throws IOException
	 */
	private void createList() throws IOException{
		FileReader fin = new FileReader(Constant.PRECSTOPLIST);
		BufferedReader bin = new BufferedReader(fin);
		String word;
		while((word = bin.readLine())!=null){
			wordsPrefix.add(word);
		}
		bin.close();
		fin.close();
		
		fin = new FileReader(Constant.MIDDLECSTOPLIST);
		bin = new BufferedReader(fin);
		while((word = bin.readLine())!=null){
			wordsMiddle.add(word);
		}
		bin.close();
		fin.close();
		
		fin = new FileReader(Constant.POSTCSTOPLIST);
		bin = new BufferedReader(fin);
		while((word = bin.readLine())!=null){
			wordsPostfix.add(word);
		}
		bin.close();
		fin.close();
		FileReader fin4 = new FileReader(Constant.SINGLECSTOPLIST);
		BufferedReader bin4 = new BufferedReader(fin4);
		while((word = bin4.readLine())!=null)
			words.add(word);
		bin4.close();
		fin4.close();
	}

	/**
	 * check whether the word is in the stoplists.
	 * @param word The trigram to be checked
	 * @return if in, return true; else false
	 */
	public boolean check(String word){
		String[] result = word.split(Constant.DELIMITER);
		if (result.length > 3) {
			return wordsPrefix.contains(result[0]) || wordsMiddle.contains(result[1]) || wordsPostfix.contains(result[2]) || words.contains(
					result[0] + result[1] + result[2]);
		} else {
			return true; 
		}		
	}
}
