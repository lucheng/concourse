package edu.bupt.nlp.tag;

import java.util.List;

import org.apache.log4j.Logger;

import ICTCLAS.I3S.AC.ICTCLAS50;
import ICTCLAS.I3S.AC.StopWords;

import com.buptsse.ate.utils.FileHelp;

public class CWSTagger {
	
	private static Logger logger = Logger.getLogger(CWSTagger.class);
	
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

	public void tagFile(String inputPath, String outputPath, int bPOSTagged) {
		
		String[] inputs = FileHelp.getFiles(inputPath);
		for(String sSrcFilename : inputs){
			String sDestFilename = outputPath + "/" + getFileName(sSrcFilename);
			ICTCLAS50.tagFile(sSrcFilename.getBytes(), sDestFilename.getBytes(), bPOSTagged);
		}
	}
	
	/*public void tagFile(File input, String outputPath, int bPOSTagged) {
		
	}*/
	
	public String getFileName(String input){
		
		return input.substring(input.lastIndexOf("/")+1, input.length()).replace(".txt", ".seg");
	}
	
	
	public void filter(String fileName){
		
		List<String> content = FileHelp.readTxtByLine(fileName, 5, 13);
		StringBuffer filterBuff = new StringBuffer();
		for(int i = 0; i < content.size(); i++){
//			logger.info(content.get(i) + "====" + content.get(i).length());
			filterBuff.append(content.get(i) + System.getProperty("line.separator"));
		}
		
		FileHelp.writeFile(fileName.replace("entity", "filterEntity"), filterBuff.toString());
		
		
	}
	public static void main(String[] args) throws Exception{
		
		CWSTagger tagger = new CWSTagger();
		String inputPath = "D:\\data\\contents/";
		String outputPath = "D:\\data\\segments";
		
		/*String[] inputs = FileHelp.getFiles("D:\\data\\contents");
		for(String name : inputs){
			System.out.println(tagger.getFileName(name));
		}*/
		/*for(int i = 1871; i < 15088; i++){
			String fileName = inputPath + i +".txt";
			File file = new File(fileName);
			System.out.println(fileName);
			tagger.tagFile(file, outputPath, 1);
			
		}*/
		tagger.filter("./ICTCLAS_CONFIG/entity.txt");
		
	}
}
