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
 * A simple standard implementation for a {@link visitor}.
 * 
 * @param <T,R>  * 
 * @author Dennis Heidsiek
 */
public abstract class VisitorImpl<T, R> implements Visitor<T, R> {

    /** The result. */
    protected R result;
    
    
	/**
	 * Instantiates a new visitor impl.
	 */
	public VisitorImpl() {
		this.result = null;
	}
	
	/**
	 * Instantiates a new visitor impl.
	 * 
	 * @param initialValue the initial value
	 */
	public VisitorImpl(R initialValue) {
		this.result = initialValue;
	}
	
	/* (non-Javadoc)
	 * @see edu.hit.irlab.yuetan.ds.tree.Visitor#getResult()
	 */
	public R getResult() {
		return result;
	}

	/* (non-Javadoc)
	 * @see edu.hit.irlab.yuetan.ds.tree.Visitor#visit(java.lang.String, edu.hit.irlab.yuetan.ds.tree.RadixTreeNode, edu.hit.irlab.yuetan.ds.tree.RadixTreeNode)
	 */
	abstract public void visit(String key, RadixTreeNode<T> parent, RadixTreeNode<T> node);

}
