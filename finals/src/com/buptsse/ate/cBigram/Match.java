package com.buptsse.ate.cBigram;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The class Match receive two strings, if they accord with 
 * the defined patterns, it return true. If not, it return false.
 * 
 * @author ZhuYan
 *
 */
class Match {
	
	private Pattern expression1, expression2;
	private Matcher matcher1, matcher2;

	public Match() {
		
		expression1 = Pattern.compile("[0-9a-zA-Z一-龥]+(/n|/vn|/un|/x)$");
		expression2 = Pattern.compile("[0-9a-zA-Z一-龥]+(/n|/vn|/un|/x)$");
		
	}

	/**
	 * check whether the String accords with the defined patterns.
	 * 
	 * @param str1 The first word of the bigram
	 * @param str2 The second word of the bigram
	 * @return if the String accords with the pattern, return true; else false.
	 */
	public boolean match(String str1, String str2) {
		
		matcher1 = expression1.matcher(str1);
		matcher2 = expression2.matcher(str1);

		if (matcher1.find() || matcher2.find()) {
			matcher1 = expression1.matcher(str2);
			if (matcher1.find()) {
				return true;
			}
		}

		return false;
		
	}
	
}
