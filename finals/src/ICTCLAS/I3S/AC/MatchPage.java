package ICTCLAS.I3S.AC;


import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The class Match receive two strings, if they accord with 
 * the defined patterns, it return true. If not, it return false.
 * 
 * @author ZhuYan
 *
 */
public class MatchPage {
	
	private Pattern expression;
	private Matcher matcher;

	public MatchPage() {
		
		expression = Pattern.compile("[0-9a-zA-Z一-龥]+(/n|/vn|/un|/x)$");
		
	}

	/**
	 * check whether the String accords with the defined patterns.
	 * 
	 * @param str1 The first word of the bigram
	 * @param str2 The second word of the bigram
	 * @return if the String accords with the pattern, return true; else false.
	 */
	public boolean match(String str1) {
		
		matcher = expression.matcher(str1);

		if (matcher.find()) {
			return true;
		}
		return false;
	}
}
