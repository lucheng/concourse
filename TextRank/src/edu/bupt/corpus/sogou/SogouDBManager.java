package edu.bupt.corpus.sogou;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import edu.bupt.utils.FileUtils;

public class SogouDBManager {

	private static String url = "jdbc:mysql://localhost:3306/sogou?useUnicode=true&characterEncoding=UTF-8";
	private static String username = "root";
	private static String password = "root";

	public static boolean savaDocBeanToDB(List<DocBean> docList) {
		Connection conn = DBUtil.getConnection(url, username, password);
		PreparedStatement ps = null;
		// 成功与否.
		boolean flag = false;
		// 查询字符串.
		String sqlString = "insert into sohunews_reduced (newsno,newstitle,newscontent,newsurl,category) values(?,?,?,?,?)";
		Iterator<DocBean> docIter = docList.iterator();
		DocBean docbean = null;
		while (docIter.hasNext()) {
			docbean = docIter.next();
			try {
				ps = conn.prepareStatement(sqlString);
				
				ps.setString(1, docbean.getNo());
				ps.setString(2, docbean.getTitle());
				ps.setString(3, docbean.getContent());
				ps.setString(4, docbean.getUrl());
				ps.setString(5, docbean.getCategory());
				
				// 执行sql语句.
				if(docbean.getTitle().length() > 2 
						&& docbean.getContent().length() > 20 
						&& docbean.getCategory().trim().toUpperCase().equals("IT")){
//					flag = ps.execute();
					String fileName = System.currentTimeMillis() + ".txt";
					FileUtils.writeFile("E:/data/title/" + fileName, docbean.getTitle());
					FileUtils.writeFile("E:/data/content/" + fileName, docbean.getContent());
				}
			} catch (SQLException e) {
				System.out.println("插入newsbean时,Sql语句执行错误!");
				System.out.println("内容是:" + docbean.getContent());
				e.printStackTrace();
				return false;
			}
		}
		try {
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			System.out.println("connection close exception: " + e.getMessage());
		}
		return flag;
	}
}