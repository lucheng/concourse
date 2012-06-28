package edu.bupt.nlp.utils;

import java.util.ArrayList;
import java.util.List;

import ICTCLAS.I3S.AC.ICTCLAS50;
import ICTCLAS.I3S.AC.StopWords;

public class DataConverter {

	StopWords stopWord = new StopWords();
	
//	String filePath = "data/";
	String filePath = "D:/data/sina/test";
	
	public void tagger(){
		
		int bPOSTagged = 1;
		
		List<String> filelist = new ArrayList<String>();
		
		FileHelp.refreshFileList(filePath, filelist, ".txt");
		ICTCLAS50 testICTCLAS = new ICTCLAS50();
		
		for(String fileName : filelist){
			
			String content = testICTCLAS.tag(FileHelp.readTextInOneLine(fileName), bPOSTagged);
			
			List<String> words = stopWord.phraseDel(content);
			content = "";
			System.out.println(words.size());
			for(String word : words){
				content += word + " ";
			}
			
			FileHelp.writeFile(fileName.replace(".txt", ".seg"), content);
		}
	}
	
	public void merge(){
		
//		String filePath = "data/";
		List<String> filelist = new ArrayList<String>();
		
		FileHelp.refreshFileList(filePath, filelist, ".seg");
		
		String total = filelist.size() + System.getProperty("line.separator");
		
		for(String fileName : filelist){
			total += FileHelp.readTextInOneLine(fileName) + System.getProperty("line.separator");
		}
		
		FileHelp.writeFile("model/docs.dat", total);
		
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		DataConverter data = new DataConverter();
		data.tagger();
		data.merge();
	}

}
