package com.xiaoruoen.client;

import java.util.Timer;

import com.xiaoruoen.crawler.Crawler;
import com.xiaoruoen.index.Index;
import com.xiaoruoen.info.GetInfo;
/**
 * 
 * @author xiaoruoen
 *
 */
public class Client {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//抓取网页
		Thread crawler = new Thread(new Crawler());
		crawler.start();
		//提取信息
		Timer infoTimer = new Timer();
		infoTimer.schedule(new GetInfo(),1000, 100);
		//建立索引
		Timer indexTimer = new Timer();
		indexTimer.schedule(new Index(), 1000,100);
	}

}
