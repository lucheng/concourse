/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.udo.cs.wvtool.external;

import edu.udo.cs.wvtool.util.TokenEnumeration;
import edu.udo.cs.wvtool.util.WVToolException;
import java.util.Iterator;
import java.util.List;

/**
 * 
 * @author linzhe
 *
 */
public class CHNTokenEnumeration implements TokenEnumeration {

    private List<String> tokens;
    private Iterator<String> iterator;

    public CHNTokenEnumeration(List<String> tokens) {
        this.tokens = tokens;
        iterator = tokens.iterator();
    }

    public String nextToken() throws WVToolException {
        return iterator.next();
    }

    public boolean hasMoreTokens() {
        return iterator.hasNext();
    }

}
