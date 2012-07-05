package com;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.ElementHandler;
import org.dom4j.ElementPath;
/**
* ���Ƶ��¼�������
* @author ��ɽ��Ӱ��
* @version 1.0
* Jul 7, 2008  4:35:49 PM
*/
public class ManElementHandler implements ElementHandler {
public String mdbName;//���ݿ����� ��·��
public ManElementHandler(){
  
}
public ManElementHandler(String mdbName){
  this.mdbName = mdbName;
}
/**
  *��Element�ڵ����ݱ��浽���ݿ�
  *@param element ����XML�ĵ�ʱ�ĵ�ǰ�ڵ�
  *@param mdbName ���ݿ����� ��·��
  *@return
  */
public boolean saveMan(Element element, String mdbName){
  System.out.println(" the method saveMan in ManElementHandler is execute!");
  Statement stmt = null;
  ResultSet rs = null;
  Connection conn = null;
  try {
   conn= AccessMDBUtil.connectMdb(mdbName);
   stmt=conn.createStatement();
   String sql = "insert into mans(id,name) values(" + element.elementText("id") + ",'" + element.elementText("name") + "')";
   stmt.executeUpdate(sql);
  
  } catch (Exception e) {
   e.printStackTrace();
   return false;
  } finally {
   if(rs != null) {
    try {
     rs.close();
    } catch (SQLException e) {
     // TODO Auto-generated catch block
     e.printStackTrace();
    }
   }
   if(stmt != null) {
    try {
     stmt.close();
    } catch (SQLException e) {
     // TODO Auto-generated catch block
     e.printStackTrace();
    }
   }
   if(conn != null) {
    try {
     conn.close();
    } catch (SQLException e) {
     // TODO Auto-generated catch block
     e.printStackTrace();
    }
   }
  
  }
  
  return true;
}
public void onEnd(ElementPath arg0) {
         Element row = arg0.getCurrent();
         Element rowSet = row.getParent();
         Document document = row.getDocument();
         Element root = document.getRootElement();
  Iterator it = root.elementIterator();
  while(it.hasNext()){
   Element element = (Element)it.next();
   System.out.println(" id : " + element.elementText("id") + " name : " + element.elementText("name"));
   saveMan(element, this.mdbName);
  }
          row.detach();
}
public void onStart(ElementPath path) {
  
}
}
//*************************************************************************************************************************
//*************************************************************************************************************************
