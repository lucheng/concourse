package edu.bupt.tag;

import com.buptsse.ate.utils.FileHelp;

import edu.bupt.nlp.tag.CWSTagger;

public class CWSTaggerTest {
	
	public static void main(String[] args) throws Exception{
		
		String text = FileHelp.readText("./text_example/100108.txt");
		CWSTagger tagger = new CWSTagger();
		for(String str : tagger.tag(text, 1).split(" ")){
			System.out.println(str);
		}
	}

}
