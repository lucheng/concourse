package com.buptsse.ate.index;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.BooleanClause;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.Sort;
import org.apache.lucene.search.SortField;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;
import org.wltea.analyzer.lucene.IKQueryParser;
import org.wltea.analyzer.lucene.IKSimilarity;

import com.buptsse.ate.module.Page;
import com.buptsse.ate.module.Reinforce;
import com.buptsse.ate.utils.FileHelp;
import com.buptsse.ate.utils.Parser;

public class Index {

	private static String indexPath="\\\\buptsse215-02/data/luceneIndex/baike/title";
	private static String filePath = "\\\\buptsse215-02/data/baidu/";
	
	public static void main(String[] args){
		
//		createBaiKeTitleIndex();
		List<Document> list = new ArrayList<Document>();
		list = queryByString("百度");
		for(Document str : list){
			System.out.println(str.get("title"));
			System.out.println(str.get("relation"));
			System.out.println(str.get("id"));
		}
//		searchIKIndexByString("百度");
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
	/**
     * 创建普通索引
     */
    public static void  createBaiKeTitleIndex(){
    	
    	IndexWriter indexWriter=null;
        try {
            int id=0;
            String fileName = "";
            String title = "";
            String relation = "";
            
            //indexDir is the directory that hosts Lucene's index files 
            File   indexDir = new File(indexPath); 
            //dataDir is the directory that hosts the text files that to be indexed 
//	        Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_32);
            Analyzer analyzer = new IKAnalyzer();
	        Directory dir= FSDirectory.open(indexDir);
	        indexWriter = new IndexWriter(dir,analyzer,IndexWriter.MaxFieldLength.LIMITED);
	        
	        for(int i = 1; i < 10000; i++){
	        	
	            id=i;
	            fileName = filePath + i +".xml";
				File file = new File(fileName);
				System.out.println(fileName);
				
				if(file.exists()){
					try{
						Page page = Parser.parseXmlFile(fileName);
						
						title = page.getTitle();
						
						relation = "{";
						for(Reinforce reinforce : page.getReinforces()){
							relation += reinforce.toString()+",";
						}
						relation = relation.substring(0, relation.length()-1) + "}";
						
//						System.out.println(relation);
						Document document = new Document();
			            //向docment对象加入索引字段
			            document.add(new Field("id",id+"",Field.Store.YES, Field.Index.NOT_ANALYZED));
			            document.add(new Field("title",title,Field.Store.YES, Field.Index.NOT_ANALYZED));
			            document.add(new Field("relation",relation,Field.Store.YES, Field.Index.NOT_ANALYZED));
			            indexWriter.addDocument(document); 
					}catch(Exception e){
						e.printStackTrace();
						String newfilename = "\\buptsse215-02/data/error"+fileName.substring(fileName.lastIndexOf("/",fileName.length()));
						FileHelp.copyFile(new File(fileName), new File(newfilename));
						continue;
					}
				}else{
					System.out.println("file is not exists");
				}
	        }
	       //索引优化
	        indexWriter.optimize();
	        
        } catch (Exception e) {
	            e.printStackTrace();
        } finally{
              try {
                indexWriter.close();
            } catch (Exception e) {
                e.printStackTrace();
            } 
        }
    }
}
