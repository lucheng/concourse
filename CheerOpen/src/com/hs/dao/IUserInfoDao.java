package com.hs.dao;

import java.util.List;

import com.hs.po.UserInfo;

public interface IUserInfoDao {
	
	/**
	 * ����û�
	 * @param user
	 * @return
	 */
	public boolean addUser(UserInfo user);
	
	/**
	 * ���������û�
	 * @param user
	 * @return
	 */
	public List<UserInfo> searchUser();
	
	
	/**
	 * ����û�ID�������û�
	 * @param id
	 * @return
	 */
	public UserInfo findUser(int id);
	
	
	/**
	 * ����û�ID��ɾ���û�
	 * @param id
	 * @return
	 */
	public boolean delUser(int id);
}
