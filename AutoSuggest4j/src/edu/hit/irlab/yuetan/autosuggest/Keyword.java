/**
 * Copyright    : Copyright(C) 2000-2009. HIT-CIR. All Rights Reserved
 * File Summary : AutoSuggest
 * Author       : Fandywang 
 * Create time  : 2009-12-13
 * Project Name : yuetan
 * Version      : 1.0
 */
package edu.hit.irlab.yuetan.autosuggest;

/**
 * The Class Keyword.
 * 
 * @author Fandywang
 */
public class Keyword implements Comparable<Keyword> {
	
	/** The word. */
	private String word;
	
	/** The value. */
	private int value;
	
	/**
	 * Instantiates a new keyword.
	 * 
	 * @param key the key
	 * @param v the v
	 */
	Keyword(String key, int v)
	{
		word = key;
		value = v;
	}
	
	/**
	 * Gets the word.
	 * 
	 * @return the word
	 */
	public String getWord()
	{
		return word;
	}
	
	/**
	 * Gets the vaule.
	 * 
	 * @return the vaule
	 */
	public int getVaule()
	{
		return value;
	}
	
	/**
	 * The main method.
	 * 
	 * @param args the args
	 */
	public static void main(String[] args) {

	}

	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(Keyword o) {
		return value - o.value;
	}

}

