package com.zly.test.dao.hibernate;

import com.zly.test.dao.NewsTypeDao;
import com.zly.test.entity.NewsType;

public class NewsTypeDaoHibernate extends GenericDaoHibernate<NewsType , Integer> implements
		NewsTypeDao {

	public NewsTypeDaoHibernate() {
		super(NewsType.class);
	}

}
