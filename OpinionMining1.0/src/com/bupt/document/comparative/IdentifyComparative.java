package com.bupt.document.comparative;

import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Pattern;

import org.dom4j.Document;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

import com.bupt.utility.ImportSentimentDictionary;
import com.bupt.utility.Punctuation;
import com.bupt.utility.SVMResult;
import com.bupt.zconfigfactory.ConfigFactory;

/**
 * 比较句识别
 * @author BUPT
 *
 */

public class IdentifyComparative {

    /**
     * 比较关键字查找
	 * @param content
	 *       待进行关键字查找的句子
	 * @return
	 */
	public  boolean haveComparativeKeyword(String content){
		Object val = null;
		Object key = null;
		boolean foundKey = false;

		for (Iterator iter = ImportSentimentDictionary.keywords.keySet().iterator(); iter.hasNext();) {
		      key = iter.next();
		      //System.out.println("key:"+key);
		      val = ImportSentimentDictionary.keywords.get(key);
		      if(content.contains((String)key)){
				foundKey = true;
				//System.out.println("key:"+key);
				//System.out.println("value:"+val);
			}
		}
		return foundKey;
	}
	
	
	/**
	 * SVM比较句识别
	 * @param content
	 *       待进行比较句识别的句子
	 * @return
	 * @throws IOException
	 */
	public  LinkedList<SVMResult> identifyComparativeBySVM(String content) throws IOException{
		//long bs = Calendar.getInstance().getTimeInMillis();
		BufferedWriter outf;
		//outf = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(output)));
		boolean foundKey = false;//是否有比较关键词
		String newcontent = "";
		int j = 1;
		int i = 0;
		LinkedList<SVMResult> res = new LinkedList<SVMResult>();//比较结果
		List list = new ArrayList<String>();
		String keyword = null;
		boolean iscomparative = false;
		
		for (Iterator iter = ImportSentimentDictionary.keywords.keySet().iterator(); iter.hasNext();) {
		      Object key = iter.next();
		      Object val = ImportSentimentDictionary.keywords.get(key);
			if(content.contains((String)key)){
				foundKey = true;//找到比较关键词
				//System.out.println("key:"+key);
				//System.out.println("value:"+val);
				 keyword = (String)key;
			}
                        }
		//如果找到比较关键词，则按比较关键词与相应的比较句规则进行匹配
		if(foundKey){
			ArrayList<String> iter = new ArrayList<String>(); 
			if(keyword.equals(ConfigFactory.getString("SVMComparative.KeywordBi.word"))){iter = ImportSentimentDictionary.birules;}
			else if(keyword.equals(ConfigFactory.getString("SVMComparative.KeywordYiYang.word")))iter = ImportSentimentDictionary.yiyangrules;
			else if(keyword.equals(ConfigFactory.getString("SVMComparative.KeywordZui.word"))) iter = ImportSentimentDictionary.zuirules;
			for (Iterator iter1 = iter.iterator(); iter1.hasNext();)  {
				  Object rule = iter1.next();
			      String regEx = (String)rule;
			     
			      boolean result=Pattern.compile(regEx).matcher(content).find();
				if(result)
				{
						//System.out.println("匹配到第"+j+"条规则:"+regEx);					
						i = 1;
						String st1=j+Punctuation.COLON+i;
						list.add(st1);
						j++;
				}
				else
				{
//					System.out.println("未匹配到第"+j+"条规则:"+regEx);	
					i=0;
//					System.out.println("与第"+j+"条规则不匹配");
//					System.out.println(j+":"+i);
					String st2=j+Punctuation.COLON+i;
					list.add(st2);
					j++;
				}
			}
		}
			//转换成SVM识别的格式
			newcontent = list.toString();
			newcontent = newcontent.replace(Punctuation.SQUARE_LEFT,Punctuation.EMPTY);
			newcontent = newcontent.replace(Punctuation.SQUARE_RIGHT,Punctuation.ENTER);
			newcontent = newcontent.replace(Punctuation.COMMA_HALF, Punctuation.SPACE);
			if(newcontent!=null)
			{
				outf = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(ConfigFactory.getString("SVMComparative.output"))));
				outf.write(newcontent);//把序列存在“output”文件中
				outf.flush();
				//System.out.println("------------------------规则匹配后得到的序列-----------------------------");
				//System.out.println("result:"+newcontent);
				//对得到的result进行SVM判别
				 iscomparative = svm_predict.runSVM(keyword);
				 if(iscomparative)
				 {
					 res.add(new SVMResult(keyword,iscomparative));
					 }
			}
			return res;
		}	


	/**
	 * XML比较句识别
	 * @param content
	 *        待进行比较句识别的句子
	 * @param file
	 * 		  比较句模式库路径
	 * @return
	 */
	public  LinkedList<SVMResult> identifyComparativeByXML(String content, String file){

		LinkedList<SVMResult> res = new LinkedList<SVMResult>();
		boolean foundK = false;
		String keyword = null;
		boolean iscomp = false;
		List list1 = null;
		for (Iterator iter = ImportSentimentDictionary.keywords.keySet().iterator(); iter.hasNext();) {
		      Object key = iter.next();
		      Object val = ImportSentimentDictionary.keywords.get(key);
			if(content.contains((String)key)){
				foundK = true;
				//System.out.println("key:"+key);
				//System.out.println("value:"+val);
				 keyword = (String)key;
			}
	                    }
		if(foundK){
				try{
					SAXReader saxReader = new SAXReader();
				    Document document = saxReader.read(file);
				    if(keyword.equals(ConfigFactory.getString("SVMComparative.KeywordBi.word")))list1= document.selectNodes("Rules/birule");
					else if(keyword.equals(ConfigFactory.getString("SVMComparative.KeywordYiYang.word")))list1= document.selectNodes("Rules/yiyangrule");
					else if(keyword.equals(ConfigFactory.getString("SVMComparative.KeywordZui.word"))) list1= document.selectNodes("Rules/zuirule");
	          		Iterator iter1= list1.iterator();   
	          		while (iter1.hasNext())
	         		 { 	 
	          			Node node1= (Node) iter1.next(); 
						String regEx=node1.getText();
						//System.out.println("regEx:"+regEx);
						boolean result=Pattern.compile(regEx).matcher(content).find();
						//System.out.println("result:"+result); 
						if(result){
							iscomp = true;
							//System.out.println("与该条规则匹配"+regEx);
							res.add(new SVMResult(keyword,iscomp));
								}
							}
	         		 }
				catch (Exception ex) {   
			               ex.printStackTrace();   
			} 
		}
		return res;
		}		
	
}
