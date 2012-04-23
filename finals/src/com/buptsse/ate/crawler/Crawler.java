package com.buptsse.ate.crawler;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.jsoup.Jsoup;

import com.buptsse.ate.extractor.KrCrawler;

public abstract class Crawler {

	protected org.jsoup.nodes.Document doc;
	
	protected String url;
	protected String author;
	protected String published;
	protected String title;
	protected long updateTime;
	protected String summary;
	protected List<Tag> tagList = new ArrayList<Tag>();
	
	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPublished() {
		return published;
	}

	public void setPublished(String published) {
		this.published = published;
	}
	
	
	public List<Tag> getTagList() {
		return tagList;
	}

	public void setTagList(List<Tag> tagList) {
		this.tagList = tagList;
	}
	protected class Tag {
		public Tag(String link, String tag) {
			this.link = link;
			this.tag = tag;
		}
		public String getTag() {
			return tag;
		}
		public void setTag(String tag) {
			this.tag = tag;
		}
		protected String tag;
		protected String link;
		public String getLink() {
			return link;
		}
		public void setLink(String link) {
			this.link = link;
		}
		
	}
	
	public Crawler(String url) {
		try {
			this.doc = Jsoup.connect(url)
					.userAgent("Mozilla/5.0 (Windows NT 6.1; rv:5.0)")
					.cookie("auth", "token").timeout(1000).get();
			this.url = url;
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public abstract void fetch();
	
	public void saveFile(String filePath){
		
		if(this.getTitle().equals("")){
			System.out.println("网页不存在！");
			return;
		}
		XMLWriter out;
		OutputFormat outputFormat = OutputFormat.createPrettyPrint();
		outputFormat.setEncoding("UTF-8");
		
		try {
			out = new XMLWriter(new FileWriter(filePath), outputFormat);
			out.startDocument();
			
			Element rootElement = DocumentHelper.createElement("datas");
			Element titleElement = rootElement.addElement("title");
			Element authorElement = rootElement.addElement("author");
			Element urlElement = rootElement.addElement("url");
			Element updateTimeElement = rootElement.addElement("updateTime");
			Element summaryElement = rootElement.addElement("summary");
			Element tagsElement = rootElement.addElement("tags");
			
			titleElement.addText(this.getTitle());
			authorElement.addText(this.getAuthor()+"");
			urlElement.addText(this.getUrl());
			updateTimeElement.addText(System.currentTimeMillis()+"");
			summaryElement.addCDATA(this.getSummary());
			
			for(Tag tag : this.getTagList()){
				Element tagElement = tagsElement.addElement("tag");
				tagElement.addText(tag.getTag());
				tagElement.addAttribute("url", tag.getLink());
			}
			out.writeOpen(rootElement);
			out.write(titleElement);
			out.write(authorElement);
			out.write(updateTimeElement);
			out.write(urlElement);
			out.write(summaryElement);
			out.write(tagsElement);
			
			out.writeClose(rootElement);
			out.endDocument();
			out.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
//	http://www.google.com/reader/atom/feed/
//	http://www.36kr.com/feed
//	http://robbin.iteye.com/rss
//	http://www.cyzone.cn/rss
//	?n=200
	public void login(){
		
		/*HttpClient httpclient = new HttpClient(); 
		//httpclient.getParams().setParameter(HTTP.CONTENT_ENCODING, "UTF-8");
		String url="http://www.kanmenzhu.com/user/login.php";
		HttpPost client=new HttpPost(url);
		List<NameValuePair> nvList=new ArrayList<NameValuePair>(2);
		nvList.add(new BasicNameValuePair("user","u"));
		nvList.add(new BasicNameValuePair("password","p"));
		
		client.setEntity(new UrlEncodedFormEntity(nvList, "UTF-8"));
		logger.info("尝试登录"+host);
		HttpResponse response=httpclient.execute(client);
		if(response.getStatusLine().getStatusCode() == HttpStatus.SC_OK){
			HttpEntity entity = response.getEntity();
			EntityUtils.consume(entity);
			logger.info("成功登录"+host);
			//String res=EntityUtils.toString(entity);
			//logger.info(res);
		}else{
			logger.warn("登录失败");
			System.exit(0);
		}*/
	}
	public org.jsoup.nodes.Document getDoc() {
		return doc;
	}

	public void setDoc(org.jsoup.nodes.Document doc) {
		this.doc = doc;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	public static void main(String[] args){
		
		
		String url = "http://www.36kr.com/p/97503.html";
		Crawler crawler2 = new KrCrawler(url);
		crawler2.fetch();
		crawler2.saveFile("1490510.xml");
		
	}
}
