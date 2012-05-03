package com.zly.indexManager;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import net.paoding.analysis.analyzer.PaodingAnalyzer;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.cfg.Configuration;
import org.hibernate.Session;
import org.htmlparser.Parser;

import com.zly.test.entity.NewsItem;

public class IndexCreateUtil {
	
	@SuppressWarnings("unchecked")
	public void createIndexForNews() throws Exception {
		//存放索引的文件夹
		File indexFile = new File("c:/index/news");
		//使用了庖丁解牛分词器
		Analyzer analyzer = new PaodingAnalyzer();
		//使用索引文件夹，庖丁解牛分词器创建IndexWriter
		IndexWriter indexWriter = new IndexWriter(indexFile , analyzer , true);
		//从数据库中读取出所有的新闻记录以便进行索引的创建
		Configuration cfg = new AnnotationConfiguration().configure();
		SessionFactory factory = cfg.buildSessionFactory();
		Session session = factory.openSession();
		List<NewsItem> list = session.createQuery(" from NewsItem").list();
		DateFormat format = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
		//对所有的新闻实体进行索引创建
		for (NewsItem newsItem : list) {
			//建立一个lucene文档
			Document doc = new Document();
			//得到新闻标题
			String newsTitle = newsItem.getNewsTitle();
			//得到新闻内容
			String newsContent = newsItem.getNewsContent();
			//得到新闻事件
			String publishDate = format.format(newsItem.getPublishTime());
			//得到新闻主键id
			String id = newsItem.getId() + "";
			//将新闻标题加入文档，因为要搜索和高亮，所以index是tokennized，TermVector是WITH_POSITIONS_OFFSETS
			doc.add(new Field("title" , newsTitle , Field.Store.YES , Field.Index.TOKENIZED , Field.TermVector.WITH_POSITIONS_OFFSETS));
			//利用htmlparser得到新闻内容html的纯文本
			Parser parser = new Parser();
			parser.setInputHTML(newsContent);
			String strings = parser.parse(null).elementAt(0).toPlainTextString().trim();
			//添加新闻内容至文档，与标题相似
			doc.add(new Field("content" , strings , Field.Store.COMPRESS , Field.Index.TOKENIZED , Field.TermVector.WITH_POSITIONS_OFFSETS));
			//添加时间至文档，因为要按照此字段降序排列排序，所以tokenzied,不用高亮所以TermVector是no就行了
			doc.add(new Field("date" , publishDate , Field.Store.YES , Field.Index.TOKENIZED , Field.TermVector.NO));
			//添加主键至文档，不分词，不高亮。
			doc.add(new Field("id" , id , Field.Store.YES , Field.Index.NO , Field.TermVector.NO));
			indexWriter.addDocument(doc);
		}
		//创建索引
		indexWriter.optimize();
		indexWriter.close();
		//关闭session
		session.close();
	}
	public static void main(String[] args) throws Exception {
		IndexCreateUtil util  = new IndexCreateUtil();
		util.createIndexForNews();
	}
}
