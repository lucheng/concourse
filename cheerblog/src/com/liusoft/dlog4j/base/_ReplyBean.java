/*
 *  ReplyBean.java
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
 *  Author: Winter Lau (javayou@gmail.com)
 *  http://dlog4j.sourceforge.net
 *  
 */
package com.liusoft.dlog4j.base;

import java.util.Date;

import com.liusoft.dlog4j.beans.UserBean;
import com.liusoft.dlog4j.search.SearchEnabled;

/**
 * ���۶���Ļ���
 * 
 * @author Winter Lau
 */
public abstract class _ReplyBean extends _MultipleSiteEnabledBean implements
		SearchEnabled {

	protected String author; // ����������
	protected String authorURL; // ��������ַ
	protected String authorEmail; // ����������
	protected String content; // ��������
	protected Date replyTime; // ����ʱ��
	protected ClientInfo client; // �ͻ�����Ϣ
	protected int status; // ����������Ϣ��״̬��������ɾ��֮���
	protected int ownerOnly;    //�Ƿ�ֻ�������˺������߲���
	protected UserBean user;

	/**
	 * �������۵Ķ�����
	 * 
	 * @return
	 */
	public abstract int getParentId();

	public UserBean getUser() {
		return user;
	}

	public void setUser(UserBean user) {
		this.user = user;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getReplyTime() {
		return replyTime;
	}

	public void setReplyTime(Date replyTime) {
		this.replyTime = replyTime;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getAuthorURL() {
		return authorURL;
	}

	public void setAuthorURL(String authorURL) {
		this.authorURL = authorURL;
	}

	public ClientInfo getClient() {
		if(client==null)
			client = new ClientInfo();
		return client;
	}

	public void setClient(ClientInfo client) {
		this.client = client;
	}

	public String getAuthorEmail() {
		return authorEmail;
	}

	public void setAuthorEmail(String authorEmail) {
		this.authorEmail = authorEmail;
	}

	public int getOwnerOnly() {
		return ownerOnly;
	}

	public void setOwnerOnly(int ownerOnly) {
		this.ownerOnly = ownerOnly;
	}

	/** *** The methods below is for search proxy **** */

	public String getKeywordField() {
		return "id";
	}

	public String[] getStoreFields() {
		return new String[] { "site.id", "site.friendlyName", "author",
				"replyTime", "user.id", "user.nickname" };
	}

	public String[] getIndexFields() {
		return new String[] { "content" };
	}

}
