package edu.bupt.nlp.textrank;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.TreeSet;

import org.apache.log4j.Logger;

import ICTCLAS.kevin.zhang.CWSTagger;
import edu.bupt.nlp.resources.StopWords;
import edu.bupt.utils.FileUtils;

class WDataSet{
	Graph graph = new Graph();
	ArrayList<Double> w = new ArrayList<Double>();
	ArrayList<Double> wBack = new ArrayList<Double>();
	List<String> list = new ArrayList<String>();
	ArrayList<String> subList = new ArrayList<String>();
}

public class EntityExtract extends Extractor{
		
	private Logger log = Logger.getLogger(getClass());
	
	public EntityExtract(){
		precision = 1.0;
		dN = 0.85;
	}
	
	public EntityExtract(String dicPath, String stopPath) throws Exception{
		tagger = new CWSTagger();
		stopword = new StopWords(stopPath);
	}
	
	private WDataSet getWord(String str){
		
		Set<String> set = new TreeSet<String>();
		WDataSet wds = new WDataSet();
		
		if(stopword!=null){
			//去除停用词
			wds.list = stopword.phraseDel(str);
		}else{
			wds.list = new ArrayList<String>(); 
			String[] toks = str.split("\\s+");
			for(int i=0;i<toks.length;i++){
				if(toks[i].length()>0)
				wds.list.add(toks[i]);
			}
		}
		
		String temp;
		
		for(int i = 0; i < wds.list.size(); i++){
//			将分词放入TreeSet中
			temp = wds.list.get(i);
			set.add(temp);
		}
		
		Iterator<String> ii = set.iterator();
		while(ii.hasNext()){
			str = ii.next();
			wds.subList.add(str);
		}
		return wds;
	}
	
	private WDataSet mapInit(int window, WDataSet wds){
		
		TreeMap<String,Integer> treeMap = new TreeMap<String,Integer>();
		Iterator<String> ii = wds.subList.iterator();
		int nnn = 0;
		while(ii.hasNext()){
			String s = ii.next();
			Vertex vertex = new Vertex(s);
			wds.graph.addVertex(vertex);
			wds.w.add(1.0);
			wds.wBack.add(1.0);
			treeMap.put(s, nnn);
			nnn++;
		}
		
		String id1,id2;
		int index1,index2;
		
		int length = wds.list.size();
		while(true){
			if(window > length)
				window /= 2;
			else if(window <= length || window <= 3)
				break;
		}
		
		for(int i = 0; i < wds.list.size() - window; i++){
			id1 = wds.list.get(i);
			index1 = treeMap.get(id1);
			for(int j = i + 1; j < i + window; j++){
				id2 = wds.list.get(j);
				index2 = treeMap.get(id2);
				wds.graph.addEdge(index2, index1);
			}
		}
		return wds;
	}
	
	boolean isCover(WDataSet wds){
		int i;
		double result = 0.0;
		
		for(i = 0; i < wds.graph.getNVerts(); i++){
			result += Math.abs(wds.w.get(i) - wds.wBack.get(i));
		}

		if(result < precision)
			return true;
		else
			return false;
	}
	
	public void toBackW(WDataSet wds){
		int i;
		
		for(i = 0; i < wds.graph.getNVerts(); i++){
			wds.wBack.set(i, wds.w.get(i));
		}
	}
	
	public WDataSet cal(WDataSet wds){
		int i, j, forwardCount, times = 0;
		double sumWBackLink, newW;
		ArrayList<Vertex> nextList;
		ArrayList<Integer> nextWList;
		Vertex vertex;
		
		while(true){
			times++;
			for(i = 0; i < wds.graph.getNVerts(); i++){
				vertex = wds.graph.getVertex(i);
				nextList = vertex.getNext();
				nextWList = vertex.getWNext();
				if(nextList != null){
					sumWBackLink = 0;
					for(j = 0; j < nextWList.size(); j++){
						vertex = nextList.get(j);
						int ww = nextWList.get(j);
						int temp = vertex.index;
						forwardCount = vertex.getForwardCount();
						if(forwardCount != 0)
							sumWBackLink += wds.wBack.get(temp) * ww / forwardCount;
					}
					newW = (1 - dN) + dN * sumWBackLink;
					wds.w.set(i, newW);
				}
			}
			if(isCover(wds) == true){
				break;
			}
			toBackW(wds);
		}
		return wds;
	}
	
	public ArrayList<Integer> normalized(WDataSet wds){
		ArrayList<Integer> wNormalized = new ArrayList<Integer>();
		double max, min, wNDouble;
		int i, wNormalInt;
		double wNormal;
		max = Collections.max(wds.w);
		min = Collections.min(wds.w);
		
		if(max != min)
			for(i = 0; i < wds.graph.getNVerts(); i++){
				wNDouble = wds.w.get(i);
				wNormal = (wNDouble - min) / (max - min);
				wNormalInt = (int)(100 * wNormal);
				wds.w.set(i, wNormal);
				wNormalized.add(wNormalInt);
			}
		else
			for(i = 0; i < wds.graph.getNVerts(); i++)
				wNormalized.add(100);
		return wNormalized;
	}
	
	public LinkedHashMap<String,Integer> selectTop(int selectCount, WDataSet wds){
		int i, j, index;
		double max;
		LinkedHashMap<String,Integer> mapList = new LinkedHashMap<String,Integer>();
		
		if(wds.graph.getNVerts() == 0)
			return mapList;
		
		ArrayList<Integer> wNormalized = normalized(wds);
		toBackW(wds);
		
		int temp = wds.subList.size();
		if(selectCount > temp)
			selectCount = temp;
		
		for(j = 0; j < selectCount; j++){
			max = -1.0;
			index = -1;
			for(i = 0; i < wds.graph.getNVerts(); i++){
				if(wds.wBack.get(i) > max){
					max = wds.wBack.get(i);
					index = i;
				}
			}
			if(index != -1){
				mapList.put(wds.graph.getVertex(index).getId(), wNormalized.get(index));
				wds.wBack.set(index, -2.0);
			}
		}
		return mapList;
	}
	
	public WDataSet proceed(String str){
		
		WDataSet wds1, wds2;
//		初始化wds1
		wds1 = getWord(str);
//		long time1 = System.currentTimeMillis();
//		System.out.println("InitGraph...");
		
//		初始化wds2
		wds2 = mapInit(windowN, wds1);
//		System.out.println("Succeed In InitGraph!");
//		System.out.println("Now Calculate the PageRank Value...");
		wds1 = cal(wds2);
//		double time = (System.currentTimeMillis() - time1) / 1000.0;
//		System.out.println("Time using: " + time + "s");
//		System.out.println("PageRank Value Has Been Calculated!");
		return wds1;
	}
	
	public Map<String,Integer> extract(String str, int num, boolean isWeighted){
		if(tagger != null){
			//将文本进行分词
			str = tagger.tag(str, 0);
		}
		
		//进行TextRank算法计算
		WDataSet wds = proceed(str);
		LinkedHashMap<String,Integer> mapList = selectTop(num, wds);
		return mapList;
	}

	public static void main(String[] args) throws Exception {	
		
		Extractor key = new EntityExtract("./ICTCLAS_CONFIG/userdict.txt", "./ICTCLAS_CONFIG/stopwords.txt");
		long time = System.currentTimeMillis();
		
		String text = FileUtils.readText("./text_example/100059.txt");
		System.out.println(text);
		Map<String, Integer> result = key.extract(text, 100,true);
		System.out.println(result);
		
		long t = System.currentTimeMillis() - time;
		System.out.println("用时：" + t + " ms");

	}

}








