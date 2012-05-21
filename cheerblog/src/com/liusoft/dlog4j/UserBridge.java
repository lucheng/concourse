/*
 *  UserBridge.java
 *  
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU Library General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program; if not, write to the Free Software
 *  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
 *  
 *  Author: Winter Lau
 *  http://dlog4j.sourceforge.net
 */
package com.liusoft.dlog4j;

import com.liusoft.dlog4j.beans.UserBean;

/**
 * �û����Ϲ���ӿ�
 * �û�ע��/��¼/�����޸ĵȶ���ͨ���ýӿڽ���
 * �ýӿ��û���չ������ϵͳ���û�����ͬ������
 * @author liudong
 */
public interface UserBridge {
	
	/**
	 * ���һ���û�
	 * @param user
	 * @throws Exception
	 */
	public void create(final UserBean user);
	
	/**
	 * �����û�����
	 * @param user
	 * @throws Exception
	 */
	public void update(final UserBean user);
	
	/**
	 * ͨ���û�������ȡ�û�����
	 * @param username
	 * @return
	 * @throws Exception
	 */
	public UserBean getUserByName(final String username);
	
	/**
	 * ͨ���û��ǳ�����ȡ�û�����
	 * @param nickname
	 * @return
	 * @throws Exception
	 */
	public UserBean getUserByNickname(final String nickname);
	
	/**
	 * �û���¼�󴥷��÷���
	 * @param user
	 * @throws Exception
	 */
	public void userLogin(final UserBean user);
	
	/**
	 * �û��˳���¼�󴥷��÷���
	 * @param user
	 * @param manual_logout ���ֹ�ע�����ǻỰʵЧʱ��ϵͳ����
	 * @throws Exception
	 */
	public void userLogout(final SessionUserObject user, boolean manual_logout);

}
