package edu.bupt.spring.test;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * 
 * @author dikar
 * 比较简陋的提取url
 * 真的很丑陋，都怪自己正则没学好，正则里多次匹配忘了怎么写了，要不很好搞定，哎
 * 提取完的url保存在SET里
 * 可以针对这个做新的处理
 * 大家可以看下好的爬虫是如何提取url的，待有时间分析下
 *
 */
public class TestString {
   
  /**多次使用的话不需要重新编译正则表达式了，对于频繁调用能提高效率*/
//  public static   final String patternString1="[id=]{1}[\\d]+";
  public static   final String patternString2=".*(<\\s*[aA]\\s+(href\\s*=[^>]+\\s*)>(.*)</[aA]>).*";
  public static   final String patternString3=".*href\\s*=\\s*(\"|'|)http://.*";

//  public static    Pattern pattern1 =Pattern.compile(patternString1,Pattern.DOTALL);
  public static    Pattern pattern2 =Pattern.compile(patternString2,Pattern.DOTALL);
  public static    Pattern pattern3 =Pattern.compile(patternString3,Pattern.DOTALL);

 
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		int id = 0;
		String idPatternString = "[?&]+[id=\\d]+";
		
//		String url = "http://item.taobao.com/item.htm?id=147067217&ali_trackid=2:mm_30421514_0_0:1337956406_4z7_452492903";
		String url = "http://jlddq.tmall.com/search.htm?scid=468248154&scname=tefIyMuusa0%3D&checkedRange=true&queryType=cat";
		
		Pattern pattern =Pattern.compile(idPatternString,Pattern.DOTALL);
		Matcher matcher = pattern.matcher(url);
		
		if(matcher.find()){
			
			String idString = matcher.group();
			id = Integer.parseInt(idString.substring(idString.lastIndexOf("=")+1));
			System.out.println(id);
		} else {
			System.out.println("false");
		}
	}
}

