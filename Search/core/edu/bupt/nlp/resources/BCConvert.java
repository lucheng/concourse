package edu.bupt.nlp.resources;
/**
 * <PRE>
 * 提供对字符串的全角-&gt;半角，半角-&gt;全角转换
 * </PRE>
 */
public class BCConvert {
	/**
	 * ASCII表中可见字符从!开始，偏移位值为33(Decimal)
	 */
	static final char DBC_CHAR_START = 33; // 半角!

	/**
	 * ASCII表中可见字符到~结束，偏移位值为126(Decimal)
	 */
	static final char DBC_CHAR_END = 126; // 半角~

	/**
	 * 全角对应于ASCII表的可见字符从！开始，偏移值为65281
	 */
	static final char SBC_CHAR_START = 65281; // 全角！

	/**
	 * 全角对应于ASCII表的可见字符到～结束，偏移值为65374
	 */
	static final char SBC_CHAR_END = 65374; // 全角～

	/**
	 * ASCII表中除空格外的可见字符与对应的全角字符的相对偏移
	 */
	static final int CONVERT_STEP = 65248; // 全角半角转换间隔

	/**
	 * 全角空格的值，它没有遵从与ASCII的相对偏移，必须单独处理
	 */
	static final char SBC_SPACE = 12288; // 全角空格 12288

	/**
	 * 半角空格的值，在ASCII中为32(Decimal)
	 */
	static final char DBC_SPACE = ' '; // 半角空格

	/**
	 * <PRE>
	 * 半角字符->全角字符转换  
	 * 只处理空格，!到&tilde;之间的字符，忽略其他
	 * </PRE>
	 */
	public static String bj2qj(String src) {
		if (src == null) {
			return src;
		}
		StringBuilder buf = new StringBuilder(src.length());
		char[] ca = src.toCharArray();
		for (int i = 0; i < ca.length; i++) {
			if (ca[i] == DBC_SPACE) { // 如果是半角空格，直接用全角空格替代
				buf.append(SBC_SPACE);
			} else if ((ca[i] >= DBC_CHAR_START) && (ca[i] <= DBC_CHAR_END)) { // 字符是!到~之间的可见字符
				buf.append((char) (ca[i] + CONVERT_STEP));
			} else { // 不对空格以及ascii表中其他可见字符之外的字符做任何处理
				buf.append(ca[i]);
			}
		}
		return buf.toString();
	}

	/**
	 * <PRE>
	 * 全角字符->半角字符转换  
	 * 只处理全角的空格，全角！到全角～之间的字符，忽略其他
	 * </PRE>
	 */
	public static String qj2bj(String src) {
		if (src == null) {
			return src;
		}
		StringBuilder buf = new StringBuilder(src.length());
		char[] ca = src.toCharArray();
		for (int i = 0; i < src.length(); i++) {
			if (ca[i] >= SBC_CHAR_START && ca[i] <= SBC_CHAR_END) { // 如果位于全角！到全角～区间内
				buf.append((char) (ca[i] - CONVERT_STEP));
			} else if (ca[i] == SBC_SPACE) { // 如果是全角空格
				buf.append(DBC_SPACE);
			} else { // 不处理全角空格，全角！到全角～区间外的字符
				buf.append(ca[i]);
			}
		}
		return buf.toString();
	}
	
	public static void main(String[] args){
		String str = "北京时间５月２０日，据国外媒体报道，独立投资公司Ｚａｃｋｓ分析师保罗·姜（Ｐａｕｌ　Ｃｈｅｕｎｇ）重申其对空中网（Ｎａｓｄａｑ：ＫＯＮＧ）的股票评级为“持有”，并将空中网的目标股价设定为５美元。Ｚａｃｋｓ在报告中指出，空中网表示，由于２００８年第一季度开支增加，空中网净利润将会下滑。同时，尽管空中网的营收达到了分析师预期，但其每股收益却未能达到预期。在过去三个季度，空中网的营收均实现季度增长。鉴于中国无线增值服务市场的运营环境严峻，Ｚａｃｋｓ对于空中网的短期发展前景并不乐观。不过，由于空中网拥有充足的现金储备，所以有能力在未来寻找其它的营收增长来源。同时，空中网股票较低的市盈率可以为其股价提供一定的支持。基于上述原因，Ｚａｃｋｓ重申其对空中网股票的评级为“持有”。空中网当前股价相当于Ｚａｃｋｓ对空中网２００８年每股收益的预期的２５．５倍，略低于行业平均水平。同时，空中网当前股价相当于Ｚａｃｋｓ对空中网２００９年每股收益的预期的１７．７倍，这一数字远低于行业平均水平。Ｚａｃｋｓ认为，按照动态市盈率为１９．２倍、２００８财年每股收益预期为０．２６美元计算，空中网的目标股价应为５美元。";
		String result = BCConvert.qj2bj(str);
		System.out.println(result);
	}
}

