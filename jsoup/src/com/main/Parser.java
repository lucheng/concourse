package com.main;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.w3c.tidy.Tidy;

public class Parser {
	public static void main(String[] args) {
		Parser t = new Parser();
//		t.parseUrl();
		// t.parseString();
		// t.parseFile();
		html2xml(null, "F:/workspace/webharvest/page/163/4.html", "F:/workspace/webharvest/page/163/new.xml");
	}

	public void parseString() {
		String html = "<html><head><title>blog</title></head><body onload='test()'><p>Parsed HTML into a doc.</p></body1eeeeeee></html>";
		Document doc = Jsoup.parse(html);
		System.out.println(doc);
		Elements es = doc.body().getAllElements();
		System.out.println(es.attr("onload"));
		System.out.println(es.select("p"));
	}

	public void parseUrl() {
		try {
			// Document doc =
			// Jsoup.connect("http://langxianpingblog.blog.163.com/").get();
			Document doc = Jsoup.connect("http://blog.sina.com.cn/guoyuanrongblog").get();

			// Elements hrefs = doc.select("div[class=useface-text]");
			Elements hrefs = doc.select("div[id]");

			System.out.println(hrefs);
			System.out.println("------------------");
			// System.out.println(hrefs.select("[href^=http]"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void parseFile() {
		try {
			File input = new File("F:/workspace/webharvest/page/163/4.html");
			Document doc = Jsoup.parse(input, "UTF-8");
			// 提取出所有的编号
			Elements codes = doc.body().select(
					"td[title^=IA] > a[href^=javascript:view]");
			System.out.println(codes);
			System.out.println("------------------");
			System.out.println(codes.html());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static void html2xml(String configFileName, String srcFileName, String outFileName) {
		BufferedInputStream in;
		FileOutputStream out;
		Tidy tidy = new Tidy();

		tidy.setConfigurationFromFile(configFileName);// 配置文件，写入上面的设置参数
		try {
			in = new BufferedInputStream(new FileInputStream(srcFileName));
			out = new FileOutputStream(outFileName);
			tidy.parse(in, out);
		} catch (IOException e) {
			System.out.println(e);
		}
	}
}
