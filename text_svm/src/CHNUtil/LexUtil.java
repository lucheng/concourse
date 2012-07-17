/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package CHNUtil;

import java.io.ByteArrayInputStream;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import ICTCLAS.kevin.zhang.ICTCLAS2011;
/**
 *
 * 分词程序
 */



 public class LexUtil {

     //对ICTCLAS进行必要的初始化
     private final static String CONFIG_PATH  = ".";

     public static List<String> getKeyWords(String doc) {
         return getKeyWords(doc.getBytes());

     }

     public static List<String> getWords(String doc) {

         return getWords(doc.getBytes());

     }

     public static List<String> getKeyWords(byte[] docData) {
         List<String> words = new LinkedList<String>();
         try {
            ICTCLAS2011 ict = new ICTCLAS2011();
            if(false == ict.ICTCLAS_Init(CONFIG_PATH.getBytes("GB2312"),0)) return null;
            byte[] results = ict.nativeProcAPara(docData);
            byte[] buffer = new byte[results.length];
            int n = ict.ICTCLAS_KeyWord(buffer, results.length/32);
            extractWords(docData, buffer, n, words);
            ict.ICTCLAS_Exit();
            buffer = null;
            results = null;
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(LexUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return words;
     }

     public static List<String> getWords(byte[] docData) {
         List<String> words = new LinkedList<String>();
         try {
            ICTCLAS2011 ict = new ICTCLAS2011();
            if(false == ict.ICTCLAS_Init(CONFIG_PATH.getBytes("GB2312"),0)) {
                throw new RuntimeException("ICTCLAS初始化失败");
            }
            byte[] results = ict.nativeProcAPara(docData);
            extractWords(docData, results, results.length/32, words);
            ict.ICTCLAS_Exit();
        } catch (UnsupportedEncodingException ex) {
            Logger.getLogger(LexUtil.class.getName()).log(Level.SEVERE, null, ex);
        }
        return words;
     }

     private static void extractWords(final byte[] docData, final byte[] inf, int n, Collection<String> words) {
         DataInputStream in = null;
         in = new DataInputStream(new ByteArrayInputStream(inf));
         try{
             for(int i=0; i<n; i++) {
                int start = Integer.reverseBytes(in.readInt());
                int length = Integer.reverseBytes(in.readInt());
                in.skip(24);
                String word = new String(docData, start, length);
                if(word.length() > 1) {
                    words.add(word);
                }
            }
         } catch (IOException ex) {
            Logger.getLogger(LexUtil.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                in.close();
            } catch (IOException ex) {
                Logger.getLogger(LexUtil.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
     }
}
