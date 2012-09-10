package edu.bupt.test;

import java.util.Map;

import edu.bupt.nlp.textrank.EntityExtract;
import edu.bupt.nlp.textrank.Extractor;
import edu.bupt.nlp.textrank.TextRankExtractor;
import edu.bupt.utils.FileUtils;

public class ExtractorTest {
		
	
	public static void main(String[] args) throws Exception {	
		
		Extractor textRank = new TextRankExtractor("./dict/userdict.txt", "./dict/stopLibrary.dic");
		String text = FileUtils.readText("./text_example/q1.txt");
		System.out.println(text);
		
		Map<String, Integer> result = textRank.extract(text, 100,true);
		System.out.println(result);
		
		Extractor key = new EntityExtract("./dict/userdict.txt", "./dict/stopLibrary.dic");
		
//		System.out.println(text);
		Map<String, Integer> result1 = key.extract(text, 100,true);
		System.out.println(result1);
	}
}