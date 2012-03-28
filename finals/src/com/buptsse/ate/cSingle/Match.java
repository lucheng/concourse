package com.buptsse.ate.cSingle;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The class Match receive a string, if the string accord with the defined
 * patterns, it return true. If not, it return false.
 * 
 * @author ZhuYan
 * 
 */

public class Match {
	
	private Pattern expression1;
	private Matcher matcher1;

	public Match() {
		
		expression1 = Pattern.compile("[0-9a-zA-Zһ-��]+(/n|/vn)$");
		
	}

	/**
	 * check whether the String is noun
	 * 
	 * @param str
	 * @return if it's noun, return true; else false.
	 */
	public boolean match(String str) {
		
		matcher1 = expression1.matcher(str);
		return matcher1.find();
		
	}
	
}
