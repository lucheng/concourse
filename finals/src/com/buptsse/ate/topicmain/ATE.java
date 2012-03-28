package com.buptsse.ate.topicmain;

import java.io.IOException;
import java.util.HashSet;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.buptsse.ate.cBigram.CBigramExtraction;
import com.buptsse.ate.cSingle.CSingleTermExtraction;
import com.buptsse.ate.cTrigram.CTrigramExtraction;
import com.buptsse.ate.utils.Constant;


/**
 * ��ѵ���ı����зִʴ���
 * 
 * @author ZhuYan
 * @version 2008/05/21
 */

public class ATE {

	private Logger log = Logger.getLogger(getClass());
	public ATE(){
		PropertyConfigurator.configure(Constant.LOG4J);
	}
	/**
	 * ��ѵ���ı����зִʴ�������res�ļ�
	 * @param inputPath ѵ���ı���·��
	 * @param outputPath ѵ���ı��ִʺ���res�ļ���·��
	 * @throws IOException 
	 */
	public void pretreatmentTrain(String inputPath, String outputPath) throws IOException {
		
		// Automatically tag the files, form tag files
//		log.info(inputPath);
		Classifier classifier = new Classifier(inputPath, outputPath, Constant.TRAIN_FLAG);
		classifier.classify();
		
		// get words in the user dictionary
		UserDict userDict = new UserDict();
		HashSet<String> userDictList = userDict.getUserDict();
		String path = Constant.CPATH; // tag�ļ���Ŀ¼
	
		// ���ʳ�ȡ
		CSingleTermExtraction cste = new CSingleTermExtraction(path, userDictList);
		cste.createMap();
	    cste.extract();
//		System.out.println();
		
		// ˫�ʳ�ȡ
		CBigramExtraction cbe = new CBigramExtraction(userDictList, cste);
		cbe.createMaps();
		cbe.extract();
//		System.out.println();
		
		// ���ʳ�ȡ
		CTrigramExtraction cte = new CTrigramExtraction(userDictList, cste);
		cte.createMaps();
		cte.extract(); 
	}

}
