/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package edu.udo.cs.wvtool.external;

import edu.udo.cs.wvtool.generic.tokenizer.WVTTokenizer;
import edu.udo.cs.wvtool.main.WVTDocumentInfo;
import edu.udo.cs.wvtool.util.TokenEnumeration;
import edu.udo.cs.wvtool.util.WVToolException;
import java.io.Reader;
import CHNUtil.FileUtil;
import CHNUtil.LexUtil;
/**
 * 
 * @author linzhe
 *
 */
public class Tokenizer implements WVTTokenizer {

    public TokenEnumeration tokenize(Reader reader, WVTDocumentInfo docInfo) throws WVToolException {
        String str = FileUtil.file2String(reader);
        return new CHNTokenEnumeration(LexUtil.getWords(str));
    }

}
