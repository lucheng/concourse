package com.buptsse.ate.nlp;

import com.buptsse.ate.utils.FileHelp;

import edu.fudan.nlp.tag.CWSTagger;

/**
 * 分词使用示例
 * @author xpqiu
 *
 */
public class ChineseWordSegmentation {
	/**
	 * @param args
	 * @throws IOException 
	 * @throws  
	 */
	public static void main(String[] args) throws Exception {
		
		CWSTagger tag = new CWSTagger("./models/seg.c7.110918.gz");
		/*System.out.println("不使用词典：");
		String str = "媒体计算研究所成立了, 高级数据挖掘很难";
		String s = tag.tag(str);
		System.out.println(s);
		
		
		tag = new CWSTagger("./models/seg.c7.110918.gz", "./models/dict.txt");
		System.out.println("\n使用词典");*/
		String str = FileHelp.readText("d:/workspace/finals/text_example/100154.txt");
		String s = tag.tag(str);
		System.out.println(s);
		
	}

}
