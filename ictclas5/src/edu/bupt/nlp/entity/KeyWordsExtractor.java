package edu.bupt.nlp.entity;

import java.io.IOException;
import java.util.Map;

import org.apache.log4j.Logger;

/**
 * 
 */

public class KeyWordsExtractor {

//	private static String filePath = "\\\\buptsse215-02/data/baidu/";
	private static String filePath = "d:/data/baike/";
	private static String preUrl = "http://baike.baidu.com";
	
	private Map<String, Integer> singleTermMap = null;
	private Map<String, Integer> bigramTermMap = null;
	private Map<String, Integer> trigramTermMap = null;
	
	private Logger log = Logger.getLogger(getClass());
	
	public void getWordsFrequency() throws IOException{
		
		String inputTrainPath = "input/input";   
		String outputTrainPath = "input/output"; 
		ATE ate = new ATE();
		ate.pretreatmentTrain(inputTrainPath, outputTrainPath); 
		
		singleTermMap = ate.getSingleTermMap();
		bigramTermMap = ate.getBigramTermMap();
		trigramTermMap = ate.getTrigramTermMap();
		
		int[] array = new int[singleTermMap.size()];
		int pos = 0;
		for(String key : singleTermMap.keySet()){
			array[pos] = singleTermMap.get(key);
			pos++;
		}
		HeapSort hsort = new HeapSort();
		hsort.HeapSorting(array);
		
		for(String key : singleTermMap.keySet()){
			log.info(key);
		}
		
		array = new int[bigramTermMap.size()];
		pos = 0;
		for(String key : bigramTermMap.keySet()){
			array[pos] = bigramTermMap.get(key);
			pos++;
		}
		hsort = new HeapSort();
		hsort.HeapSorting(array);
		
		for(String key : bigramTermMap.keySet()){
//			if(bigramTermMap.get(key) > array[8]){
				log.info(key);
//			}
		}
		
		array = new int[trigramTermMap.size()];
		pos = 0;
		for(String key : trigramTermMap.keySet()){
			array[pos] = trigramTermMap.get(key);
			pos++;
		}
		hsort = new HeapSort();
		hsort.HeapSorting(array);
		
		for(String key : trigramTermMap.keySet()){
//			if(trigramTermMap.get(key) > array[3]){
				log.info(key);
//			}
		}
	}
	public static void main(String[] args) throws IOException {
		
		KeyWordsExtractor test = new KeyWordsExtractor();
		test.getWordsFrequency();
//		test.getWords("input/input/100049.txt");
	}

}
