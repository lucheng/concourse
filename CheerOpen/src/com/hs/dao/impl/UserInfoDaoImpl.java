package com.hs.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.HibernateTemplate;

import com.hs.dao.IUserInfoDao;
import com.hs.po.UserInfo;

public class UserInfoDaoImpl implements IUserInfoDao {
	
    private HibernateTemplate hibernateTemplate;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.hibernateTemplate = new HibernateTemplate(sessionFactory);
    }


	public boolean addUser(UserInfo user) {
		hibernateTemplate.save(user);
		return false;
	}

	public List<UserInfo> searchUser() {
		List<UserInfo> list = hibernateTemplate.find("from UserInfo");
		return list;
	}

	public UserInfo findUser(int id) {
		
		return null;
	}

	public boolean delUser(int id) {
		
		return false;
	}

}
