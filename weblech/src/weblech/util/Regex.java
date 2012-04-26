package weblech.util;

import java.util.regex.*;

public class Regex {
	public static void main(String args[]) {
		String str = "http://www.36kr.com/p/1184072.html?ss=11";
//		String str = "techweb.com.cn/tele/1184072.shtml";
		String regEx = "([http://]|[//w//.//-/:])?36kr.com/p/[\\d]+(.html)$"; // 表示a或f
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		boolean result = m.find();
		System.out.println(result);
	}
}