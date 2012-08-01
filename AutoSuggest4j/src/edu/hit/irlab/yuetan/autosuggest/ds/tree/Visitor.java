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
 * The visitor interface that is used by {@link RadixTreeImpl} for perfroming
 * task on a searched node.
 * 
 * @param <T,R>  * 
 * @author Tahseen Ur Rehman (tahseen.ur.rehman {at.spam.me.not} gmail.com)
 * @author Javid Jamae
 * @author Dennis Heidsiek
 */
public interface Visitor<T, R> {
    
    /**
     * This method gets called by {@link RadixTreeImpl#visit(String, Visitor) visit}
     * when it finds a node matching the key given to it.
     * 
     * @param key The key that matched the node
     * @param parent The parent of the node being visited
     * @param node The node that is being visited
     */
    public void visit(String key, RadixTreeNode<T> parent, RadixTreeNode<T> node);

    /**
     * The visitor can store any type of result object, depending on the context of
     * what it is being used for.
     * 
     * @return The result captured by the visitor.
     */
    public R getResult();
}
