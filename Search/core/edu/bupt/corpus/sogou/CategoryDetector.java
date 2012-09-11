package edu.bupt.corpus.sogou;

public final class CategoryDetector {

	private static String category = null;

	public static String detectCategory(String url) {
		// xinhuanet.
		if (url.startsWith("http://www.xinhuanet.com/auto/")) {
			category = "car";
		} else if (url.startsWith("http://www.xinhuanet.com/fortune")) {
			category = "finance";
		} else if (url.startsWith("http://www.xinhuanet.com/internet/")) {
			category = "IT";
		} else if (url.startsWith("http://www.xinhuanet.com/health/")) {
			category = "health";
		} else if (url.startsWith("http://www.xinhuanet.com/sports")) {
			category = "sports";
		} else if (url.startsWith("http://www.xinhuanet.com/travel")) {
			category = "travel";
		} else if (url.startsWith("http://www.xinhuanet.com/edu")) {
			category = "education";
		} else if (url.startsWith("http://www.xinhuanet.com/employment")) {
			category = "employment";
		} else if (url.startsWith("http://www.xinhuanet.com/life")) {
			category = "culture";
		} else if (url.startsWith("http://www.xinhuanet.com/mil")) {
			category = "military";
		} else if (url.startsWith("http://www.xinhuanet.com/olympics/")) {
			category = "olympics";
		} else if (url.startsWith("http://www.xinhuanet.com/society")
				|| url.startsWith("http://www.xinhuanet.com/local/")
				|| url.startsWith("http://www.xinhuanet.com/world")) {
			category = "society";
		} else if (url.startsWith("http://www.xinhuanet.com/house")) {
			category = "house";
		} else if (url.startsWith("http://www.xinhuanet.com/ent")) {
			category = "ent";
		} else if (url.startsWith("http://www.xinhuanet.com/lady")) {
			category = "lady";
		} else if (url.startsWith("http://www.xinhuanet.com/school")) {
			category = "school";
		}
		// china
		if (url.startsWith("http://auto.china.com/")) {
			category = "car";
		} else if (url.startsWith("http://caifu.china.com/")) {
			category = "finance";
		} else if (url.startsWith("http://tech.china.com/zh_cn/news/net/")) {
			category = "IT";
		} else if (url.startsWith("http://health.china.com/")) {
			category = "health";
		} else if (url.startsWith("http://sports.china.com/")) {
			category = "sports";
		} else if (url.startsWith("http://goo66.china.com/")) {
			category = "travel";
		} else if (url.startsWith("http://edu.533.com/")) {
			category = "education";
		} else if (url.startsWith("http://culture.china.com/")) {
			category = "culture";
		} else if (url.startsWith("http://military.china.com/")) {
			category = "military";
		} else if (url.startsWith("http://2008.china.com/")) {
			category = "olympics";
		} else if (url.startsWith("http://news.china.com/zh_cn/social/")
				|| url.startsWith("http://news.china.com/zh_cn/domestic/")
				|| url.startsWith("http://news.china.com/zh_cn/international/")) {
			category = "society";
		} else if (url.startsWith("http://china.soufun.com/")) {
			category = "house";
		} else if (url.startsWith("http://fun.china.com/zh_cn/star/")) {
			category = "ent";
		} else if (url.startsWith("http://meirong.533.com/")) {
			category = "lady";
		} else if (url.startsWith("http://edu.533.com/news/xiaoyuan/")) {
			category = "school";
		}
		// sina.com.cn
		if (url.startsWith("http://auto.sina.com.cn/")) {
			category = "car";
		} else if (url.startsWith("http://finance.sina.com.cn/")) {
			category = "finance";
		} else if (url.startsWith("http://tech.sina.com.cn/it/")) {
			category = "IT";
		} else if (url.startsWith("http://sina.kangq.com/")) {
			category = "health";
		} else if (url.startsWith("http://sports.sina.com.cn/")) {
			category = "sports";
		} else if (url.startsWith("http://tour.sina.com.cn/")) {
			category = "travel";
		} else if (url.startsWith("http://edu.sina.com.cn/j/")) {
			// employment和education不能互换.
			category = "employment";
		} else if (url.startsWith("http://edu.sina.com.cn/")) {
			category = "education";
		} else if (url.startsWith("http://cul.book.sina.com.cn/")) {
			category = "culture";
		} else if (url.startsWith("http://mil.news.sina.com.cn/")) {
			category = "military";
		} else if (url.startsWith("http://2008.sina.com.cn/")) {
			category = "olympics";
		} else if (url.startsWith("http://news.sina.com.cn/society/")
				|| url.startsWith("http://news.sina.com.cn/china/")
				|| url.startsWith("http://news.sina.com.cn/world/")) {
			category = "society";
		} else if (url.startsWith("http://house.sina.com.cn/")) {
			category = "house";
		} else if (url.startsWith("http://ent.sina.com.cn/")) {
			category = "ent";
		} else if (url.startsWith("http://eladies.sina.com.cn/")) {
			category = "lady";
		} else if (url.startsWith("http://edu.sina.com.cn/y/")) {
			category = "school";
		}
		// 163.com
		if (url.startsWith("http://auto.163.com/")) {
			category = "car";
		} else if (url.startsWith("http://money.163.com/")) {
			category = "finance";
		} else if (url.startsWith("http://tech.163.com/it/")) {
			category = "IT";
		} else if (url.startsWith("http://163.39.net/")) {
			category = "health";
		} else if (url.startsWith("http://sports.163.com/")) {
			category = "sports";
		} else if (url.startsWith("http://war.163.com/")) {
			category = "military";
		} else if (url.startsWith("http://2008.163.com/")) {
			category = "olympics";
		} else if (url.startsWith("http://news.163.com/shehui/")
				|| url.startsWith("http://news.163.com/domestic/")
				|| url.startsWith("http://news.163.com/world/")) {
			category = "society";
		} else if (url.startsWith("http://house.163.com/")) {
			category = "house";
		} else if (url.startsWith("http://ent.163.com/")) {
			category = "ent";
		} else if (url.startsWith("http://lady.163.com/")) {
			category = "lady";
		}
		// qq.com
		if (url.startsWith("http://auto.qq.com/")) {
			category = "car";
		} else if (url.startsWith("http://finance.qq.com/")) {
			category = "finance";
		} else if (url.startsWith("http://tech.qq.com/a/")) {
			category = "IT";
		} else if (url.startsWith("http://sports.qq.com/")) {
			category = "sports";
		} else if (url.startsWith("http://edu.qq.com/job/")) {
			// employment和education不能互换.
			category = "employment";
		} else if (url.startsWith("http://edu.qq.com/")) {
			category = "education";
		} else if (url.startsWith("http://cul.qq.com/")) {
			category = "culture";
		} else if (url.startsWith("http://mil.qq.com/")) {
			category = "military";
		} else if (url.startsWith("http://news.qq.com/a/")) {
			category = "society";
		} else if (url.startsWith("http://2008.qq.com/")) {
			category = "olympics";
		} else if (url.startsWith("http://house.qq.com/")) {
			category = "house";
		} else if (url.startsWith("http://ent.qq.com/")) {
			category = "ent";
		} else if (url.startsWith("http://lady.qq.com/")) {
			category = "lady";
		} else if (url.startsWith("http://campus.qq.com/")) {
			category = "school";
		}
		// sohu.com
		if (url.startsWith("http://auto.sohu.com/")) {
			category = "car";
		} else if (url.startsWith("http://business.sohu.com/")) {
			category = "finance";
		} else if (url.startsWith("http://it.sohu.com/")) {
			category = "IT";
		} else if (url.startsWith("http://health.sohu.com/")) {
			category = "health";
		} else if (url.startsWith("http://sports.sohu.com/")) {
			category = "sports";
		} else if (url.startsWith("http://travel.sohu.com/")) {
			category = "travel";
		} else if (url.startsWith("http://learning.sohu.com/")) {
			category = "education";
		} else if (url.startsWith("http://career.sohu.com/")) {
			category = "employment";
		} else if (url.startsWith("http://cul.sohu.com/")) {
			category = "culture";
		} else if (url.startsWith("http://news.sohu.com/")) {
			category = "society";
		} else if (url.startsWith("http://mil.news.sohu.com/")) {
			category = "military";
		} else if (url.startsWith("http://2008.sohu.com/")) {
			category = "olympics";
		} else if (url.startsWith("http://house.sohu.com/")) {
			category = "house";
		} else if (url.startsWith("http://yule.sohu.com/")) {
			category = "ent";
		} else if (url.startsWith("http://women.sohu.com/")) {
			category = "lady";
		}
		return category;
	}

	public static void main(String args[]) {
		category = CategoryDetector.detectCategory("http://edu.sina.com.cn/");
		System.out.println(category);
	}
}