package com.hs.service;

import java.util.List;

import com.hs.po.UserInfo;

public interface IUserInfoService {
	
	/**
	 * 添加用户
	 * @param user
	 * @return
	 */
	public boolean addUser(UserInfo user);
	
	/**
	 * 查找所有用户
	 * @param user
	 * @return
	 */
	public List<UserInfo> searchUser();
	
	
	/**
	 * 根据用户ID来查找用户
	 * @param id
	 * @return
	 */
	public UserInfo findUser(int id);
	
	
	/**
	 * 根据用户ID来删除用户
	 * @param id
	 * @return
	 */
	public boolean delUser(int id);
	
}
