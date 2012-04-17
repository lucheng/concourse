package com.buptsse.ate.topicmain;

import java.io.IOException;
import java.util.Map;


/**
 * 主题词抽取
 * 
 * @author shicunyu
 * 
 */

public class TextClassification {

	public static void main(String[] args) throws IOException {

		// 对训练文本进行分词处理，生成res文件
		String inputTrainPath = "input/input";   // 训练文本的输入路径
		String outputTrainPath = "input/output";  // 训练文本的输出路径
		ATE ate = new ATE();
		ate.pretreatmentTrain(inputTrainPath, outputTrainPath); // 分词
		Map<String, Integer> fq = ate.getFqMap();
		
		int[] array = new int[fq.size()];
		int pos = 0;
		for(String key : fq.keySet()){
			array[pos] = fq.get(key);
			pos++;
		}
		HeapSort hsort = new HeapSort();
		hsort.HeapSorting(array);
		
		for(String key : fq.keySet()){
			if(fq.get(key) > array[8]){
				System.out.println(key);
			}
		}
//		System.out.println(array);
	}

}
