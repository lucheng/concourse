package com.buptsse.ate.topicmain;

import java.io.IOException;


/**
 * ����ʳ�ȡ
 * 
 * @author shicunyu
 * 
 */
public class TextClassification {

	public static void main(String[] args) throws IOException {

		// ��ѵ���ı����зִʴ�������res�ļ�
		String inputTrainPath = "input/input";   // ѵ���ı�������·��
		String outputTrainPath = "input/output";  // ѵ���ı������·��
		ATE ate = new ATE();
		ate.pretreatmentTrain(inputTrainPath, outputTrainPath); // �ִ�
	}

}
