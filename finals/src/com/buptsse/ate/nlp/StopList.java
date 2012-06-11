package com.buptsse.ate.nlp;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.buptsse.ate.utils.Constant;

/**
 * This class check whether a string exists in the stoplist.
 * 
 * @author ZhuYan
 */
public class StopList {
	
	private Logger logger = Logger.getLogger(getClass());
	
	private HashSet<String> words;
	private Pattern expression = Pattern.compile("(/w)$|(/r)$|(/u)$|(/c)$|(/y)$");
	private Matcher matcher;
	

	public static void main(String[] args){
		
		StopList stoplist = new StopList();
		System.out.println(stoplist.stopRegex("。/w"));
	}
	
	public StopList() {
		
		words = new HashSet<String>();
		
		try {
			createList();
		} catch (IOException e) {
			e.printStackTrace();
			logger.info(e.getMessage());
		}
	}

	/**
	 * read the words in the stop-lists into the memory.
	 * 
	 * @throws IOException
	 */
	private void createList() throws IOException {
		FileReader fin = new FileReader(Constant.STOPLIST);
		BufferedReader bin = new BufferedReader(fin);
		String str;
		while ((str = bin.readLine()) != null){
			words.add(str);
//			logger.info(str);
		}
		bin.close();
		fin.close();
	}

	/**
	 * check whether thr String is in the stoplists.
	 * 
	 * @param tempWord
	 * @return If in, return true; else false.
	 */
	public boolean find(String tempWord) {
		return words.contains(tempWord);
	}
	
	public boolean stopRegex(String wordseg) {
		
		matcher = expression.matcher(wordseg);
//		logger.info(wordseg);
		if(matcher.find()){
//			logger.info("stopword:" + wordseg);
			return true;
		}
		return false;
	}
	
}
