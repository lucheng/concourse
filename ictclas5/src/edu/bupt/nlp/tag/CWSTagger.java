package edu.bupt.nlp.tag;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;

import ICTCLAS.I3S.AC.ICTCLAS50;
import ICTCLAS.I3S.AC.StopWords;

public class CWSTagger {
	
	private ICTCLAS50 ICTCLAS50;
	private StopWords stopWords;
	
	public CWSTagger(String str, String dictPath, String stoppWordPath) throws Exception {
		
		this.ICTCLAS50 = new ICTCLAS50(dictPath);
		this.stopWords = new StopWords(stoppWordPath);
	}
	
	public CWSTagger(String str) throws Exception {
		this.ICTCLAS50 = new ICTCLAS50();
		this.stopWords = new StopWords();
	}
	
	public String tag(String src){
		String[] sents = src.split("\n");
		String tag="";
		
		return tag;
	}

	public static void main(String[] args) throws Exception{
		
		
	}
	
	
	public String tagFile(String input) {
		StringBuilder res = new StringBuilder();
		try {
			InputStreamReader  read = new InputStreamReader (new FileInputStream(input),"utf-8");
			BufferedReader lbin = new BufferedReader(read);
			String str = lbin.readLine();
			while(str!=null){
				String s= tag(str);
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
}
