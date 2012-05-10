package com.buptsse.ate.index;

import java.io.File;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.wltea.analyzer.lucene.IKAnalyzer;

import com.buptsse.ate.module.Content;
import com.buptsse.ate.module.Page;
import com.buptsse.ate.module.Reinforce;
import com.buptsse.ate.utils.Constant;
import com.buptsse.ate.utils.FileHelp;
import com.buptsse.ate.utils.Parser;

public class Index {

	private static Logger logger = Logger.getLogger(Index.class);
	private static String indexPath="\\\\buptsse215-02/data/luceneIndex/baike/title";
	private static String filePath = "\\\\buptsse215-02/data/baidu/";
	
	public Index(){
		PropertyConfigurator.configure(Constant.LOG4J);
	}
	public static void main(String[] args){
		Index index = new Index();
		index.createBaiKeTitleIndex();
	}
	
	/**
     * 创建普通索引
     */
    public void  createBaiKeTitleIndex(){
    	
    	IndexWriter indexWriter=null;
        try {
            int id=0;
            String fileName = "";
            String title = "";
            String relation = "";
            String tag = "";
            
            //indexDir is the directory that hosts Lucene's index files 
            File   indexDir = new File(indexPath); 
            //dataDir is the directory that hosts the text files that to be indexed 
//	        Analyzer analyzer = new StandardAnalyzer(Version.LUCENE_32);
            Analyzer analyzer = new IKAnalyzer();
	        Directory dir= FSDirectory.open(indexDir);
	        indexWriter = new IndexWriter(dir,analyzer,IndexWriter.MaxFieldLength.UNLIMITED);
	        
	        for(int i = 1; i < 1000000; i++){
	        	
	            id=i;
	            fileName = filePath + i +".xml";
				File file = new File(fileName);
				logger.info(fileName);
				
				if(file.exists()){
					try{
						Page page = Parser.parseXmlFile(fileName);
						
						title = page.getTitle();
						
						relation = "{";
						for(Reinforce reinforce : page.getReinforces()){
							relation += reinforce.toString()+",";
						}
						if(relation.length() == 3){
							relation = "{}";
						}else{
							relation = relation.substring(0, relation.length()-1) + "}";
						}
						
						tag = "{";
						for(Content content : page.getContents()){
							for(String str : content.getTaglist()){
								tag += str+",";
							}
						}
						if(tag.length() > 1){
							tag = tag.substring(0, tag.length()-1) + "}";
						} else {
							tag += "}";
						}
						
//						logger.info("tag:" + tag);
//						logger.info("relation:" + relation);
						
						Document document = new Document();
			            //向docment对象加入索引字段
			            document.add(new Field("id",id+"",Field.Store.YES, Field.Index.NOT_ANALYZED));
			            document.add(new Field("title",title,Field.Store.YES, Field.Index.ANALYZED));
			            document.add(new Field("relation",relation,Field.Store.YES, Field.Index.ANALYZED));
			            document.add(new Field("tag",tag,Field.Store.YES, Field.Index.ANALYZED));
			            indexWriter.addDocument(document);
					}catch(Exception e){
						e.printStackTrace();
						String newfilename = "\\\\buptsse215-02/data/error"+fileName.substring(fileName.lastIndexOf("/",fileName.length()));
						FileHelp.copyFile(new File(fileName), new File(newfilename));
						continue;
					}
				}else{
					logger.info("file is not exists");
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
