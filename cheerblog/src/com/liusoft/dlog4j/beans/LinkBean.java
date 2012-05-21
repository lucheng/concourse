/*
 *  LinkBean.java
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

import com.liusoft.dlog4j.base.Orderable;
import com.liusoft.dlog4j.base._BeanBase;

/**
 * ���Ӷ���
 * @author liudong
 * @database_independence �ɵ����洢,��������������
 */
public class LinkBean extends _BeanBase implements Orderable{

	public final static int TYPE_HTML 	= 1;
	public final static int TYPE_XML    = 2;	
	public final static int TYPE_INNER  = 5;	//��������
	public final static int TYPE_WAP	= 6;	//WAP��������
	
	public final static int STATUS_HIDE = 0x01;
	
	protected int siteId;
	protected String title;		//��������
	protected String url;		//���ӵ�ַ
    protected int type = TYPE_HTML;
    protected int sortOrder;
    protected int status;
    
    protected Date createTime;	//���ʱ��
    
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getSortOrder() {
		return sortOrder;
	}
	public void setSortOrder(int sortOrder) {
		this.sortOrder = sortOrder;
	}
	public int getSiteId() {
		return siteId;
	}
	public void setSiteId(int siteId) {
		this.siteId = siteId;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
    
}
