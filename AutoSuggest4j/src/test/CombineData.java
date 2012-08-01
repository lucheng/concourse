/**
 * @author Lifeng Wang
 * Created on 2009-12-14
 * Blog: http://hi.baidu.com/fandywang_jlu
 * Copyright (c) 2009, HIT IR Lab, All rights reserved.
 */
package test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;

/**
 * The Class Combine：预处理关键词词表--可选.
 */
public class CombineData {

	/**
	 * The main method.
	 * 
	 * @param args the args
	 */
	public static void main(String[] args) {
		HashMap<String, Integer> keyMap = new HashMap<String, Integer>();
	
		BufferedReader in;
		try {
			String encoding = "UTF-8";
			OutputStreamWriter outstream = new OutputStreamWriter(
			new FileOutputStream("./data/out.txt"), encoding);
			PrintWriter out = new PrintWriter(new BufferedWriter(outstream));


			in = new BufferedReader(new InputStreamReader(new FileInputStream(
					"./data/keywords.txt"), "utf-8"));

			String aline;
			while ((aline = in.readLine()) != null) {
				int space = aline.lastIndexOf(' ');
				if( space == -1 ) continue; // 格式不正确过滤掉，增强鲁棒性
				int value = Integer.valueOf(aline.substring(space+1));
				String word = aline.substring(0, space);
				if( word.length() == 1 ) continue;
				if( (word.charAt(0) == '《' && word.charAt(word.length()-1) == '》') ||
						(word.charAt(0) == '\"' && word.charAt(word.length()-1) == '\"') )
					word = word.substring(1, word.length());
				
				Integer v = keyMap.get(word);
				keyMap.put(word, v == null ? value+1 : (v+value));
			}
			
			for( String s : keyMap.keySet() )
			{
				out.println(s + " " + keyMap.get(s));
			}
			in.close();
			out.close();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
