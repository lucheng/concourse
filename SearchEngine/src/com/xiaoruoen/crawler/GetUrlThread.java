package com.xiaoruoen.crawler;

import java.io.IOException;
import java.net.URL;

import org.apache.log4j.Logger;
import org.htmlparser.Node;
import org.htmlparser.lexer.Lexer;
import org.htmlparser.nodes.TagNode;
import org.htmlparser.util.ParserException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.xiaoruoen.common.CommonData;
/**
 * 链接搜集线程
 * @author xiaoruoen
 *
 */
public class GetUrlThread implements Runnable {
	
	Logger logger = Logger.getLogger(GetUrlThread.class);

	@Override
	public void run() {
		try {
			//当搜集到的链接未达到规定数量时，继续搜集
			while (CommonData.urlCollection.size() > 0 && CommonData.linkcount<CommonData.linkMAX) {
				retrieveLink(CommonData.urlCollection.get(0).toString());
			}
		} catch (Exception e) {
			CommonData.urlCollection.remove(0);
			run();
		}
	}

	/**
	 * 搜集网页上的链接
	 * 
	 * @param pageurl
	 * @throws ParserException
	 * @throws IOException
	 */
	
	public void retrieveLink(String url) throws IOException {
		
		Document doc = Jsoup.connect(url)
						.userAgent("Mozilla/5.0 (Windows NT 6.1; rv:5.0)")
						.cookie("auth", "token").timeout(1000).get();
		Elements links = doc.select("a[href]");
		URL pageurl = new URL(url);
		
		for (Element element : links) {
			String link = element.attr("href");
			if (link != null && !"".equals(link)) {
				//遇到空地址解析下一个
				if (link.length() < 1) {
					continue;
				}
				//遇到#地址解析下一个
				if (link.charAt(0) == '#') {
					continue;
				}
				//遇到邮件地址解析下一个
				if (link.indexOf("mailto:") != -1) {
					continue;
				}
				//遇到js方法解析下一个
				if (link.toLowerCase().indexOf("javascript") != -1) {
					continue;
				}
				// 处理相对路径,地址中没有://就说明为相对路戏
				if (link.indexOf("://") == -1) {
					if (link.charAt(0) == '/') {
						link = "http://" + pageurl.getHost() + link;
					} else {
						String file = pageurl.getFile();
						if (file.indexOf("/") == -1) {
							link = "http://" + pageurl.getHost() + "/"
									+ link;
						} else {
							String path = link.substring(0, link
									.lastIndexOf("/") + 1);
							link = "http://" + pageurl.getHost() + path
									+ link;
						}
					}
				}
	
				int index = link.indexOf("#");
				if (index != -1) {
					link = link.substring(0, index).toLowerCase();
				}
				
				//碰到包含有item.taobao iteye.com/blog的地址，记录下来待搜集商品数据
				if (link.contains("iteye.com/blog")) {
	//			if (link.contains("item.taobao")) {
					
					if (!CommonData.urlInfo.contains(link)
							&& !CommonData.urlInfoed.contains(link)) {
						logger.info("找到记录:" + link);
						CommonData.urlInfo.add(link);
					}
				}
				//将搜索到的信息放到内存中
				if (!CommonData.urlCollection.contains(link)
						&& !CommonData.urlVisited.contains(link)) {
					CommonData.urlCollection.add(link);
					CommonData.linkcount++;//记录已经搜集到了多少链接
//					logger.info("搜集到" + CommonData.linkcount + "link:" + link);
				}

			}
		}
		CommonData.urlVisited.add(url);
		CommonData.urlCollection.remove(url);
	}

}
