package com.buptsse.ate.extractor;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.buptsse.ate.crawler.ItemParser;
import com.buptsse.ate.crawler.Relation;
import com.buptsse.ate.crawler.Tag;
import com.buptsse.ate.utils.FileHelp;

public class Tech2ipoCrawler extends ItemParser {
	
	private static Logger logger = Logger.getLogger(Tech2ipoCrawler.class);
	
	public Tech2ipoCrawler(String url) {
		super(url);
		
	}

	public Tech2ipoCrawler(File file) {
		super(file);
	}
	
	public Tech2ipoCrawler() {
		
	}
	
	public void setFile(File file){
		
		try {
			this.doc = Jsoup.parse(file, "UTF-8");
			this.getNewsItem().setUrl(file.getAbsolutePath());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void fetch() {

		Elements main = doc.select("div#content"); //>div.articleContent
		
		String author = main.select("a[rel=author]").text();
		
		String blog_title = main.select("h3.articleTitle>a").text();
		
		String blog_keyword = doc.select("head>meta[name=keywords]").attr("content");
		String blog_description = doc.select("head>meta[name=description]").attr("content");
		
		String published = main.select("p.googleMore").text().trim();
		
		if(published.lastIndexOf("发布于") > 0){
			published = published.substring(published.lastIndexOf("发布于")+3);
		}
//		2012年04月24日上午8:45
		
		/*String publishStr = "";
		Pattern pattern1 = Pattern.compile("[\\d]{4}年[\\d]{2}月[\\d]{2}日上午 [\\d]{1,2}:[\\d]{2}");
		Matcher matcher = pattern1.matcher(published) ;
		if(matcher.find()) {
			publishStr = matcher.group();
		}
		DateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
		try {
			Date date = format.parse(publishStr);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}*/
		
		Elements blog_content = main.select("div[class=articleDetail clearfix]");
		blog_content.select("div[style^=background]").remove();
		String content = "";
		if(blog_content.text().lastIndexOf("本文由Tech2IPO") > 0){
			content = blog_content.text().trim().substring(0, blog_content.text().lastIndexOf("本文由Tech2IPO"));
		}else {
			content = blog_content.text().trim();
		}
		
		Elements blog_tag = main.select("p.articleInfo>a[rel=tag]");
		List<Tag> tagList = new ArrayList<Tag>();
		for(Element element : blog_tag){
			tagList.add(new Tag(element.attr("href"),element.text()));
		}
		
		Elements blog_relation = main.select("a[rel=bookmark]");
		List<Relation> relationList = new ArrayList<Relation>();
		for(Element element : blog_relation){
			relationList.add(new Relation(element.attr("href"),element.text()));
		}
	
		this.getNewsItem().setTitle(blog_title);
		this.getNewsItem().setKeyword(blog_keyword);
		this.getNewsItem().setDescription(blog_description);
		this.getNewsItem().setAuthor(author);
		this.getNewsItem().setPublished(published);
		this.getNewsItem().setSummary(content);
		this.getNewsItem().setTagList(tagList);
		this.getNewsItem().setRelationList(relationList);
	}
	
	public static void main(String[] args){
		
		String filePath = "D:/data/sites/tech2ipo.com";
		List<String> filelist = new ArrayList<String>();
		FileHelp.refreshFileList(filePath, filelist, ".html");
		
		Tech2ipoCrawler crawler = new Tech2ipoCrawler();
		for(String fileName : filelist){
			try{
				crawler.setFile(new File(fileName));
				crawler.fetch();
				crawler.getNewsItem().setSource("Tech2IPO");
				String name = fileName.substring(fileName.lastIndexOf("tech2ipo.com")+13, fileName.lastIndexOf("index.html")-1);
	//			logger.info("D:/data/sites/tech2ipo.com=" + name);
	//			logger.info(fileName);
				crawler.saveFile("D:/data/xml/tech2ipo.com/" + name.replace("\\", "-") + ".xml", true);
	//			break;
			}catch(Exception e){
				continue;
			}
		}
		
	}
	
}
