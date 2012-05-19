package edu.bupt.spring.test;

import java.sql.*;

public class JDBCTest {
	public static void main(String[] args) {

		String driver = "com.mysql.jdbc.Driver"; // 驱动程序名
		String url = "jdbc:mysql://mysql-cheerfly.jelastic.servint.net:3306/test"; // URL指向要访问的数据库名scutcs
		String user = "root"; // MySQL配置时的用户名
		String password = "O8xmRgsAmJ"; // MySQL配置时的密码
		try {

			Class.forName(driver); // 加载驱动程序
			Connection conn = DriverManager.getConnection(url, user, password); // 连续数据库
			if (!conn.isClosed())
				System.out.println("Succeeded connecting to the Database!"); // 验证是否连接成功
			conn.close();
		} catch (ClassNotFoundException e) {
			System.out.println("Sorry,can`t find the Driver!");
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}