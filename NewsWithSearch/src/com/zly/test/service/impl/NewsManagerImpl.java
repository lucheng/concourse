package com.zly.test.service.impl;

import java.util.List;

import com.zly.test.dao.NewsItemDao;
import com.zly.test.entity.NewsItem;
import com.zly.test.service.NewsManager;

public class NewsManagerImpl implements NewsManager {
	//新闻条目dao
	private NewsItemDao newsItemDao;
	
	public NewsItemDao getNewsItemDao() {
		return newsItemDao;
	}

	public void setNewsItemDao(NewsItemDao newsItemDao) {
		this.newsItemDao = newsItemDao;
	}
	//根据分页得到内容
	public List<NewsItem> getNewsItemByFirstResultAndMaxResult(int firstResult,
			int maxResult , int type) {
		return newsItemDao.getNewsItemByFirstResultAndMaxResult(firstResult, maxResult ,  type);
	}
	//得到总记录数，以便计算总页数
	public Long getItemCounts(int id) {
		return newsItemDao.getItemCount(id);
	}
	//通过id得到具体新闻
	public NewsItem getNewsById(int id) {
		return newsItemDao.get(id);
	}
	//通过id得到所属新闻类别的id
	public int getNewsType(int id) {
		return newsItemDao.getNewsType(id); 
	}

}
