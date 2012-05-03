package com.hs.service.impl;

import java.util.List;

import com.hs.dao.IUserInfoDao;
import com.hs.po.UserInfo;
import com.hs.service.IUserInfoService;

public class UserInfoServiceImpl implements IUserInfoService {
	
	private IUserInfoDao userInfoDao;
	
	public void setUserInfoDao(IUserInfoDao userInfoDao) {
		this.userInfoDao = userInfoDao;
	}

	public boolean addUser(UserInfo user) {
		userInfoDao.addUser(user);
		return false;
	}

	public List<UserInfo> searchUser() {
		
		return userInfoDao.searchUser();
	}

	public UserInfo findUser(int id) {
		
		return null;
	}

	public boolean delUser(int id) {
		
		return false;
	}

}
