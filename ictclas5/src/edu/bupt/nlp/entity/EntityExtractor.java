package edu.bupt.nlp.entity;

import java.io.IOException;
import java.util.HashSet;
import java.util.Map;

import org.apache.log4j.Logger;

import edu.bupt.nlp.couple.CBigramExtraction;
import edu.bupt.nlp.single.CSingleTermExtraction;
import edu.bupt.nlp.tag.CWSTagger;
import edu.bupt.nlp.trigram.CTrigramExtraction;
import edu.bupt.nlp.utils.Constant;


/**
 * 
 * @author linzhe
 * @email  m23linzhe@gmail.com
 * @date   2012-6-6
 */

public class EntityExtractor {

	private static Logger logger = Logger.getLogger(EntityExtractor.class);

	final public static String BAIKE_XML_PATH = "\\\\buptsse215-02\\data\\baidu\\";
	final public static String ENTITY_FILE_PATH = "./ICTCLAS_CONFIG/entity.txt";
	
	final public static String PAGE_FILE_PATH = "\\\\buptsse215-02\\data\\baidu\\";
	final public static String TAG_FILE_NAME = "d:\\data\\tags\\tags.txt";
	final public static String TITLE_FILE_NAME = "d:\\data\\tags\\titles.txt";

	
	private Map<String, Integer> singleTermMap = null;
	private Map<String, Integer> bigramTermMap = null;
	private Map<String, Integer> trigramTermMap = null;
	
	public Map<String, Integer> getSingleTermMap() {
		return singleTermMap;
	}


	public void setSingleTermMap(Map<String, Integer> singleTermMap) {
		this.singleTermMap = singleTermMap;
	}


	public Map<String, Integer> getBigramTermMap() {
		return bigramTermMap;
	}


	public void setBigramTermMap(Map<String, Integer> bigramTermMap) {
		this.bigramTermMap = bigramTermMap;
	}


	public Map<String, Integer> getTrigramTermMap() {
		return trigramTermMap;
	}


	public void setTrigramTermMap(Map<String, Integer> trigramTermMap) {
		this.trigramTermMap = trigramTermMap;
	}
	
	public void getWordsFrequency() throws Exception{
		
		String inputTrainPath = "input/input";
		String outputTrainPath = "input/output";
		EntityExtractor ate = new EntityExtractor();
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
			logger.info(key);
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
				logger.info(key);
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
				logger.info(key);
//			}
		}
	}
	
	/**
	 * 对训练文本进行分词处理，生成res文件
	 * @param inputPath 训练文本的路径
	 * @param outputPath 训练文本分词后存放res文件的路径
	 * @throws Exception 
	 */
	public void pretreatmentTrain(String inputPath, String outputPath) throws Exception {
		
		// Automatically tag the files, form tag files
//		log.info(inputPath);
		CWSTagger tagger = new CWSTagger();
		tagger.tagFile(inputPath, Constant.CPATH, 1);
		
		// get words in the user dictionary
		UserDict userDict = new UserDict();
		HashSet<String> userDictList = userDict.getUserDict();
		String path = Constant.CPATH; // tag文件的目录
	
		/*log.info("userDictList size:" + userDictList.size());
		for(Iterator it = userDictList.iterator(); it.hasNext();){
			log.info(it.next());
		}*/
		// 单词抽取
		CSingleTermExtraction cste = new CSingleTermExtraction(path, userDictList);
		cste.createMap();
	    cste.extract();
	    singleTermMap = cste.getMaps().get(0);
	    logger.info("========size:" + cste.getMaps().get(0).size());
		for(String key : cste.getMaps().get(0).keySet()){
			logger.info(key + "=========" + cste.getMaps().get(0).get(key));
		}
		// 双词抽取
		CBigramExtraction cbe = new CBigramExtraction(userDictList, cste);
		cbe.createMaps();
		cbe.extract();
		bigramTermMap = cbe.getMaps().get(0);
		logger.info("size:" + cbe.getMaps().get(0).size());
		for(String key : cbe.getMaps().get(0).keySet()){
			logger.info(key + "=========" + cbe.getMaps().get(0).get(key));
		}
		// 三词抽取
		CTrigramExtraction cte = new CTrigramExtraction(userDictList, cste);
		cte.createMaps();
		cte.extract();
		trigramTermMap = cte.getMaps().get(0);
//		log.info("size:" + cte.getMaps().get(0).size());
		for(String key : cte.getMaps().get(0).keySet()){
			logger.info(key + "=========" + cte.getMaps().get(0).get(key));
		}
	}


	public static void main(String[] args) throws Exception{
		EntityExtractor test = new EntityExtractor();
		test.getWordsFrequency();
	}
	

}
