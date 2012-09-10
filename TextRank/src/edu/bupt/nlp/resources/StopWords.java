package edu.bupt.nlp.resources;


import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FilenameFilter;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;
import java.util.TreeSet;
import java.util.regex.Pattern;

import org.apache.log4j.Logger;

import ICTCLAS.kevin.zhang.CWSTagger;
import edu.bupt.nlp.textrank.Word;
import edu.bupt.utils.FileUtils;

/**
 * 本类主要功能是过滤停用词
 * @author ltian
 *
 */

public class StopWords {

	private Logger logger = Logger.getLogger(getClass());
//	private Searcher searcher = new Searcher();
	
	TreeSet<String> sWord = new TreeSet<String>();
	String dicPath;
	HashMap<String, Long> lastModTime = new HashMap<String, Long>();

	public StopWords(){	
	}
	public StopWords(String dicPath1,boolean b){
		this.dicPath = dicPath1;
		// 定期监视文件改动
		Timer timer = new Timer(true);
		timer.schedule(new TimerTask() {
			@Override
			public void run() {
				read(dicPath);
			}


		}, new Date(System.currentTimeMillis() + 10000), 24*60*60*1000);
	}
	/**
	 * 构造函数
	 * @param dicPath
	 *        stopword所在地址
	 */

	public StopWords(String dicPath) {		
		this.dicPath = dicPath;
		read(dicPath);		
	}

	/**
	 * 读取stopword
	 * @param dicPath
	 *       stopword所在地址
	 * @throws FileNotFoundException
	 */

	public void read(String dicPath) {

		File path = new File(dicPath);
		if(path.isDirectory()){
			String[] subdir = path.list(new FilenameFilter() {

				@Override
				public boolean accept(File dir, String name) {
					if(name.toLowerCase().endsWith("txt"))
						return true;
					else
						return false;
				}
			});
			for(int i=0;i<subdir.length;i++){
				read(path+"/"+subdir[i]);
			}
			return;
		}
		Long newTime = path.lastModified();
		Long lastTime = lastModTime.get(dicPath);
		if(lastTime ==null || !lastTime.equals(newTime)){
			//路径是文件
			try{
				InputStreamReader read = new InputStreamReader(new FileInputStream(path), "UTF-8");
				BufferedReader in = new BufferedReader(read);
				String s;
				while ((s = in.readLine()) != null){ 
					s = s.trim();
					if (!s.matches("^$"))
						sWord.add(s);
				}
				in.close();
			}catch (Exception e) {
				System.err.println("停用词文件路径错误");
			}
		}
	}

	/**
	 * 删除stopword
	 * 将string字符串转换为List类型，并返回
	 * @param str
	 *       要进行处理的字符串 
	 * @return
	 *       删除stopword后的List类型
	 */

	public List<String> phraseDel(String str){
		List<String> list = new ArrayList<String>(); 
		List<String> listTemp = new ArrayList<String>(); 
		listTemp = Arrays.asList(str.split("\\s+"));
		String s;
		int length= listTemp.size();
		for(int i = 0; i < length; i++){
			s = listTemp.get(i);
			if(!isStopWord(s))
				list.add(s);
		}
		return list;
	}
	
	
	public List<Word> phraseDel(String str, int bTagged){
		
		List<Word> list = new ArrayList<Word>(); 
		List<String> listTemp = new ArrayList<String>();
		listTemp = Arrays.asList(str.split("\\s+"));
		String wordRaw;
		String word;
		String tagger;
		int length= listTemp.size();
		for(int i = 0; i < length; i++){
			wordRaw = listTemp.get(i);
			if(wordRaw.lastIndexOf("/") < 0){
				continue;
			}
			word = wordRaw.substring(0, wordRaw.lastIndexOf("/")).toLowerCase();
			tagger = wordRaw.substring(wordRaw.lastIndexOf("/")+1);
			if(!isStopWord(word)){
				
				Word newWord = new Word(i, word, tagger);
				list.add(newWord);
			}
//			&& (tagger.equals("n")||tagger.equals("x")||tagger.equals("nr")||tagger.equals("ne"))
			/*Word newWord = new Word(i, word, tagger);
			list.add(newWord);*/
		}
		
		
//		return findWord(list, 0);
		return list;
	}

	public List<Word> findWord(List<Word> words, int beginIndex){
		
		for(int i = 0; i < words.size()-1; i++){
			if(words.get(i).getIndex()+1 == words.get(i+1).getIndex() && 
					(words.get(i+1).getTagger().equals("n")||words.get(i+1).getTagger().equals("ne") || words.get(i+1).getTagger().equals("nr")
							)){
				String newStr = words.get(i).getWord() + words.get(i+1).getWord();
//				List list = searcher.isWord(newStr);
				/*if(searcher.isWord(newStr)){
					words.set(i, new Word(i, newStr, "ne"));
					words.remove(i+1);
				}*/
			}
		}
		
		List<Word> newWords = new ArrayList<Word>();
		for(int i = 0; i < words.size(); i++){
			if(words.get(i).getTagger().equals("n")||words.get(i).getTagger().equals("ne") ||words.get(i).getTagger().equals("x")|| words.get(i).getTagger().equals("nr")){
				newWords.add(words.get(i));
			}
		}
		/*List<Word> newWords = new ArrayList<Word>();
		
//		System.out.println("dddd");
		for(int i = 0; i < beginIndex; i++){
			newWords.add(words.get(i));
		}
		
		for(int i = beginIndex; i < words.size()-1; i++){
			
			String newStr = words.get(i).getWord() + words.get(i+1).getWord();
			System.out.println(newStr);
			List list = searcher.search(newStr);
			
			if(list.size() > 0 && list.get(0).equals(newStr)){
				newWords.add(new Word(newStr, "ne"));
				for(int j = beginIndex + 1; j < words.size(); j++){
					newWords.add(words.get(j));
				}
			} else 
			
			System.out.println(newStr);
			
			if(list.size() > 0 && list.contains(newStr)){
				
				newWords.add(new Word(newStr, "ne"));
				System.out.println("add new word:" + newStr);
				for(int j = i; j < words.size(); j++){
					newWords.add(words.get(j));
				}
				newWords = findWord(newWords, beginIndex);
				
			} else {
				for(int j = i; j < words.size(); j++){
					newWords.add(words.get(j));
				}
				newWords = findWord(newWords, beginIndex + 1);
			}
		}*/
		
		return newWords;
	}
	
	Pattern noise = Pattern.compile(".*["+CharSets.allRegexPunc+"\\d]+.*");
	
	public boolean isStopWord(String word) {
		if (word.length() == 1)
			return true;

		if (noise.matcher(word).matches())
			return true;

		if (sWord.contains(word))
			return true;

		return false;
	}
	public static void main(String[] args){
		
		StopWords sw = new StopWords();
		String text = FileUtils.readText("./text_example/11.txt");
		CWSTagger tag = new CWSTagger();
		System.out.println(text);
		
		text = tag.tag(text, 1);
		
//		List<Word> list = sw.phraseDel(text, 1);
		
//		System.out.println(list);
		
		
		System.out.println("孵化器".compareTo("设施"));
		System.out.println("设施".compareTo("孵化器"));
		
		
		
	}
	
}
