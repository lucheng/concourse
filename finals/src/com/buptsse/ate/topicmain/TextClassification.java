package com.buptsse.ate.topicmain;

import java.io.IOException;


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
	}

}
