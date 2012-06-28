package com.buptsse.ate.relation;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConnectDatabase {

	String drivename = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost/test";
	String user = "root";
	String password = "root";
	String insql;
	String upsql;
	String delsql;
	String sql = "select * from user";
	String name;
	Connection conn;
	ResultSet rs = null;

	public Connection ConnectMysql() {
		try {
			Class.forName(drivename);
			conn = (Connection) DriverManager
					.getConnection(url, user, password);
			if (!conn.isClosed()) {
				System.out.println("Succeeded connecting to the Database!");
			} else {
				System.out.println("Falled connecting to the Database!");
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return conn;
	}

	public void CutConnection(Connection conn) throws SQLException {
		try {
			if (rs != null)
				;
			if (conn != null)
				;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			rs.close();
			conn.close();
		}
	}

	class User {// 内部类，其字段对应用来存放、提取数据库中的数据
		int userid;
		String username = "";
		String password = "";
		String email = "";

		// 通过set方法，往类的实例里“存放”数据
		// 通过get方法，从类的实例里“获得”数据，然后再通过插入数据库
		public void setId(int userid) {
			this.userid = userid;
		}

		public void setName(String username) {
			this.username = username;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public Integer getId() {
			return userid;
		}

		public String getName() {
			return username;
		}

		public String getPassword() {
			return password;
		}

		public String getEmail() {
			return email;
		}

	}

	// 插入、删除、更新的方法是一样的，不一样的是数据库参数
	public boolean InsertSql(User user) {
		try {

			insql = "insert into user(userid,username,password,email) values(?,?,?,?)";
			// 上面的方法比下面的方法有优势，一方面是安全性，另一方面我忘记了……
			// insql="insert into user(userid,username,password,email) values(user.getId,user.getName,user.getPassword,user.getEmail)";
			PreparedStatement ps = conn.prepareStatement(insql);
			// .preparedStatement(insql);
			// PreparedStatement ps=(PreparedStatement)
			// conn.prepareStatement(insql);
			ps.setInt(1, user.getId());
			ps.setString(2, user.getName());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getEmail());
			int result = ps.executeUpdate();
			// ps.executeUpdate();无法判断是否已经插入
			if (result > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean InsertSql(Catalog catalog) {
		try {

			insql = "insert into t_catalog(id,pid,title,level) values(?,?,?,?)";
			// 上面的方法比下面的方法有优势，一方面是安全性，另一方面我忘记了……
			// insql="insert into user(userid,username,password,email) values(user.getId,user.getName,user.getPassword,user.getEmail)";
			PreparedStatement ps = conn.prepareStatement(insql);
			// .preparedStatement(insql);
			// PreparedStatement ps=(PreparedStatement)
			// conn.prepareStatement(insql);
			ps.setInt(1, catalog.getId());
			ps.setInt(2, catalog.getPid());
			ps.setString(3, catalog.getTitle());
			ps.setInt(4, catalog.getLevel());
			
			int result = ps.executeUpdate();
			// ps.executeUpdate();无法判断是否已经插入
			if (result > 0)
				return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

	// 与其他操作相比较，查询语句在查询后需要一个查询结果集（ResultSet）来保存查询结果
	public int getPidSql(String sql) {
		try {
			Statement statement = conn.createStatement();
			rs = statement.executeQuery(sql);
			if (rs.next()) {
				return rs.getInt("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;

	}

	public boolean UpdateSql(String upsql) {
		try {
			PreparedStatement ps = conn.prepareStatement(upsql);
			int result = ps.executeUpdate();// 返回行数或者0
			if (result > 0)
				return true;
		} catch (SQLException ex) {
			Logger.getLogger(ConnectDatabase.class.getName()).log(Level.SEVERE,
					null, ex);
		}
		return false;
	}

	public boolean DeletSql(String delsql) {

		try {
			PreparedStatement ps = conn.prepareStatement(upsql);
			int result = ps.executeUpdate(delsql);
			if (result > 0)
				return true;
		} catch (SQLException ex) {
			Logger.getLogger(ConnectDatabase.class.getName()).log(Level.SEVERE,
					null, ex);
		}
		return false;
	}

	public static void main(String args[]) throws SQLException {
		
		ConnectDatabase cd = new ConnectDatabase();
		User user = cd.new User();
		cd.ConnectMysql();
		user.setId(14);// 每次测试运行都要改变该数字
		user.setName("zhangsan");
		user.setPassword("we23");
		user.setEmail("udjdj@125.com");
		cd.upsql = "update user set username='we' where userid=5";
		cd.delsql = "delete from user where userid=1";
		// cd.InsertSql(user,"kkk");
		cd.InsertSql(user);
		cd.DeletSql(cd.delsql);
		cd.UpdateSql(cd.upsql);
		cd.CutConnection(cd.conn);
	}

}