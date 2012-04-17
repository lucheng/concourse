package com.buptsse.ate.topicmain;


import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashSet;

import com.buptsse.ate.utils.Constant;

public class UserDict {
	/**
	 * read the user dictionary
	 * 
	 * @return user dictionary
	 */
	public HashSet<String> getUserDict() {

		// words in the user dictionary
		HashSet<String> userDict = new HashSet<String>();
		try {
			FileReader fin = new FileReader(Constant.USERDICT);
			BufferedReader bin = new BufferedReader(fin);
			String str;
			while ((str = bin.readLine()) != null) {
				String word[] = str.split(Constant.DELIMITER);
				if (word.length > 0) {
					userDict.add(word[0]);
				}
			}
			bin.close();
			fin.close();
			return userDict;
			
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
	}

}