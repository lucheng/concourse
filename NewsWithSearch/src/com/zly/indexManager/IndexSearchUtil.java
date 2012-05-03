package com.zly.indexManager;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.Hits;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleFragmenter;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;

import com.zly.test.entity.SearchResultBean;

public class IndexSearchUtil {
	
	public List<SearchResultBean> getSearchResult(String searchWhich , String searchParam , int firstResult , int maxResult) throws Exception{
		//索引所在文件夹
		File indexFile = new File("\\\\x200/data/index/news");
		//读取索引的indexReader
		IndexReader reader = IndexReader.open(indexFile);
		//庖丁解牛分词器
		Analyzer analyzer = new PaodingAnalyzer();
		//指定对content还是title进行查询
		QueryParser parser = new QueryParser(searchWhich , analyzer);
		//创建indexSearcher
		IndexSearcher searcher  = new IndexSearcher(reader);
		//对用户的输入进行查询
		Query query = parser.parse(searchParam);
		//根据date字段进行排序，得到查询结果
		Hits hits = searcher.search(query , new Sort("date" , true));
		//创建list，将结果保存其中，以便在jsp页面中进行显示
		List<SearchResultBean> list = new ArrayList<SearchResultBean>();
		//模拟hibernate的serFirstResult和setMaxResult以便返回指定条目的结果
		for (int i = firstResult - 1; i < firstResult + maxResult - 1; i++) {
			Document doc = hits.doc(i);
			//取得该条索引文档
			SearchResultBean srb = new SearchResultBean();
			//从中取出标题
			String title = doc.get("title");
			//从中取出内容
			String content = doc.get("content");
			//从中取出主键id
			String id = doc.get("id");
			//从中取出发布时间
			String date = doc.get("date");
			//高亮htmlFormatter对象
			SimpleHTMLFormatter sHtmlF = new SimpleHTMLFormatter("<b><font color='red'>", "</font></b>");
			//高亮对象
			Highlighter highlighter = new Highlighter(sHtmlF,new QueryScorer(query));
			//设置高亮附近的字数
			highlighter.setTextFragmenter(new SimpleFragmenter(100));
			//如果查询的是标题，进行处理
			if(searchWhich.equals("title")) {
				String bestFragment = highlighter.getBestFragment(analyzer,searchWhich,title);
				//获得高亮后的标题内容
				srb.setTitle(bestFragment);
				//如果内容不足150个字，全部设置
				if(content.length() < 150) {
					srb.setContent(content);
				}else {
					//如果内容多于150个字，只取出前面150个字
					srb.setContent(content.substring(0 , 150));
				}
			} else {
				//如果查询的是内容字段
				String bestFragment = highlighter.getBestFragment(analyzer,searchWhich,content);
				//取得高亮内容并设置
				srb.setContent(bestFragment);
				//设置标题，全部设置
				srb.setTitle(title);
			}
			//设置日期
			srb.setDate(date);
			//设置主键
			srb.setId(id);
			//添加到list中，以便在jsp页面上显示
			list.add(srb);
		}
		return list;
	}
	//取得符合搜索条件的所有记录总数，以便分页 , 与上面方法类似
	public int getResultCount(String searchWhich , String searchParam) throws Exception {
		File indexFile = new File("c:/index/news");
		IndexReader reader = IndexReader.open(indexFile);
		Analyzer analyzer = new PaodingAnalyzer();
		QueryParser parser = new QueryParser(searchWhich , analyzer);
		IndexSearcher searcher  = new IndexSearcher(reader);
		Query query = parser.parse(searchParam);
		Hits hits = searcher.search(query);
		return hits.length();
	}
}
