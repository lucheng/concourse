/**
 * Copyright    : Copyright(C) 2000-2009. HIT-CIR. All Rights Reserved
 * File Summary : AutoSuggest(输入框智能提示)
 * Author       : Fandywang 
 * Create time  : 2009-12-13
 * Project Name : yuetan
 * Version      : 1.0
 */
package edu.hit.irlab.yuetan.autosuggest;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.PriorityQueue;

import edu.hit.irlab.yuetan.autosuggest.ds.tree.RadixTree;
import edu.hit.irlab.yuetan.autosuggest.ds.tree.RadixTreeImpl;

/**
 * The Class AutoSuggest.
 * 
 * @author Fandywang
 */
public class AutoSuggest {

	/** The hanzi To pinyin map. */
	private static HashMap<Character, String> hanziPyMap;

	/** The radix tree dic. */
	private static RadixTree<ArrayList<Keyword>> radixTreeDic;

	/** The cache. */
	private static HashMap<String, ArrayList<Keyword>> cache;

	/** The maxsize of cache. */
	private static final int cacheMaxSize = 1000000;

	/** The punc set. */
	private static HashSet<Character> puncSet;

	/**
	 * Instantiates a new auto suggest.
	 */
	public AutoSuggest() {
		this("./data/keywords.txt");
	}

	/**
	 * Instantiates a new AutoSuggest.
	 * 
	 * @param keywords_file the keywords_file
	 */
	public AutoSuggest(String keywords_file) {
		hanziPyMap = new HashMap<Character, String>();
		radixTreeDic = new RadixTreeImpl<ArrayList<Keyword>>();
		cache = new HashMap<String, ArrayList<Keyword>>();
		puncSet = new HashSet<Character>();

		loadHanziPinYin("./data/quanpin_hz.txt");
		loadPunc("./data/punc.txt");
		loadWordMap(keywords_file);
	}

	/**
	 * Load hanziTopinyin.
	 * 
	 * @param filename the filename
	 */
	private void loadHanziPinYin(String filename) {
		BufferedReader in = null;
		try {
			in = new BufferedReader(new InputStreamReader(new FileInputStream(
					filename), "utf-8"));

			String py, hz;
			while ((py = in.readLine()) != null) {
				hz = in.readLine();

				for (int i = 0; i < hz.length(); i++) {
					hanziPyMap.put(hz.charAt(i), py);
				}
			}
			in.close();

			System.err.println("load file " + filename + " ok!");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null)
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}

	/**
	 * Load word map.
	 * 
	 * @param filename the filename
	 */
	private void loadWordMap(String filename) {
		BufferedReader in = null;
		try {
			in = new BufferedReader(new InputStreamReader(new FileInputStream(
					filename), "utf-8"));

			String aline;
			while ((aline = in.readLine()) != null) {
				int space = aline.lastIndexOf(' ');
				if (space == -1)
					continue; // 格式不正确的过滤掉，增强鲁棒性
				int value = Integer.valueOf(aline.substring(space + 1));
				// 出现次数特别少的不考虑
				if (value < 2)
					continue;
				String word = aline.substring(0, space);
				String pys = HanziToPinyin(word);

				ArrayList<Keyword> it = radixTreeDic.find(pys);

				if (it == null) {
					it = new ArrayList<Keyword>();
				} else
					radixTreeDic.delete(pys);
				// System.out.println(word + " " + value);
				it.add(new Keyword(word, value));
				radixTreeDic.insert(pys, it);
			}
			in.close();

			System.err.println("load file " + filename + " ok!");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null)
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}

