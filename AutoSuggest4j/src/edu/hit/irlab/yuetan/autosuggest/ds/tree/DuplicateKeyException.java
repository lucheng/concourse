/**
 * Copyright    : Copyright(C) 2000-2009. HIT-CIR. All Rights Reserved
 * File Summary : AutoPrompt Function
 * Author       : Fandywang 
 * Create time  : 2009-12-13
 * Project Name : yuetan
 * Version      : 1.0
 */
package edu.hit.irlab.yuetan.autosuggest.ds.tree;

/**
 * excepion thrown if a duplicate key is inserted in a {@link RadixTree}.
 * 
 * @author Tahseen Ur Rehman
 * email: tahseen.ur.rehman {at.spam.me.not} gmail.com
 */
public class DuplicateKeyException extends RuntimeException
{
	
	/** The Constant serialVersionUID. */
	private static final long serialVersionUID = 3141795907493885706L;

	/**
	 * Instantiates a new duplicate key exception.
	 * 
	 * @param msg the msg
	 */
	public DuplicateKeyException(String msg)
	{
		super(msg);
	}
}
