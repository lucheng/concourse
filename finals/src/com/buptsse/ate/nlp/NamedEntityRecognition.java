package com.buptsse.ate.nlp;


import java.util.HashMap;

import com.buptsse.ate.utils.FileHelp;

import edu.fudan.nlp.tag.NERTagger;

/**
 * 实体名识别使用示例
 * @author xpqiu
 *
 */
public class NamedEntityRecognition {	


	/**
	 * @param args
	 * @throws IOException 
	 * @throws  
	 */
	public static void main(String[] args) throws Exception {
		
		NERTagger tag = new NERTagger("./models/ner.p111014.gz");
		
		String str = FileHelp.readText("d:/workspace/finals/text_example/100059.txt");
		HashMap<String, String> s = tag.tag(str);
		System.out.println(s);
	}
}