	/**
	 * Load punc.
	 * 
	 * @param filename the filename
	 */
	private void loadPunc(String filename) {
		BufferedReader in = null;
		try {
			in = new BufferedReader(new InputStreamReader(new FileInputStream(
					filename), "utf-8"));

			String aline;
			while ((aline = in.readLine()) != null) {
				for (int i = 0; i < aline.length(); ++i) {
					puncSet.add(aline.charAt(i));
				}
			}
			in.close();

			System.err.println("load file " + filename + " ok!");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (in != null)
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
	}

	/**
	 * HanziString to pinyinString.
	 * if English String, return itself
	 * 
	 * @param hz the hz
	 * 
	 * @return the string
	 */
	private synchronized String HanziToPinyin(String hz) {
		StringBuilder pys = new StringBuilder();
		for (int i = 0; i < hz.length(); i++) {	
			// 过滤标点符号
			if( puncSet.contains(hz.charAt(i)) ) continue;
			
			String py = hanziPyMap.get(hz.charAt(i));
			pys.append((py == null) ? Character.toLowerCase(hz.charAt(i)) : py);
		}

		return pys.toString();
	}

	/**
	 * Find the most n similar keywords.
	 * 
	 * @param key the keyword
	 * 
	 * @return 如果存在与关键词相似的词，返回词；否则，返回空
	 * （如果key只包含特殊字符，也返回空）
	 */
	public synchronized ArrayList<String> find(String key) {
		key = key.trim();
		//System.out.println("key:" + key);

		String py = HanziToPinyin(key);
		if( py.length() < 1 ) return null;
		
		ArrayList<Keyword> cacheRes = findCache(py);
		if (cacheRes != null) {// 已经存在于缓存中
			System.out.println("缓存中的数据");
			return reOrder(cacheRes, key, py);
		}

		PriorityQueue<Keyword> simResult = new PriorityQueue<Keyword>(12);
		radixTreeDic.searchPrefixNodes(py, simResult);

		if (simResult.size() < 1 && py.length() > 1) {
			// 当前字符串查询不到相似的关键词，尝试删除最后一个字符重新查找
			String tmpPy = py.substring(0, py.length() - 1);
			cacheRes = findCache(tmpPy);
			if (cacheRes != null) {// 已经存在于缓存中
				System.out.println("缓存中的数据");
				return reOrder(cacheRes, key, py);
			} else
				radixTreeDic.searchPrefixNodes(tmpPy, simResult);
		}
		//System.out.println("##total number:" + simResult.size());
		if (simResult.size() < 1)
			return null;

		ArrayList<Keyword> result = new ArrayList<Keyword>();
		while (simResult.peek() != null) {
			Keyword obj = simResult.poll();
			result.add(obj);
		}
		updateCache(py, result);

		return reOrder(result, key, py);
	}

	/**
	 * Update cache
	 * 
	 * 缓存未满，结果存入缓存中；否则，模拟虚拟存储系统的‘页面’调度方法，
	 * 不过，考虑到尽可能的节省时间和空间，简单的替换掉cache的第一个关键词信息.
	 * 
	 * @param py the py
	 * @param result the result
	 */
	private synchronized void updateCache(String py, ArrayList<Keyword> result) {
		if (cache.size() == cacheMaxSize) {
			for (String str : cache.keySet()) {// 缓存满的话，移除第一个元素
				cache.remove(str);
				break;
			}
		}
		cache.put(py, result);
	}

	/**
	 * 是否可以从缓存中获取数据.
	 * 
	 * @param key 关键词
	 * 
	 * @return ArrayList<Keyword>
	 */
	private synchronized ArrayList<Keyword> findCache(String key) {		
		return cache.get(key);
	}

	/**
	 * 根据公共前缀长度进行重排序.
	 * 
	 * @param result the result
	 * @param key the key
	 * @param py the py
	 * 
	 * @return 二级排序后的结果
	 */
	private synchronized ArrayList<String> reOrder(ArrayList<Keyword> result, String key, String py) {
		if (result.size() == 1 && result.get(0).equals(key)) {
			// 如果只有一个结果，并且该结果和query一样，则不用返回结果
			return null;
		}
		
		PriorityQueue<ResultComp> tempR = new PriorityQueue<ResultComp>(12);
		for (int i = 0, j; i < result.size(); i++) {
			String word = HanziToPinyin(result.get(i).getWord());
			for (j = 0; j < py.length() && j < word.length()
					&& py.charAt(j) == word.charAt(j); j++)
				;
			tempR.offer(new ResultComp(j, result.get(i)));
		}
		
		//System.out.println("*********After reOrder************");
		ArrayList<String> newResult = new ArrayList<String>();
		while (tempR.peek() != null) {
			ResultComp obj = tempR.poll();
			newResult.add(obj.keyword.getWord());
			//System.out.println(obj.keyword.getWord() + ": "
			//		+ obj.keyword.getVaule());
		}

		return newResult;
	}

	/**
	 * The main method.
	 * 
	 * @param args the args
	 */
	public static void main(String[] args) {
		AutoSuggest as = new AutoSuggest();

		as.find("tiantt");
	}

}
