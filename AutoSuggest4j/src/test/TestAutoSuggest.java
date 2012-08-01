/**
 * @author Lifeng Wang
 * Created on 2009-12-13
 * Blog: http://hi.baidu.com/fandywang_jlu
 * Copyright (c) 2009, HIT IR Lab, All rights reserved.
 */
package test;

import java.util.ArrayList;

import edu.hit.irlab.yuetan.autosuggest.*;

/**
 * The Class testAutoSuggest.
 */
public class TestAutoSuggest {

	/**
	 * The main method.
	 * 
	 * @param args the args
	 */
	public static void main(String[] args) {
		AutoSuggest as = new AutoSuggest();

		ArrayList<String> result = as.find("林");
		System.out.println("***************************");
		for( int i=0; i < result.size() && i < 10; ++i )
		{
			System.out.println(result.get(i));
		}
	}

}
