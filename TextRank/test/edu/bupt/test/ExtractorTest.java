package edu.bupt.test;

import java.util.Map;

import com.buptsse.ate.utils.FileHelp;

import edu.bupt.nlp.textrank.EntityExtract;
import edu.bupt.nlp.textrank.Extractor;
import edu.bupt.nlp.textrank.TextRankExtractor;

public class ExtractorTest {
		
	
	public static void main(String[] args) throws Exception {	
		
		Extractor textRank = new TextRankExtractor("./ICTCLAS_CONFIG/userdict.txt", "./ICTCLAS_CONFIG/stopwords.txt");
		String text = FileHelp.readText("./text_example/q1.txt");
		System.out.println(text);
		
		Map<String, Integer> result = textRank.extract(text, 100,true);
		System.out.println(result);
		
		Extractor key = new EntityExtract("./ICTCLAS_CONFIG/userdict.txt", "./ICTCLAS_CONFIG/stopwords.txt");
		
//		System.out.println(text);
		Map<String, Integer> result1 = key.extract(text, 100,true);
		System.out.println(result1);
	}
}