package com;
import java.sql.Connection;
import java.sql.DriverManager;
/**
* ��ȡAccess���ݿ������
* @author ��ɽ��Ӱ��
* @version 1.0
* Jul 7, 2008  4:35:49 PM
*/
public class AccessMDBUtil {
public static Connection connectMdb(String mdbName) {
  if(mdbName == null || mdbName.equals("")){
   return null;
  }
  try {
   Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
   String dburl ="jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ="+mdbName;
   Connection conn=DriverManager.getConnection(dburl);
   return conn;
  } catch (Exception e) {
   e.printStackTrace();
   return null;
  }
}
}
//*******************************************************************************************************************
//*******************************************************************************************************************
