package edu.fudan.nlp.chinese.ner;

import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.ObjectOutputStream;
import java.util.regex.Pattern;
import java.util.zip.GZIPOutputStream;
/**
 * 将时间表达式文本转换成pattern序列化
 * @author xpqiu
 * @since 1.0
 */
public class Txt2Bin {
	/**
	 * 输出模型
	 * @param inText
	 * @param outBin
	 * @throws IOException
	 */
	private static void text2binModel(String inText,String outBin) throws IOException {
		ObjectOutputStream out = new ObjectOutputStream(new BufferedOutputStream (
				new GZIPOutputStream (new FileOutputStream(outBin))));
		String rules = loadtxt(inText);
		Pattern p = Pattern.compile(rules);
		out.writeObject(p);
		out.close();
	}
	/**
	 *构建正则表达式
	 *
	 *从"TimeExp-Rules.txt"文件中抽取时间表达式相关的正则表达式，
	 *将所有正则表达式整合，构成一个完整的正则表达式用于识别文本中的时间表达式
	 *
	 * @param none 该方法没有参数
	 * @return String 返回整合后的正则表达式
	 * @throws IOException 文件读取错误时抛出
	 * 
	 */
	private static String loadtxt(String path){
		String rules = "";
		try {		
			InputStreamReader  read = new InputStreamReader (new FileInputStream(path),"utf-8");
			BufferedReader bin = new BufferedReader(read);
			String _ruleunit = bin.readLine();
			while (_ruleunit!=null)
			{
				if (!_ruleunit.startsWith("-"))
				{
					if(rules.equals(""))
						rules=rules+"("+_ruleunit+")";
					else
						rules=rules+"|("+_ruleunit+")";
				}	
				_ruleunit=bin.readLine();
			}
		}catch(Exception e){
			System.out.println("正则表达式文件未找到！");
		}
		return rules;
	}
	public static void main(String[] args) throws Exception{
		text2binModel("C:/Users/xpqiu/Documents/xpqiu/项目/4.自选/FudanNLP/TimeExp-Rules.txt",
				"models/TimeExp.gz");
	}
}

