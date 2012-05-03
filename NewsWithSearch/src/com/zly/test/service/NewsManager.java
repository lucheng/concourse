package com.zly.test.service;

import java.util.List;

import com.zly.test.entity.NewsItem;;

public interface NewsManager {
	
	List<NewsItem> getNewsItemByFirstResultAndMaxResult(int firstResult , int maxResult , int type);
	
	Long getItemCounts(int id);
	
	NewsItem getNewsById(int id);

	int getNewsType(int id);
}
