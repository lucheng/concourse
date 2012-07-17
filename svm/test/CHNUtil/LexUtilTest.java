/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package CHNUtil;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import junit.framework.TestCase;

/**
 *
 * @author dvdface
 */
public class LexUtilTest extends TestCase {
    
    public LexUtilTest(String testName) {
        super(testName);
    }

    public void testGetKeyWords_String() throws FileNotFoundException {
        FileReader reader = new FileReader(new File("D:/Paper/编成辅助工具/README.txt"));
        String str = FileUtil.file2String(reader);
        System.out.println(LexUtil.getKeyWords(str));
          System.out.println(LexUtil.getWords(str));

    }


}
