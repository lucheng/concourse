package edu.bupt.test;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

import edu.bupt.nlp.keyword.Extractor;
import edu.bupt.nlp.keyword.WordExtract;

/**
 * 关键词抽取
 * @author linzhe
 * @email  m23linzhe@gmail.com
 * @date   2012-5-29
 */
public class KeyWordTest {
	
	public static Extractor key = null;; 

	static {
		try {
			key = new WordExtract("./ICTCLAS_CONFIG/userdict.txt", "./ICTCLAS_CONFIG/stopwords.txt");
		} catch (Exception e) {			
			e.printStackTrace();
		}

	}

	public static String readFile(String dicPath) throws FileNotFoundException{
		String s;
		StringBuffer ss = new StringBuffer();

		try{
			InputStreamReader read = new InputStreamReader(new FileInputStream(dicPath), "UTF-8");
			BufferedReader in = new BufferedReader(read);
			while((s = in.readLine()) != null){
				ss.append(s);
				System.out.println(s);
			}
			in.close();
		}catch(Exception e){

		}


		return String.valueOf(ss);
	}

	public static void writeFile(String filePath, String detail)throws Exception {
		try{
			File file = new File(filePath);
			FileWriter filewriter = new FileWriter(file, true);
			filewriter.write(detail);
			filewriter.close();
		}catch(IOException e){
			throw e;
		}catch (Exception ex) {
			throw ex;
		}
	}

	public static void main(String[] args) throws Exception {	
		
		long time = System.currentTimeMillis();
		
		String text = readFile("text-example/100049.txt");
		System.out.println(text);
		String result = key.extract(text, 100,true);
		System.out.println(result);
		
		long t = System.currentTimeMillis() - time;
		System.out.println("用时：" + t + " ms");

	}
}


