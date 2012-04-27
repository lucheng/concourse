package edu.bupt.example;


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
		String str = "对于Google的Android系统来说，最近可谓是新闻不断，不过都是坏新闻。据福布斯报道，在美国3大运营商中，苹果iPhone的销售量已经占据了59%的份额，而去年这个数字只有36%。同样，根据Comscore最新数据显示，在Google自己的Android平台下，Amazon的Kindle Fire已经占据美国Android平板电脑的54.4%，显示Google似乎正在失去对Android的控制权。在苹果公布的季度财报中，iPhone第二季度统计出货量为3500万台，iPad出货量为1200万台，Mac出货量仅为400万台。iPhone是苹果收入最大的贡献者，占到总收入的58%。iPhone占据了美国3大运营商智能手机的59%的份额，比去年的36%整整增加了23个百分点。而随着下一代iPhone推出市场日前的不断临近，这个数字可能会继续飙升。";
		HashMap<String, String> s = tag.tag(str);
		System.out.println(s);
	}
}
