package com.buptsse.ate.topicmain;

import java.io.*;
import java.util.StringTokenizer;

import libsvm.*;

/*
 * 作者：曹浩
 * 功能：在Java语言中调用SVM模型对特征文件进行分类。
 */
public class TestLibsvm {
	private static double atof(String s) {
		return Double.valueOf(s).doubleValue();
	}

	private static int atoi(String s) {
		return Integer.parseInt(s);
	}

	public static void main(String[] args) {

		try {

			// 载入模型文件
			svm_model model = svm.svm_load_model("input/libsvm/svmguide3.txt");
			// 读入待预测文件
			BufferedReader input = new BufferedReader(new InputStreamReader(
					new FileInputStream(new File("D://testData.abs.chinese"))));

			while (true) {
				String line = input.readLine();
				if (line == null)
					break;

				StringTokenizer st = new StringTokenizer(line, " /t/n/r/f:");

				double target = atof(st.nextToken());
				int m = st.countTokens() / 2;
				svm_node[] x = new svm_node[m];
				for (int j = 0; j < m; j++) {
					x[j] = new svm_node();
					x[j].index = atoi(st.nextToken());
					x[j].value = atof(st.nextToken());
				}
				double predict_value[] = new double[m];
				// 输出使用载入的模型预测的标签
				System.out.println(svm.svm_predict(model, x));

			}

		} catch (Exception exp) {
			exp.printStackTrace();
		}
	}
}