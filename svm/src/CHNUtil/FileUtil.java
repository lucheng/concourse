/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package CHNUtil;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * 将文本文件读取为一个String并返回，以便进行分词。
 */
public class FileUtil {

    public static String file2String(Reader reader) {
        StringBuffer buffer = new StringBuffer();
        BufferedReader in = null;
        try {
            in = new BufferedReader(reader);
            String str = null;
            while(true) {
                str = in.readLine();
                if(str == null)
                    break;
                else
                    buffer.append(str + "\n");
            }
        } catch (IOException ex) {
             Logger.getLogger(FileUtil.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if(in != null)
                    in.close();
            } catch (IOException ex) {
                Logger.getLogger(FileUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return buffer.toString();
    }

    public static File getFileAbsolutePath(Class claz, String filename) {
        File file = null;
        try {
            file = new File(URLDecoder.decode(claz.getResource(filename).getFile(), "UTF-8"));
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(FileUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return file;
    }

}
