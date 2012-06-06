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
	    /*log.info("========size:" + cste.getMaps().get(0).size());
		for(String key : cste.getMaps().get(0).keySet()){
			log.info(key + "=========" + cste.getMaps().get(0).get(key));
		}*/
		// 双词抽取
		CBigramExtraction cbe = new CBigramExtraction(userDictList, cste);
		cbe.createMaps();
		cbe.extract();
		bigramTermMap = cbe.getMaps().get(0);
		/*log.info("size:" + cbe.getMaps().get(0).size());
		for(String key : cbe.getMaps().get(0).keySet()){
			log.info(key + "=========" + cbe.getMaps().get(0).get(key));
		}*/
		// 三词抽取
		CTrigramExtraction cte = new CTrigramExtraction(userDictList, cste);
		cte.createMaps();
		cte.extract();
		trigramTermMap = cte.getMaps().get(0);
//		log.info("size:" + cte.getMaps().get(0).size());
		/*for(String key : cte.getMaps().get(0).keySet()){
			log.info(key + "=========" + cte.getMaps().get(0).get(key));
		}*/
	}


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

}
