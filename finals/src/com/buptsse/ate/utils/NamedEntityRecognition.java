package com.buptsse.ate.utils;


import java.util.HashMap;

import edu.fudan.nlp.tag.NERTagger;

/**
 * 实体名识别使用示例
 * @author xpqiu
 *
 */
public class NamedEntityRecognition {	


	/**
	 * @param args
	 * @throws IOException 
	 * @throws  
	 */
	public static void main(String[] args) throws Exception {
		
		NERTagger tag = new NERTagger("./models/ner.p111014.gz");
		
//		String str = FileHelp.readText("d:/workspace/finals/text_example/100059.txt");
		String str = "雅虎公司本周三在股权代理声明中披露了杨致远和其他雅虎高级官员的薪酬状况。雅虎共同创始人杨致远在2008年担任雅虎首席执行官的最后一年的薪酬是1美元。"+
	"在杨致远今年1月辞去雅虎首席执行官的职位的时候，雅虎总裁Susan Decker也离开了雅虎。雅虎首席财务官Blake Jorgensen也计划在新任首席执行官巴茨找到他的继任人之后离开雅虎。"+
	"在巴茨执行她的裁员700人(占雅虎员工总数的大约5%)的计划的同时，未来几个星期还会有更多的员工离开雅虎。"+
	"40岁的杨致远多年以来一直领取象征性的薪水，因为自从他和斯坦福大学研究生同学David Filo在1994年创建雅虎公司以来，杨致远一直靠雅虎股票获得收入。"+
	"但是，同他的股东一样，杨致远的雅虎股票的账面价值去年减少了一半。截止到2008年年底，雅虎股票价格下跌使杨致远拥有的3.9%的雅虎股票价值下降到了大约6亿美元。"+
  	"除了1美元的薪水之外，雅虎去年没有支付杨致远任何报酬。苹果首席执行官史蒂夫・乔布斯和谷歌共同创始人Larry Page和Sergey Brin去年的薪酬也是1美元。";
		HashMap<String, String> s = tag.tag(str);
		System.out.println(s);
	}
}
