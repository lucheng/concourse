package com.hs.utils;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {

	private static SessionFactory sessionFactory;
	static {
		try {

			// 获得配置文件并创建工厂
			Configuration config = new Configuration().configure();
			sessionFactory = config.buildSessionFactory();
		} catch (Exception e) {
			e.printStackTrace();
			throw new ExceptionInInitializerError();	//初始化异常
		}
	}

	// 获得连接的方法（工厂）
	public static SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	// 关闭连接（工厂）
	public static void closeSessionFactory() {
		if (sessionFactory != null) {
			sessionFactory.close();
		}
	}

	// 连接数据库
	public static Session getSession() {
		return sessionFactory.openSession();
	}

	// 关闭数据库连接
	public static void closeSession(Session session) {
		if (session != null) {
			session.close();
		}
	}

	// 事务的回滚
	public static void rollBack(Transaction tx) {
		if (tx != null) {
			tx.rollback();
		}
	}

}
