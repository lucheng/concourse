package com.buptsse.baike.module;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.buptsse.baike.utils.FileHelp;
import com.buptsse.baike.utils.Parser;

public class Page {

	private boolean flag;
	private String title;
	private String word;
	private String baibeId;
//	private String html;
	private String url;
	private List<Content> contents = new ArrayList<Content>();
	private List<Reinforce> reinforces = new ArrayList<Reinforce>();
	
	private Document doc;

	public Page(File file) {
		try {
			this.doc = Jsoup.parse(file, "UTF-8");
			String fileName = file.getName();
			System.out.println(fileName);
			this.baibeId = fileName.substring(0, fileName.lastIndexOf("."));
			formByXml();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public Page() {

	}

	private void formByXml() {

		Elements codes = doc.body().select("body");

		// 标题
		Elements word = codes.select("input[class=s_ipt]");
		this.title = word.attr("value");

		Elements title = codes.select("h1[class=title]");
		this.word = title.text();
		// 源码
//		Elements htmlElement = codes.select("div[class=content-bd main-body]");
//		this.setHtml(htmlElement.html());

		int contentSize = codes.select("div[id^=sec-content]").size();
		for (int i = 0; i < contentSize; i++) {

			Content content = new Content();

			// 副标题
			String subTitle = codes.select("div[id=sec-header" + i + "]").text();
			content.setSubTitle(subTitle);

			// 摘要
			String summary = codes.select("div[id=sec-content" + i + "]>div>div>div[class=card-summary-content]").text();
			content.setSummary(summary);

			//属性值
			Elements attrs = codes.select("div[id=sec-content" + i + "]>div.mod-top>div.card-info>div.card-info-inner");
			
			Elements attrName = attrs.select("td.cardFirstTd");
			Elements attrValue = attrs.select("td.cardSecondTd");
			
			Map<String, String> attributes = new HashMap<String, String>();
			
			for(int j = 0; j < attrName.size(); j++){
				attributes.put(attrName.get(j).text().replace("：", "").trim(), attrValue.get(j).text());
			}
			content.setAttributes(attributes);
			if(attributes.size() > 0){
				this.flag = true;
			}
			
			// 内容
			Elements textElement = codes.select("div[id=sec-content" + i + "]");
			content.setText(textElement.text());

			// 内容链接
			Elements links = textElement.select("a[href]");
			// System.out.println(links.size());
			List<Link> linkList = new ArrayList<Link>();
			for (int j = 0; j < links.size(); j++) {
				String url = links.get(j).select("a[href]").attr("href");
				if(url.startsWith("/view/")){
					String id = url.substring(url.lastIndexOf("/")+1, url.lastIndexOf(".htm"));
					Link link = new Link(j, id, links.get(j).text());
					linkList.add(link);
				}
			}
			content.setLinks(linkList);
			// 开放分类
			List<String> taglist = new ArrayList<String>();
			Elements tags = textElement.select("dl[id=viewExtCati]>dd>a");
			for (Element element : tags) {
				taglist.add(element.text());
			}
			content.setTaglist(taglist);
			contents.add(content);
		}
		// 相关词条
		Elements reinforceElements = codes.select("dd[class=relative]").select("a[href]");

		for (int i = 0; i < reinforceElements.size(); i++) {
			String url = reinforceElements.get(i).attr("href");
			if(!url.contains("#")){
				String id = url.substring(url.lastIndexOf("/")+1, url.lastIndexOf(".htm"));
				Reinforce reinforce = new Reinforce(i, Integer.parseInt(id), reinforceElements.get(i).text());
				this.reinforces.add(reinforce);
			}
		}
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public List<Content> getContents() {
		return contents;
	}

	public void setContents(List<Content> contents) {
		this.contents = contents;
	}

	/*public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}*/

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getBaibeId() {
		return baibeId;
	}

	public void setBaibeId(String baibeId) {
		this.baibeId = baibeId;
	}

	public List<Reinforce> getReinforces() {
		return reinforces;
	}

	public void setReinforces(List<Reinforce> reinforces) {
		this.reinforces = reinforces;
	}
	
	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public boolean isFlag() {
		return flag;
	}

	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	public static void main(String[] args){
		
		for(int i = 37758; i < 200000; i ++){
			try{
				File file = new File("\\\\buptsse215-02/data/html/"+ i +".htm");
				if(!file.exists()){
					continue;
				}
				String savePath = "d:/data/baike/" + (int)(i / 10000) + "/" + i + ".xml";
				Page page = new Page(file);
				Parser parser = new Parser();
				parser.saveAsXml(page, savePath);
				
				if(page.flag == true){
					
					String des = "d:/data/attribute/" + (int)(i / 10000) + "/" + i + ".xml";
					File dir = new File(des.substring(0, des.lastIndexOf("/")));
					if(!dir.exists()){
						dir.mkdirs();
					}
					FileHelp.copyFile(new File(savePath), new File(des));
				}
			
			
			}catch(Exception e){
				FileHelp.writeFile("d:/data/error/" + i + ".txt", "eee");
			}
		}
	}
}