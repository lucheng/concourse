package com.buptsse.controlTest;

import com.mywie.control.Generater;


public class Test {
	public static void main(String[] args) throws Exception {

		/**
		 * 生成模板文件
		 */
		Generater generater = new Generater("C:/Users/Administrator/Desktop/data/template/1.html");
		generater.generateTemplates("C:/Users/Administrator/Desktop/data");
		/**
		 * 抽取数据
		 */
//		String fileName = "";
//		String template = "template3-1.htm";
//		String markedFileName = "template3-1.htm";
//		
//		Extracter extractTest = new Extracter(template);
//		extractTest.extract(fileName, markedFileName);
	}
}