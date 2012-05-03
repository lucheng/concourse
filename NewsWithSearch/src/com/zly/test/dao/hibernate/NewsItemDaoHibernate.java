package com.zly.test.dao.hibernate;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;

import com.zly.test.dao.NewsItemDao;
import com.zly.test.entity.NewsItem;
import com.zly.test.entity.NewsType;

public class NewsItemDaoHibernate extends GenericDaoHibernate<NewsItem , Integer>  implements NewsItemDao{

	public NewsItemDaoHibernate() {
		super(NewsItem.class);
	}

	@SuppressWarnings("unchecked")
	//根据分页得到具体页的内容
	public List<com.zly.test.entity.NewsItem> getNewsItemByFirstResultAndMaxResult(
			final int firstResult, final int maxResult , final int type) {
		return (List<NewsItem>) this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery(" from NewsItem where type.id = '" + type + "'").setFirstResult(firstResult).setMaxResults(maxResult).list();
			}
		});
	}
	//得到数据总条数 ， 以便计算总页数
	public Long getItemCount(final int id) {
		return (Long) this.getHibernateTemplate().execute(new HibernateCallback(){
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				return session.createQuery("select count(*) from NewsItem where type.id = '" + id + "'").uniqueResult();
			}
		});
	}
	//显示新闻数据页面用到， 查询具体新闻属于哪个新闻类别
	public int getNewsType(final int id) {
		return (Integer) this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException, SQLException {
				NewsItem newsItem = get(id);
				NewsType type = newsItem.getType();
				return type.getId();
			}
		});
	}
}
