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

class DataSet{
	Graph graph = new Graph();
	ArrayList<Double> w = new ArrayList<Double>();
	ArrayList<Double> wBack = new ArrayList<Double>();
	List<Word> list = new ArrayList<Word>();
	ArrayList<Word> subList = new ArrayList<Word>();
}

public class TextRankExtractor extends Extractor{
		
	private Logger logger = Logger.getLogger(getClass());
	
	@SuppressWarnings("unchecked")
	public TextRankExtractor(){
		precision = 1.0;
		dN = 0.85;
	}
	
	@SuppressWarnings("unchecked")
	public TextRankExtractor(String dicPath, String stopPath) throws Exception{
		tagger = new CWSTagger(dicPath);
		stopword = new StopWords(stopPath);
	}
	
	private DataSet getWord(String str){
		
		Set<Word> set = new TreeSet<Word>();
		DataSet wds = new DataSet();
		
		if(stopword!=null){
			//去除停用词
			wds.list = stopword.phraseDel(str, 1);
		}
		
		Word temp;
		
		for(int i = 0; i < wds.list.size(); i++){
//			将分词放入TreeSet中
			temp = wds.list.get(i);
			set.add(temp);
		}
		
		
		
		Iterator<Word> ii = set.iterator();
		while(ii.hasNext()){
			temp = ii.next();
//			logger.info(temp);
			wds.subList.add(temp);
		}
		return wds;
	}
	
	/**
	 * 初始化TreeMap
	 * @param window 窗口大小
	 * @param wds 数据集
	 * @return
	 */
	private DataSet mapInit(int window, DataSet wds){
		
		TreeMap<Word,Integer> treeMap = new TreeMap<Word,Integer>();
		Iterator<Word> ii = wds.subList.iterator();
		int nnn = 0;
		while(ii.hasNext()){
			Word word = ii.next();
			Vertex vertex = new Vertex(word);
			wds.graph.addVertex(vertex);
			wds.w.add(1.0);
			wds.wBack.add(1.0);
			treeMap.put(word, nnn);
			nnn++;
		}
		
		Word id1,id2;
		int index1,index2;
		
		int length = wds.list.size();
		while(true){
			if(window > length){
				window /= 2;
			}
			else if(window <= length || window <= 3){
				break;
			}
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
	
	boolean isCover(DataSet wds){
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
	
	public void toBackW(DataSet wds){
		int i;
		
		for(i = 0; i < wds.graph.getNVerts(); i++){
			wds.wBack.set(i, wds.w.get(i));
		}
	}
	
	public DataSet cal(DataSet wds){
		
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
	
	public ArrayList<Integer> normalized(DataSet wds){
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
	
	public LinkedHashMap<Word,Integer> selectTop(int selectCount, DataSet wds){
		int i, j, index;
		double max;
		LinkedHashMap<Word,Integer> mapList = new LinkedHashMap<Word,Integer>();
		
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
				mapList.put(wds.graph.getVertex(index).getWord(), wNormalized.get(index));
				wds.wBack.set(index, -2.0);
			}
		}
		return mapList;
	}
	
	public DataSet proceed(String str){
		
		DataSet wds1, wds2;
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
	
	@Override
	public Map<Word,Integer> extract(String str, int num, boolean isWeighted){
		if(tagger != null){
			//将文本进行分词
			str = tagger.tag(str, 1);
//			logger.info(str);
		}
		
		//进行TextRank算法计算
		DataSet wds = proceed(str);
		LinkedHashMap<Word,Integer> mapList = selectTop(num, wds);
		return mapList;
	}

	
	/*public Map<Word, Integer> findEntiry(Map<Word, Integer> result){
		
		Map<Word, Integer> entities = new TreeMap<Word, Integer>();
		
		for(Word word : result.keySet()){
			if(isEntity(word)){
				entities.put(word, result.get(word));
			}
		}
		
		return entities;
	}*/

	
	public static void main(String[] args) throws Exception {	
		
		
		TextRankExtractor key = new TextRankExtractor("./dict/userdic.txt", "./dict/stopLibrary.dic");
		String text ="全球200万名Linux开发者终于等到了这一天，是时候对微软说“不”了，因为“云计算”时代即将来临，以及廉价的、超小型笔记本电脑正在快速普及。日前，香港Linux商会会长简锦源在广州信息产业周上指出，由于手机、超小型笔记本等移动互联网终端的出现，这种移动终端设备采用Linux平台作为操作系统已经成为IT业界的一种发展趋势。简锦源指出，在过去几年里，以Linux为代表在开放源码软件的使用率正在不断上升，已经开始挑战微软的桌面平台和办公软件等等产品。简锦源透露，开放源码的软件在服务器端占有率已经超过50%，而在中国新的电脑中预装和捆绑Linux的，每年都超过200万台。";
		Map<Word, Integer> result = key.extract(text, 1000, true);
		System.out.println(result);
		
		/*String strPath = "./text_example/";
		List<String> filelist = new ArrayList<String>();
		FileUtils.fetchFileList(strPath, filelist, ".txt");
		FileOutputStream fos = new FileOutputStream("./output/result.txt", true);
		Writer out = new OutputStreamWriter(fos, "UTF-8");
		
		for(String fileName : filelist){
			
			String text = FileUtils.readText(fileName);
			System.out.println(fileName);
			Map<Word, Integer> result = key.extract(text, 1000, true);
			out.write(result.toString() + System.getProperty("line.separator"));
		}
		out.close();
		fos.close();*/
		
	}

}








