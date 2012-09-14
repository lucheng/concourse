package junit.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.bupt.nlp.resources.BCConvert;
import edu.bupt.nlp.textrank.Extractor;
import edu.bupt.nlp.textrank.TextRankExtractor;
import edu.bupt.utils.FileUtils;

public class ExtractorTest {
		
	
	public static void main(String[] args) throws Exception {	
		
		String strPath = "E:/data/content";
		List<String> filelist = new ArrayList<String>();
		FileUtils.fetchFileList(strPath, filelist, ".txt");
		Extractor textRank = new TextRankExtractor("./dict/userdic.txt", "./dict/stopLibrary.dic");

		for(int i = 0; i < filelist.size() && i < 10; i++){
//			String fileName = "./text_example/1347260298735.txt";
			String text = BCConvert.qj2bj(FileUtils.readText(filelist.get(i)));
			
			Map<String, Integer> result = textRank.extract(text, 100,true);
			System.out.println(result);
			System.out.println(text);
		}
//		Extractor key = new EntityExtract("./dict/userdic.txt", "./dict/stopLibrary.dic");
//		System.out.println(text);
//		Map<String, Integer> result1 = key.extract(text, 100,true);
//		System.out.println(result1);
	}
}