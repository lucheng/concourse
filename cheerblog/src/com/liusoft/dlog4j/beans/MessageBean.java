/*
 *  MessageBean.java
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
package com.liusoft.dlog4j.beans;

import java.util.Date;

import com.liusoft.dlog4j.base._BeanBase;

/**
 * վ�����Զ���
 * @author liudong
 */
public class MessageBean extends _BeanBase {

	public final static int STATUS_NEW = 0x00;  //����Ϣ
    public final static Integer I_STATUS_NEW = new Integer(STATUS_NEW);	//�Ѷ�
    public final static int STATUS_READ = 0x01;	//�Ѷ�
    public final static Integer I_STATUS_READ = new Integer(STATUS_READ);	//�Ѷ�
    
    protected UserBean fromUser;	//������
    protected UserBean toUser;		//������
    protected String content;		//��������
    protected Date sendTime;		//���Է���ʱ��
    protected Date expiredTime;		//���Ե�ʧЧʱ��(NEW:3.0�汾����)
    protected Date readTime;		//�����Ķ�ʱ��
    protected int status;			//���Եĵ�ǰ״̬
    
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getExpiredTime() {
		return expiredTime;
	}
	public void setExpiredTime(Date expiredTime) {
		this.expiredTime = expiredTime;
	}
	public UserBean getFromUser() {
		return fromUser;
	}
	public void setFromUser(UserBean fromUser) {
		this.fromUser = fromUser;
	}
	public Date getReadTime() {
		return readTime;
	}
	public void setReadTime(Date readTime) {
		this.readTime = readTime;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public UserBean getToUser() {
		return toUser;
	}
	public void setToUser(UserBean toUser) {
		this.toUser = toUser;
	}

}
