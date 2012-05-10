package com.buptsse.ate.index;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.KeywordAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryParser.ParseException;
import org.apache.lucene.queryParser.QueryParser;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKQueryParser;
import org.wltea.analyzer.lucene.IKSimilarity;
/**
 * 信息搜索
 * @author xiaoruoen
 *
 */
public class Searcher {
	
	private static String indexPath="\\\\buptsse215-02/data/luceneIndex/baike/title1";
	private static Logger logger = Logger.getLogger(Searcher.class);
	
	public static void main(String[] args){
		
		/*List<Document> list = queryByString("百度");
		for(Document str : list){
			logger.info(str.get("title"));
			logger.info(str.get("relation"));
			logger.info(str.get("id"));
		}*/
		
		search("百度");
	}
	
	public static ArrayList<Document> queryByString(String queryStr){
        //上面文章中建立索引的文件目录
        File indexDir = new File(indexPath); 
        FSDirectory directory;
        ArrayList<Document> resultList=new ArrayList<Document>(10);
        try {
            directory=FSDirectory.open(indexDir);
            
            IndexSearcher searcher=new IndexSearcher(directory);
             if(!indexDir.exists()){ 
                 System.out.println("The Lucene index is not exist");
                 return null; 
            }
            //定义搜索的基本单位。第一个参数代表了要在文档的哪一个 Field 上进行查找，第二个参数代表了要查询的关键词。 
            Term term = new Term("title",queryStr); 
            //构造查询对象。构造函数只接受一个 Term 对象
            TermQuery luceneQuery = new TermQuery(term); 
            //搜索需要查询对象，并返回结果
            TopDocs hit=searcher.search(luceneQuery, 10);
            
            for(int i=0;i<hit.totalHits;i++){
                ScoreDoc scoreDoc=hit.scoreDocs[i];
                Document hitDoc=searcher.doc(scoreDoc.doc);
                resultList.add(hitDoc);
            }
             
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return resultList;
    }
	
	
	public static void searchIKIndexByString(String index){
        //存放索引目录
        File indexDir = new File(indexPath); 
        FSDirectory directory;
        try {
            //用索引目录构建directory对象
            directory = FSDirectory.open(indexDir);
            //构造索引搜索器
            IndexSearcher searcher = new IndexSearcher(directory); 
            if(!indexDir.exists()){ 
                 System.out.println("The Lucene index is not exist"); 
                 return; 
            }
           //设置相似度比较器
            searcher.setSimilarity(new IKSimilarity());
        //    String keyword = "中文分词工具包"; 
            //使用IKQueryParser查询分析器构造Query对象 
          //多条件查询语句构建
            String[] fields={"title"};
            String[] querys={index};
            Occur[] Occurs={BooleanClause.Occur.MUST};
            Query query = IKQueryParser.parseMultiField(fields, querys, Occurs); 
            
             //排序字段（先后顺序即排序优先级，越排前面，优先级越高）
//            SortField sortF = new SortField("sellTotal", SortField.INT,true);
//            Sort sf = new Sort(sortF);
            Sort sort = new Sort(new SortField[]{new SortField("sellTotal",SortField.INT,true),new SortField("time",SortField.STRING,true),new SortField("price",SortField.FLOAT,true)});
            //定义搜索的基本单位。第一个参数代表了要在文档的哪一个 Field 上进行查找，第二个参数代表了要查询的关键词。 
//            Term term = new Term(fieldName,keyword); 
//            //构造查询对象。构造函数只接受一个 Term 对象
             //对像数据库中%like%查询的测试
//            Query query = new FuzzyQuery(term); 
            //搜索相似度最高的5条记录 
            TopDocs topDocs = searcher.search(query, null, 1000,sort);
            System.out.println("命中：" + topDocs.totalHits);
            for(int i=0;i<topDocs.totalHits;i++){
                //获取Document 对象
                ScoreDoc scoreDoc=topDocs.scoreDocs[i];
                Document document=searcher.doc(scoreDoc.doc);
                System.out.println("document: "+document.get("title")+"id: "+document.get("id")+"IsNew: "+document.get("IsNew")+"销量："+document.get("sellTotal")+" 商品入库时间 :"+document.get("time"));
                System.out.println("商品价格： "+document.get("price"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        } 
    }
	
	public static void search(String name){
		try {
			//打开索引存放的目录
			Directory dic = FSDirectory.open(new File(indexPath));
			//创建索引搜索
			IndexSearcher search = new IndexSearcher(dic);
			//创建中文分词
			Analyzer analyzer = new KeywordAnalyzer();
			//开始搜索
			QueryParser parser = new QueryParser(Version.LUCENE_30,"title",analyzer);
			Query query = parser.parse(name);
			TopDocs hits = search.search(query,100);
			//显示搜索结果
			logger.info("共找到"+hits.totalHits+"条记录");
			logger.info("=====================================================");
			for(ScoreDoc scoreDoc:hits.scoreDocs){
				Document doc = search.doc(scoreDoc.doc);
				logger.info("ID："+doc.get("id"));
				logger.info("名称："+doc.get("title"));
				logger.info("关系："+doc.get("relation"));
			}
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
	}
}