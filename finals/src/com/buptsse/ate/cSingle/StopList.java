package com.buptsse.ate.cSingle;

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
 * @author ZhuYan
 */
public class StopList {
	private HashSet<String> words;
	private Logger log = Logger.getLogger(getClass());

	public StopList() {
		words = new HashSet<String>();
		PropertyConfigurator.configure(Constant.LOG4J);
		try {
			createList();
		} catch (IOException e) {
			e.printStackTrace();
			log.info(e.getMessage());
		}
	}

	/**
	 * read the words in the stop-lists into the memory.
	 * 
	 * @throws IOException
	 */
	private void createList() throws IOException {
		FileReader fin = new FileReader(Constant.SINGLECSTOPLIST);
		BufferedReader bin = new BufferedReader(fin);
		String str;
		while ((str = bin.readLine()) != null)
			words.add(str);
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
}
