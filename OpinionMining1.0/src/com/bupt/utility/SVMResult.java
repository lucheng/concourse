package com.bupt.utility;

/**
 * 用作比较句识别的数据结构类
 * @author BUPT
 * @version 1.0
 */
public class SVMResult {
	public String keyword; //关键词
	public boolean iscomp; //是否比较句

	public SVMResult(String key,boolean b)
	{
		keyword = key;
		iscomp = b;
	}
	
}
