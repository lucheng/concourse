package com.xiaoruoen.info;

import java.io.IOException;
import java.net.URL;
import java.util.HashMap;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.htmlparser.Node;
import org.htmlparser.lexer.Lexer;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.util.ParserException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import com.xiaoruoen.common.CommonData;
import com.xiaoruoen.common.FileOut;

/**
 * 提取信息
 * 
 * @author xiaoruoen
 * 
 */
public class GetInfo extends TimerTask {

	Logger logger = Logger.getLogger(GetInfo.class);

	public GetInfo() {
		CommonData.contents = new HashMap();
	}

	@Override
	public void run() {
		while (CommonData.urlInfo.size() > 0) {
			String url = CommonData.urlInfo.get(0).toString();
			try {
				retrieveInfo(url);
			} catch (Exception e) {
				CommonData.urlInfo.remove(0);
				CommonData.urlInfoed.add(url);
			}
		}
	}

	/**
	 * 提取信息
	 * 
	 * @param url
	 * @return
	 * @throws ParserException
	 */
	private void retrieveInfo(String url) throws ParserException,
			IllegalArgumentException, IOException {
	
		Document doc = Jsoup.connect(url)
				.userAgent("Mozilla/5.0 (Windows NT 6.1; rv:5.0)")
				.cookie("auth", "token").timeout(1000).get();
		String text = doc.select("div#blog_content").text();
		if (text != null && !"".equals(text)) {
			String content = "url:" + url + "\r\n" + "data:"
					+ text
					+ "\r\n";
			FileOut.instance().write(content);
		}
		CommonData.urlInfoed.add(url);// 添加到已经提取过的集合中
		CommonData.urlInfo.remove(url);// 从原集合中移去
	}

}
