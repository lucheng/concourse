package edu.bupt.nlp.tag;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.List;

import ICTCLAS.I3S.AC.ICTCLAS50;
import ICTCLAS.I3S.AC.StopWords;

public class CWSTagger {
	
	private ICTCLAS50 ICTCLAS50;
	private StopWords stopWords;
	
	public CWSTagger(String dictPath, String stoppWordPath) throws Exception {
		
		this.ICTCLAS50 = new ICTCLAS50(dictPath);
		this.stopWords = new StopWords(stoppWordPath);
	}
	
	public CWSTagger() throws Exception {
		this.ICTCLAS50 = new ICTCLAS50();
		this.stopWords = new StopWords();
	}
	
	public String tag(String src, int bPOSTagged){
		
		String tag= ICTCLAS50.tag(src, bPOSTagged);
		
		return tag;
	}
	
	public List<String> phraseDel(String str){
		
		return stopWords.phraseDel(str);
	}

	public String tagFile(String input, int bPOSTagged) {
		StringBuilder res = new StringBuilder();
		try {
			InputStreamReader  read = new InputStreamReader (new FileInputStream(input),"utf-8");
			BufferedReader lbin = new BufferedReader(read);
			String str = lbin.readLine();
			while(str!=null){
				String s= tag(str, bPOSTagged);
				res.append(s);
				res.append("\n");
				str = lbin.readLine();
			}
			lbin.close();
			return res.toString();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public static void main(String[] args) throws Exception{
		
		
	}
}
