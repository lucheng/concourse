package com.buptsse.ate.timeExpression;



/**
 * 时间表达式识别实例
 * @author linzhe
 *
 */
public class TimeExpressionRecognition {
	public static void main(String[] args){
		String target = "08年北京申办奥运会，8月8号开幕式，九月十八号闭幕式。" +
				"1年后的7月21号发生了件大事。" +
				"今天我本想去世博会，但是人太多了，直到晚上9点人还是那么多。" +
				"考虑到明天和后天人还是那么多，决定下周日再去。";
		target = "反复头晕9年余，加重1月";
		TimeNormalizer normalizer = new TimeNormalizer("./models/TimeExp.gz");
		normalizer.parse(target);
		TimeUnit[] unit = normalizer.getTimeUnit();
		System.out.println();
		for(int i = 0; i < unit.length; i++){
			System.out.println(unit[i]);
		}
	}
}
