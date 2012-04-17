package com.buptsse.ate.relation;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class WordRelation {

	public static void insertDB(){
		
	}
	public static void seperateClass(){

		ConnectDatabase cd = new ConnectDatabase();
		cd.ConnectMysql();
		
		File file = new File("input/cate/class/class.txt");
		try{
			BufferedReader input=new BufferedReader(new FileReader(file)); 
			String text;
			int count = 0;
			String pTitle = "";
			while((text=input.readLine())!=null){
				
				List<String> firstClass = new ArrayList<String>();
				List<String> secondClass = new ArrayList<String>();
				List<Integer> secondClassNum = new ArrayList<Integer>();
				List<String> thirdClass = new ArrayList<String>();
				
				
				if(count % 3 == 0){
					System.out.println("1级" + text);
					Catalog catalog = new Catalog();
					catalog.setTitle(text);
					catalog.setLevel(1);
//					cd.InsertSql(catalog);
					pTitle = text;
					firstClass.add(text);
				}
				if(count % 3  == 1){
					String[] texts = text.split(" +");
					for(String str : texts){
						if(!str.equals("")){
							String title = str.substring(0,str.indexOf("("));
							System.out.println("2级" + title);
							secondClass.add(str.substring(0,str.indexOf("(")));
							String NewStr=str.substring(str.indexOf("(")+1, str.lastIndexOf(")"));
						    System.out.println("2级个数" + NewStr);
						    secondClassNum.add(Integer.parseInt(NewStr));
						    Catalog catalog = new Catalog();
						    String sql = "select id from t_catalog where title like '" + pTitle + "'";
						    System.out.println(sql);
							int pid = cd.getPidSql(sql);
							catalog.setPid(pid);
							catalog.setTitle(str.substring(0,str.indexOf("(")));
							catalog.setLevel(2);
							
							
//							cd.InsertSql(catalog);
						}
					}
				}
				if(count % 3  == 2){
					String[] texts = text.split(" +");
					for(String str : texts){
						System.out.println("3级" + str);
						Catalog catalog = new Catalog();
						catalog.setTitle(str);
						catalog.setLevel(3);
//						cd.InsertSql(catalog);
						thirdClass.add(str);
					}
				}
				count++;
			}
			System.out.println("==============================" + count);
			try {
				cd.CutConnection(cd.conn);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public static void updataThirdClass(){

		ConnectDatabase cd = new ConnectDatabase();
		cd.ConnectMysql();
		
		File file = new File("input/cate/class/class.txt");
		try{
			BufferedReader input=new BufferedReader(new FileReader(file)); 
			String text;
			
			List<String> secondClass = new ArrayList<String>();
			Map<String, Integer> secondClassNum = new HashMap<String, Integer>();
			List<String> thirdClass = new ArrayList<String>();
			
			int count = 0;
			
			while((text=input.readLine())!=null){
				
				
				
				if(count % 3  == 1){
					String[] texts = text.split(" +");
					for(String str : texts){
						if(!str.equals("")){
							String title = str.substring(0,str.indexOf("("));
							
							String NewStr=str.substring(str.indexOf("(")+1, str.lastIndexOf(")"));
//						    System.out.println("2级个数" + NewStr);
						    secondClass.add(title);
						    secondClassNum.put(title,Integer.parseInt(NewStr));
						    
						}
					}
				}
				if(count % 3  == 2){
					String[] texts = text.split(" +");
					for(String str : texts){
						thirdClass.add(str);
					}
				}
				count++;
			}
			System.out.println("==============================" + count);
			
			int thirdNum = 0;
			for(String secondTitle : secondClass){
				
				int num = secondClassNum.get(secondTitle);
				System.out.println(secondTitle);
				String sql = "select id from t_catalog where title like '" + secondTitle + "'";
			    System.out.println(sql);
				int pid = cd.getPidSql(sql);
				
				for(int i = 0; i < num; i++){
					System.out.println("||---" + thirdClass.get(thirdNum));
					String upsql = "update t_catalog set pid="+ pid +" where title like '"+ thirdClass.get(thirdNum) +"'";
					System.out.println(upsql);
					cd.UpdateSql(upsql);
					thirdNum++;
				}
			}
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	public static void main(String[] args) throws SQLException {
		
		updataThirdClass();
	}

}
