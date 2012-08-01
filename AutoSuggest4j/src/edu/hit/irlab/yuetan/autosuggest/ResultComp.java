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
 * The Class ResultComp.
 * 
 * @author Fandywang
 */
public class ResultComp implements Comparable<ResultComp> {
	
	/** The prefix. */
	public int  prefix;
	
	/** The keyword. */
	public Keyword keyword;
	
	/**
	 * Instantiates a new result comp.
	 * 
	 * @param p the p
	 * @param k the k
	 */
	public ResultComp(int p, Keyword k)
	{
		prefix = p;
		keyword = k;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Comparable#compareTo(java.lang.Object)
	 */
	public int compareTo(ResultComp arg0) {
		if( prefix != arg0.prefix )
		{
			return (arg0.prefix-prefix);
		}
		return (arg0.keyword.getVaule()-keyword.getVaule());
	}
	
}
