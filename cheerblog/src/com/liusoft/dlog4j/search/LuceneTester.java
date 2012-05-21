/*
 * ��Ȩ����: Ħ����Ϣ�Ƽ����޹�˾ 2005
 * ��Ŀ��DLOG4J_V3
 * ���ڰ���com.liusoft.dlog4j.lucene
 * �ļ�����LuceneTester.java
 * ����ʱ�䣺2005-10-24
 * �����ߣ�Winter Lau
 */
package com.liusoft.dlog4j.search;

import java.io.File;
import java.io.IOException;

import org.apache.lucene.analysis.standard.StandardAnalyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.Term;
import org.apache.lucene.index.TermEnum;

/**
 * useless, just for test
 * @author Winter Lau
 */
public class LuceneTester {

	/**
	 * @param args
	 * @throws Exception 
	 */
	public static void main(String[] args) throws Exception {
		addIndex();
		IndexReader reader = IndexReader.open(lucenePath);
		System.out.println("�ĵ���:"+reader.numDocs());
		TermEnum tes = reader.terms();
		while(tes.next()){
			Term t = tes.term();
			System.out.println(t.toString());
		}
		//IndexSearcher searcher = new IndexSearcher(lucenePath);
	}

    /**
     * ��������
     */
    protected static int addIndex() throws IOException {
		Document doc = new Document();
		doc.add(new Field("id", "1", Field.Store.YES, Field.Index.UN_TOKENIZED));
		doc.add(new Field("author", "����IBM OSIһһ����", Field.Store.YES, Field.Index.TOKENIZED));
		doc.add(new Field("time", Long.toString(System.currentTimeMillis()), Field.Store.YES, Field.Index.UN_TOKENIZED));
		doc.add(new Field("content", "��֪����ʲôʱ��ʼ����ʲô�������涼�и����ڣ��ﵶ�����ڣ����ͷ����ڣ�������ֽ������ڣ��ҿ�ʼ���ɣ�����������ϣ�����ʲô�����ǲ�����ڵģ�", Field.Store.NO, Field.Index.TOKENIZED));
		IndexWriter writer = getWriter();
		try {
		    writer.addDocument(doc);
		    writer.optimize();
		}finally {
		    writer.close();
		}
		System.out.println("doc count = " + writer.docCount());
        return 1;
    }
    /* (non-Javadoc)
     * @see jdlog.search.SearchProxy#getWriter()
     */
    protected static IndexWriter getWriter() throws IOException{
        File rp = new File(lucenePath);
        if(!rp.exists())
            rp.mkdirs();
        int wc = 0;
        while(wc<10 && IndexReader.isLocked(lucenePath)){
        	try {
				Thread.sleep(100);
			} catch (InterruptedException e) {
				return null;
			}
			wc++;
        }
        File segments = new File(lucenePath + File.separator + SEGMENTS);
        boolean bCreate = !segments.exists();
        return new IndexWriter(lucenePath,new StandardAnalyzer(),bCreate);
    }
    
    public final static String SEGMENTS = "segments";
    protected static String lucenePath = "D:\\lucene";
}
