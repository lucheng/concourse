package org.jsoup.examples;

import org.apache.commons.lang.Validate;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.Jsoup;
import org.jsoup.select.Elements;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.io.IOException;

/**
 * Example program to list links from a URL.
 */
public class ListLinks1 {
	public static void main(String[] args) throws IOException {

		// Validate.isTrue(args.length == 1, "usage: supply url to fetch");

		// URL url = new URL(args[0]);
		URL url = new URL("http://langxianpingblog.blog.163.com/");
		print("Fetching %s...", url.toExternalForm());

		Document doc = Jsoup.parse(url, 10 * 1000);
		
//		Elements links = doc.select("a[href]");
//		Elements script = doc.select("script");
//		Elements media = doc.select("[src]");
//		Elements imports = doc.select("link[href]");
//		Elements links = doc.select("*");
		Elements links = doc.select("div[id]");
		

		
		/*
		 * print("\nMedia: (%d)", media.size()); for (Element src : media) { if
		 * (src.tagName().equals("img")) print(" * %s: <%s> %sx%s (%s)",
		 * src.tagName(), src.attr("abs:src"), src.attr("width"),
		 * src.attr("height"), trim(src.attr("alt"), 20)); else
		 * print(" * %s: <%s>", src.tagName(), src.attr("abs:src")); }
		 */

		print("\ndiv: (%d)", links.size());
		String text = null;
		for (Element e : links) {

			if (!e.childNodes().isEmpty()) {
				text = e.childNodes().toString();

				print(" * %s: <%s>", e.tagName(), e.html());
			}
		}

		/*
		 * print("\nImports: (%d)", imports.size()); for (Element link :
		 * imports) { print(" * %s <%s> (%s)",
		 * link.tagName(),link.attr("abs:href"), link.attr("rel")); }
		 */

		/*
		 * print("\nLinks: (%d)", links.size()); for (Element link : links) {
		 * print(" * a: <%s>  (%s)", link.attr("abs:href"), trim(link.text(),
		 * 35)); }
		 */
	}

	private static void print(String msg, Object... args) {
		System.out.println(String.format(msg, args));
	}

	private static String trim(String s, int width) {
		if (s.length() > width)
			return s.substring(0, width - 1) + ".";
		else
			return s;
	}
}