package com.buptsse.ate.cTrigram;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The class Match receive three strings, if they accord with 
 * the defined patterns, it return true. If not, it return false.
 * 
 * @author zhuyan
 *
 */


class Match {
	private Pattern expression1, expression2;

	private Matcher matcher1, matcher2;

	public Match() {
		expression1 = Pattern.compile("[0-9a-zA-Z一-龥]+(/n|/vn|/un)$");
		expression2 = Pattern.compile("[0-9a-zA-Z一-龥]+(/n|/vn|/un)$");
	}

	/**
	 * check whether the trigram accords with the defined pattern.
	 * @param str1 The first string of the trigram.
	 * @param str2 The second string of the trigram.
	 * @param str3 The third string of the trigram.
	 * @return if accords with, return true; else false.
	 */
	public boolean match(String str1, String str2, String str3) {
		matcher1 = expression1.matcher(str1);
		matcher2 = expression2.matcher(str1);

		if (matcher1.find()) {
			matcher1 = expression1.matcher(str2);
			if (matcher1.find()) {
				matcher1 = expression1.matcher(str3);
				if (matcher1.find())
					return true;
			}
		}

		if (matcher2.find()) {
			matcher1 = expression1.matcher(str2);
			matcher2 = expression2.matcher(str2);
			if (matcher1.find() || matcher2.find()) {
				matcher1 = expression1.matcher(str3);
				if (matcher1.find())
					return true;
			}
		}
		return false;
	}
}
