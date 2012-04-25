package com.xiaoruoen.search;

import java.io.File;
import java.io.IOException;

import org.apache.log4j.Logger;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.xiaoruoen.common.CommonData;
/**
 * 信息搜索
 * @author xiaoruoen
 *
 */
public class Search {
	private Logger logger = Logger.getLogger(Search.class);
	public void search(String name){
		try {
			//打开索引存放的目录
			Directory dic = FSDirectory.open(new File(CommonData.index));
			//创建索引搜索
			IndexSearcher search = new IndexSearcher(dic);
			//创建中文分词
			Analyzer analyzer = new IKAnalyzer();
			//开始搜索
			QueryParser parser = new QueryParser(Version.LUCENE_32,"title",analyzer);
			Query query = parser.parse(name);
			TopDocs hits = search.search(query,100);
			//显示搜索结果
			logger.info("共找到"+hits.totalHits+"条记录");
			logger.info("=====================================================");
			for(ScoreDoc scoreDoc:hits.scoreDocs){
				Document doc = search.doc(scoreDoc.doc);
				logger.info("名称："+doc.get("title"));
				logger.info("价格："+doc.get("price"));
				logger.info("图片："+doc.get("pic"));
				logger.info("网址："+doc.get("url"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}
