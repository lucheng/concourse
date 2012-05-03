package com.zly.test.newsfetch;


import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.htmlparser.Parser;
import org.htmlparser.Tag;
import org.htmlparser.filters.NodeClassFilter;
import org.htmlparser.tags.Div;
import org.htmlparser.tags.LinkTag;
import org.htmlparser.util.NodeList;
import org.htmlparser.visitors.NodeVisitor;

import com.zly.test.entity.NewsItem;
import com.zly.test.entity.NewsType;

public class GetNews {
	public static void main(String[] args) throws Exception {
		//插入数据新闻类型
		//insertAllTypes();
		
		//插入所有新闻数据
		
		//国内新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/gn/2009/05" ,"/news.shtml" ,1);
		//国际新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/gj/2009/05" ,"/news.shtml" ,2);
		//社会新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/sh/2009/05" ,"/news.shtml" ,3);
		//港澳新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/ga/2009/05" ,"/news.shtml" ,4);		
		//台湾新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/tw/2009/05" ,"/news.shtml" ,5);		
		//华人新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/hr/2009/05" ,"/news.shtml" ,6);		
		//经济新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/cj/2009/05" ,"/news.shtml" ,7);		
		//文化新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/wh/2009/05" ,"/news.shtml" ,8);		
		//娱乐新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/yl/2009/05" ,"/news.shtml" ,9);		
		//体育新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/ty/2009/05" ,"/news.shtml" ,10);		
		//教育新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/edu/2009/05" ,"/news.shtml" ,11);		
		//健康新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/jk/2009/05" ,"/news.shtml" ,12);		
		//生活新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/life/2009/05" ,"/news.shtml" ,13);		
		//IT新闻
		//insertNewsItems("http://www.chinanews.com.cn/scroll-news/it/2009/05" ,"/news.shtml" ,14);		
	}
	public static void insertAllTypes() {
		Configuration cfg = new AnnotationConfiguration().configure();
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		String str = new String("国内 国际 社会 港澳 台湾 华人 经济 文化 娱乐 体育 教育 健康 生活 IT");
		String[] typesStr = str.split(" ");
		NewsType[] types = new NewsType[typesStr.length];
		session.beginTransaction();
		for (int i = 0; i < typesStr.length; i++) {
			types[i] = new NewsType();
			types[i].setNewsTypeName(typesStr[i]);
			session.save(types[i]);
		}
		session.getTransaction().commit();
		session.close();
	}
	
	//处理5.1 - 5.5 所有的具体类型的新闻
	
	public static void insertNewsItems(String before , String after , int type) throws Exception {
		Configuration cfg = new AnnotationConfiguration().configure();
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		//得到当前新闻所属类别
		NewsType newsType = (NewsType) session.get(NewsType.class, type);
		final Set<NewsItem> set = new LinkedHashSet<NewsItem>();
		//获取5月1日-5月5日的新闻
		for (int i = 1; i <= 5; i++) {
			String src = before;
			if(i < 10) {
				src = src + "0" + i;
			}else {
				src = src + i ; 
			}
			src = src + after;
			//使用htmlParser获取每一条新闻的超链接
			Parser parser = new Parser(src);
			parser.setEncoding("gb2312");
			NodeList divList = parser.parse(new NodeClassFilter(Div.class));
			for (int j = 0; j < divList.size(); j++) {
				Div div = (Div) divList.elementAt(j);
				String divClass = div.getAttribute("id");
				//取得id为news_list的div
				if(divClass != null && divClass.equals("news_list")) {
					div.accept(new NodeVisitor() {
						//遍历news_list里面的所有超链接
						public void visitTag(Tag tag) {
							if(tag instanceof LinkTag) {
								String href = ((LinkTag)tag).getLink();
								if(!href.startsWith("http")) {
									href = "http://www.chinanews.com.cn" + href;
								}
								System.out.println(href);
								//找到超链接，将这个超链接所在的页面进行处理，抓取新闻数据，并将其保存在Set中。
								try{
									insertOneNews(href , set);
								}catch(Exception e) {
									e.printStackTrace();
								}
								
							}
						}
					});
				}
			}
		}
		//获取新闻完成后，将所有NewsItem添加到数据库
		session.beginTransaction();
		for (NewsItem newsItem : set) {
			newsItem.setType(newsType);
			session.save(newsItem);
		}
		session.getTransaction().commit();
		session.close();
	}
	//处理每一个具体的新闻超链接，得到NewsItem类
	public static void insertOneNews(String src , Set<NewsItem> set) throws Exception {
		Parser parser = new Parser(src);
		parser.setEncoding("gb2312");
		NodeList divList = parser.extractAllNodesThatMatch(new NodeClassFilter(Div.class));
		NewsItem newsItem = new NewsItem();
		String title = "";
		Date parse = null;
		String content = "";
		String editor = "";
		//遍历网页的div。将制定div里面的信息设置到NewsItem实体类中
		for (int i = 0; i < divList.size(); i++) {
			Div div = (Div) divList.elementAt(i);
			String divString = div.getAttribute("class");
			if(divString != null) {
				//设置标题
				if(divString.equals("left_bt")) {
					title = div.toPlainTextString();
				}
				//设置发布时间
				if(divString.equals("left_time")) {
					String publishStr = "";
					Pattern pattern = Pattern.compile("[\\d]{4}年[\\d]{2}月[\\d]{2}日 [\\d]{2}:[\\d]{2}");
					Matcher matcher = pattern.matcher(div.toPlainTextString()) ;
					if(matcher.find()) {
						publishStr = matcher.group();
					}
					DateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
					parse = format.parse(publishStr);
				}
				//设置正文内容
				if(divString.equals("left_zw")) {
					content = div.toHtml();
				}
				//设置记者名称
				if(divString.equals("left_name")) {
					editor = div.toPlainTextString().trim();
					editor = editor.substring(editor.indexOf(":") + 1, editor.lastIndexOf("】"));
				}
			}
			
		}
		newsItem.setEditor(editor);
		newsItem.setNewsContent(content);
		newsItem.setNewsTitle(title);
		newsItem.setPublishTime(parse);
		//设置新闻来源
		newsItem.setResource("最快新闻网");
		//将新闻添加到set中
		set.add(newsItem);
	}
}
