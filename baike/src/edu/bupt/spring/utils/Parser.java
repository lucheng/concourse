package edu.bupt.spring.utils;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.Element;

import edu.bupt.spring.entity.Content;
import edu.bupt.spring.entity.Link;
import edu.bupt.spring.entity.Page;
import edu.bupt.spring.entity.Reinforce;
import edu.bupt.spring.entity.Tag;


public class Parser {
	
	private static Logger logger = Logger.getLogger(Parser.class);
	/*private Page page;
	private List<Content> contents = new ArrayList<Content>();
	private List<Reinforce> reinforces = new ArrayList<Reinforce>();
	private Document doc;*/
	
	/*public void fetch(String url, String fileName){
		
		try {
			doc = Jsoup.connect(url)
					.userAgent("Mozilla/5.0 (Windows NT 6.1; rv:5.0)")
					.cookie("auth", "token").timeout(1000).get();
		} catch (IOException e) {
			e.printStackTrace();
		}
		Elements codes = doc.body().select("body");

		// 标题
		Elements title = codes.select("h1[class=title]");
		page.setTitle(title.text());

		// 源码
		Elements htmlElement = codes.select("div[class=content-bd main-body]");
//		this.setHtml(htmlElement.html());

		int contentSize = codes.select("div[id^=sec-content]").size();
		for (int i = 0; i < contentSize; i++) {

			Content content = new Content();

			// 副标题
			String subTitle = codes.select("div[id=sec-header" + i + "]")
					.text();
			content.setSubTitle(subTitle);

			// 摘要
			String summary = codes.select(
					"div[id=sec-content" + i
							+ "]>div>div>div[class=card-summary-content]")
					.text();
			content.setSummary(summary);

			// 内容
			Elements textElement = codes.select("div[id=sec-content" + i + "]");
			content.setText(textElement.text());

			// 内容链接
			Elements links = textElement.select("a[href]");
			// System.out.println(links.size());
			Set<Link> linkList = new HashSet<Link>();
			for (int j = 0; j < links.size(); j++) {
				Link link = new Link(j, links.get(j).text(), links.get(j)
						.select("a[href]").attr("href"));
				linkList.add(link);
			}
			content.setLinks(linkList);
			// 开放分类
			Set<Tag> taglist = new HashSet<Tag>();
			Elements tags = textElement.select("dl[id=viewExtCati]>dd>a");
			for (Element element : tags) {
				taglist.add(new Tag(element.text()));
			}
			content.setTags(taglist);
			contents.add(content);
		}
		// 相关词条
		Elements reinforceElements = codes.select("dd[class=relative]").select(
				"a[href]");

		for (int i = 0; i < reinforceElements.size(); i++) {
			Reinforce reinforce = new Reinforce(i, reinforceElements.get(i)
					.text(), reinforceElements.get(i).attr("href"));
			this.reinforces.add(reinforce);
		}
	}*/
	
	public static Page parseXmlFile(String fileName) throws Exception{
		
		Page page = new Page();
		
		Document doc = XmlHelp.getDocument(fileName);
		Element root = doc.getRootElement();
		Element data = (Element) root.selectSingleNode("//datas");
		String title = data.element("title").getStringValue();
		int baikeId = Integer.parseInt(fileName.substring(fileName.lastIndexOf("/") + 1, fileName.lastIndexOf(".")));
		
		page.setTitle(title);
		
//		List<Element> elements = data.element("contents").elements();
		
//		Set<Content> contents = new HashSet<Content>();
		/*for(Element e : elements){
			
			Content content = new Content();
			
			String subTitle  = e.selectSingleNode(".//subtitle").getStringValue();
			String text  = e.selectSingleNode(".//text").getStringValue();
			String summary  = e.selectSingleNode(".//summary").getStringValue();
			
			List<Element> links  = e.selectNodes(".//links//link");
			Set<Link> linkList = new HashSet<Link>();
			for(Element element : links){
				Link link = new Link(Integer.parseInt(element.attributeValue("index")), element.getStringValue(), element.attributeValue("url"));
				linkList.add(link);
			}
			
			List<Element> tagElements  = e.selectNodes(".//tags//tag");
			Set<Tag> tags = new HashSet<Tag>();
			for(Element tag : tagElements){
				String tagText = tag.getStringValue();
				tags.add(new Tag(tagText));
			}
			
			content.setSubTitle(subTitle);
			content.setText(text);
			content.setSummary(summary);
			content.setLinks(linkList);
			content.setTags(tags);
			contents.add(content);
		}*/
		
//		page.setContents(contents);
		page.setBaibeId(baikeId);
		
		Set<Reinforce> reinforceList = new HashSet<Reinforce>();
		List<Element> reinforces = data.element("reinforces").elements();
		for(int i = 0; i < reinforces.size(); i++){
			String text = reinforces.get(i).attributeValue("url");
			String index = reinforces.get(i).attributeValue("index");
			String url = reinforces.get(i).getStringValue();
			logger.info(url);
			int beginIndex = url.lastIndexOf("/");
			int endIndex = url.lastIndexOf(".htm");
			if(beginIndex > 0 && endIndex > 0 && beginIndex < endIndex){
				String baiduId = url.substring(url.lastIndexOf("/")+1, url.lastIndexOf(".htm"));
				logger.info(index + "==" +baiduId + "==" + text);
				if(!baiduId.equals("baike_help")){
					Reinforce reinforce = new Reinforce(Integer.parseInt(index), Integer.parseInt(baiduId), text);
					reinforceList.add(reinforce);
				}
			}
		}
		
		page.setReinforces(reinforceList);
		
		return page;
	}
	
	public static void main(String[] args) throws Exception {
		
//		Page page = parseXmlFile("\\\\buptsse215-02/data/baidu/1.xml");
		Page page = parseXmlFile("d:/data/baike/19.xml");
//		saveAsXml(page, "1.xml");
	}
}

