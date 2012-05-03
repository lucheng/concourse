package weblech.util;

import java.util.regex.*;

public class Regex {
	public static void main(String args[]) {
		String str = "http://www.cnbeta.com/articles/184558.htm";
//		String str = "techweb.com.cn/tele/1184072.shtml";
		String regEx = "http://www.cnbeta.com/articles/[\\d]+(.htm)$"; // 表示a或f
		Pattern p = Pattern.compile(regEx);
		Matcher m = p.matcher(str);
		boolean result = m.find();
		System.out.println(result);
	}
}