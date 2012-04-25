package com.xiaoruoen.crawler;

import java.net.Authenticator;
import java.net.PasswordAuthentication;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.SortedSet;

import org.apache.log4j.Logger;

import com.xiaoruoen.common.CommonData;
/**
 * 网页抓取类
 * @author xiaoruoen
 *
 */
public class Crawler implements Runnable{

	private Logger logger = Logger.getLogger(Crawler.class);

//	private String urlSeed = "http://www.taobao.com";//设置种子链接
	private String urlSeed = "http://www.iteye.com";//设置种子链接
	
	
	@Override
	public void run() {
		CommonData.urlCollection.add(urlSeed);
		CollectUrl();
	}

	//初始化
	public Crawler(){
		CommonData.urlCollection = new ArrayList();//用来存放搜集到的url
		CommonData.urlInfo = new ArrayList();//用来存放具有需要提取的信息的url
		CommonData.urlVisited = new ArrayList();//用来存放已经访问过的url
		CommonData.urlInfoed = new ArrayList();//用来存放已经提取过信息的url
	}
	
	//搜集url
	public void CollectUrl(){
//		setProxy();//设置代理
		Thread thread = new Thread(new GetUrlThread());//开启一个线程，开始抓取链接
		thread.start();
	}
	
	//设置代理
	public void setProxy(){
		Properties prop = System.getProperties();
		prop.setProperty("http.proxySet", "true");
		prop.setProperty("http.proxyHost", "64.73.37.166");//代理主机
		prop.setProperty("http.proxyPort", "80");//代理端口
		Authenticator.setDefault(new MyAuthenticator("", ""));//用户名密码
	}
	
	class MyAuthenticator extends Authenticator {
		private String username = "";
		private String password = "";

		public MyAuthenticator(String username, String password) {
			this.username = username;
			this.password = password;
		}

		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(username, password.toCharArray());
		}

	}
	
	public static void main(String[] args){
		
		Crawler crawler = new Crawler();
		crawler.run();
	}
	
}
