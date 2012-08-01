/**
 * Copyright    : Copyright(C) 2000-2009. HIT-CIR. All Rights Reserved
 * File Summary : AutoPrompt Function
 * Author       : Fandywang 
 * Create time  : 2009-12-13
 * Project Name : yuetan
 * Version      : 1.0
 */
package edu.hit.irlab.yuetan.autosuggest.ds.tree;

import java.util.ArrayList;
import java.util.Map;
import java.util.PriorityQueue;

import edu.hit.irlab.yuetan.autosuggest.Keyword;

/**
 * This interface represent the operation of a radix tree. A radix tree,
 * Patricia trie/tree, or crit bit tree is a specialized set data structure
 * based on the trie that is used to store a set of strings. In contrast with a
 * regular trie, the edges of a Patricia trie are labelled with sequences of
 * characters rather than with single characters. These can be strings of
 * characters, bit strings such as integers or IP addresses, or generally
 * arbitrary sequences of objects in lexicographical order. Sometimes the names
 * radix tree and crit bit tree are only applied to trees storing integers and
 * Patricia trie is retained for more general inputs, but the structure works
 * the same way in all cases.
 * 
 * @author Tahseen Ur Rehman
 * @author Fandywang
 * email: tahseen.ur.rehman {at.spam.me.not} gmail.com
 */
public interface RadixTree<T> {
    
    /**
     * Insert a new string key and its value to the tree.
     * 
     * @param key The string key of the object
     * @param value The value that need to be stored corresponding to the given
     * key.
     * 
     * @throws DuplicateKeyException the duplicate key exception
     */
    public void insert(String key, T value) throws DuplicateKeyException;

    /**
     * Delete a key and its associated value from the tree.
     * 
     * @param key The key of the node that need to be deleted
     * 
     * @return true, if delete
     */
    public boolean delete(String key);

    /**
     * Find a value based on its corresponding key.
     * 
     * @param key The key for which to search the tree.
     * 
     * @return The value corresponding to the key. null if it can not find the key
     */
    public T find(String key);

    /**
     * Check if the tree contains any entry corresponding to the given key.
     * 
     * @param key The key that needto be searched in the tree.
     * 
     * @return retun true if the key is present in the tree otherwise false
     */
    public boolean contains(String key);

    /**
     * Search for all the keys that start with given prefix. limiting the results based on the supplied limit.
     * 
     * @param prefix The prefix for which keys need to be search
     * @param recordLimit The limit for the results
     * 
     * @return The list of values those key start with the given prefix
     */
    public ArrayList<T> searchPrefix(String prefix, int recordLimit);
    
    /**
     * Search for the nodes that start with given prefix.
     * 
     * @param prefix The prefix for which keys need to be search
     * 
     * @return The nodes of values those key start with the given prefix
     */
    public Map<String, T> searchPrefixNodes(String prefix);
	
    /**
     * Search for the nodes that start with given prefix.
     * 
     * @param prefix The prefix for which keys need to be search
     * @param keys the keys
     * 
     * @return The nodes of values those key start with the given prefix
     */
    public void searchPrefixNodes(String prefix, PriorityQueue<Keyword> keys);
    
    /**
     * Return the size of the Radix tree.
     * 
     * @return the size of the tree
     */
    public long getSize();
    
}
