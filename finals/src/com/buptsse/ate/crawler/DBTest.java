package com.buptsse.ate.crawler;
import java.sql.*;

public class DBTest { 
     
	public static void main(String[] args) { 
          String driver = "com.mysql.jdbc.Driver"; 
          String url = "jdbc:mysql://localhost:3306/sinanews"; 
          String user = "root"; 
          String password = "root"; 
          try { 
               Class.forName(driver); 
               Connection conn = DriverManager.getConnection(url, user, password);
               if(!conn.isClosed()){
            	   System.out.println("数据库连接成功！"); 
               }
               conn.close(); 
          } catch(ClassNotFoundException e) { 
               System.out.println("找不到驱动程序"); 
               e.printStackTrace(); 
          } catch(SQLException e) { 
               e.printStackTrace(); 
          } 
     } 
}