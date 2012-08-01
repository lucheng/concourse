/*
The MIT License

Copyright (c) 2008 Tahseen Ur Rehman

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
*/
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
import java.util.List;

/**
 * Represents a node of a Radix tree {@link RadixTreeImpl}.
 * 
 * @param <T>  * 
 * @author Tahseen Ur Rehman
 * @email tahseen.ur.rehman {at.spam.me.not} gmail.com
 */
class RadixTreeNode<T> {
    
    /** The key. */
    private String key;

    /** The childern. */
    private List<RadixTreeNode<T>> childern;

    /** The real. */
    private boolean real;

    /** The value. */
    private T value;

    /**
     * intailize the fields with default values to avoid null reference checks
     * all over the places.
     */
    public RadixTreeNode() {
        key = "";
        childern = new ArrayList<RadixTreeNode<T>>();
        real = false;
    }

    /**
     * Gets the value.
     * 
     * @return the value
     */
    public T getValue() {
        return value;
    }

    /**
     * Sets the value.
     * 
     * @param data the new value
     */
    public void setValue(T data) {
        this.value = data;
    }

    /**
     * Gets the key.
     * 
     * @return the key
     */
    public String getKey() {
        return key;
    }

    /**
     * Sets the key.
     * 
     * @param value the new key
     */
    public void setKey(String value) {
        this.key = value;
    }

    /**
     * Checks if is real.
     * 
     * @return true, if is real
     */
    public boolean isReal() {
        return real;
    }

    /**
     * Sets the real.
     * 
     * @param datanode the new real
     */
    public void setReal(boolean datanode) {
        this.real = datanode;
    }

    /**
     * Gets the childern.
     * 
     * @return the childern
     */
    public List<RadixTreeNode<T>> getChildern() {
        return childern;
    }

    /**
     * Sets the childern.
     * 
     * @param childern the new childern
     */
    public void setChildern(List<RadixTreeNode<T>> childern) {
        this.childern = childern;
    }
    

	/**
	 * Gets the number of matching characters.
	 * 
	 * @param key the key
	 * 
	 * @return the number of matching characters
	 */
	public int getNumberOfMatchingCharacters(String key) {
		// 可以开率进行改进-Fandywang
		int numberOfMatchingCharacters = 0;
        while (numberOfMatchingCharacters < key.length() && numberOfMatchingCharacters < this.getKey().length()) {
            if (key.charAt(numberOfMatchingCharacters) != this.getKey().charAt(numberOfMatchingCharacters)) {
                break;
            }
            numberOfMatchingCharacters++;
        }
		return numberOfMatchingCharacters;
	}

    /* (non-Javadoc)
     * @see java.lang.Object#toString()
     */
    @Override
    public String toString() {
		return key;
    	
    }
}
