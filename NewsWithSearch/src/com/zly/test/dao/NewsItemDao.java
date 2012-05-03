package com.zly.test.dao;

import java.util.List;

import com.zly.test.entity.NewsItem;

public interface NewsItemDao extends GenericDao<NewsItem , Integer> {
	List<NewsItem> getNewsItemByFirstResultAndMaxResult(int firstResult , int maxResult , int type);
	
	Long getItemCount(int id);
	
	int getNewsType(int id);
	
}
