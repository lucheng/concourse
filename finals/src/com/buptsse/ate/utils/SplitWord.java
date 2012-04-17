package com.buptsse.ate.utils;



/**
 * This class receive a string, then change it to another pattern.
 * For example, if the original string is "data/nn structure/nn",
 * then the string after processing is "data structure".
 * 
 * @author zhuyan
 *
 */

public class SplitWord {

	public String split(String str){
		String[] result = str.split(Constant.DELIMITER);
		String finalWord;
		
		for(int i = 0; i < result.length; i++)
		{
			int index = result[i].indexOf(47);
			if(index >= 0)
			{
				result[i] = result[i].substring(0, index);
			}			
		}
		
		finalWord = result[0];
		for(int k=1; k<result.length; k++){
			finalWord = finalWord+result[k];
			finalWord.trim();
		}
		
		return finalWord;
	} 
}
