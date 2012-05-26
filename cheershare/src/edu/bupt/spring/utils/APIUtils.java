package edu.bupt.spring.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class APIUtils {

	public static String getId(String url) {
		
		String id = "";
		String idPatternString = "[?&]+[id=\\d]+";
		Pattern pattern =Pattern.compile(idPatternString,Pattern.DOTALL);
		Matcher matcher = pattern.matcher(url);
		
		if(matcher.find()){
			String idString = matcher.group();
			id = idString.substring(idString.lastIndexOf("=")+1);
		}
		return id;
	}
}
