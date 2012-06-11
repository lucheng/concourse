package com.buptsse.ate.utils;

import java.util.regex.*;

public class Regex1 {
	public static void main(String args[]) {
		String str = "http://www.199it.com/archives/34210.html";
//		String str = "techweb.com.cn/tele/1184072.shtml";
		String regEx = "([http://]|[//w//.//-/:])?199it.com/archives/[\\d]+(.html)$"; // 表示a或f
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		boolean result = m.find();
		System.out.println(result);
	}
}