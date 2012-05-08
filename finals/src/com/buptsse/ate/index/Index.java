package com.buptsse.ate.index;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.util.Version;

import com.buptsse.ate.module.Page;
import com.buptsse.ate.utils.FileHelp;
import com.buptsse.ate.utils.Parser;

public class Index {

	private static String indexPath="\\\\buptsse215-02/data/luceneIndex/baike/title";
	private static String filePath = "\\\\buptsse215-02/data/baidu/";
	
	public static void main(String[] args){
		
		createBaiKeTitleIndex();
		List<String> list = new ArrayList<String>();
		list = queryByString("百度");
		for(String str : list){
			System.out.println(str);
		}
	}
	
	public static ArrayList<String> queryByString(String queryStr){
        //上面文章中建立索引的文件目录
        File indexDir = new File(indexPath); 
        FSDirectory directory;
        ArrayList<String> resultList=new ArrayList<String>(10);
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
                System.out.println("title: " + hitDoc.get("title"));
                String tempStr=hitDoc.get("title");
                resultList.add(tempStr);
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
            
            //indexDir is the directory that hosts Lucene's index files 
            File   indexDir = new File(indexPath); 
            //dataDir is the directory that hosts the text files that to be indexed 
	        Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_32);
//            Analyzer analyzer = new IKAnalyzer();
	        Directory dir= FSDirectory.open(indexDir);
	        indexWriter = new IndexWriter(dir,analyzer,IndexWriter.MaxFieldLength.LIMITED);
	        //此处对数据库表构建lucene索引
	        for(int i = 1; i < 10000; i++){
	        	
	            id=i;
	            fileName = filePath + i +".xml";
				File file = new File(fileName);
				System.out.println(fileName);
				if(file.exists()){
					try{
						Page page = Parser.parseXmlFile(fileName);
						title = page.getTitle();
						Document document = new Document();
			            //向docment对象加入索引字段
			            document.add(new Field("id",id+"",Field.Store.YES, Field.Index.NOT_ANALYZED));
			            document.add(new Field("title",title+"",Field.Store.YES, Field.Index.NOT_ANALYZED));
			            indexWriter.addDocument(document); 
					}catch(Exception e){
						e.printStackTrace();
						String newfilename = "D:/data/error"+fileName.substring(fileName.lastIndexOf("/",fileName.length()));
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
