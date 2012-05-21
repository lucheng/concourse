/*
 *  ExternalReferBean.java
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
 *  
 */
package com.liusoft.dlog4j.beans;

import java.util.Date;

import com.liusoft.dlog4j.base._MultipleSiteEnabledBean;

/**
 * �ⲿ��ʵ�������,��ӦHTTPͷ��Refererֵ
 * @author Winter Lau
 */
public class ExternalReferBean extends _MultipleSiteEnabledBean {

	protected int refId;		//���۶�Ӧ�����±��
	protected int refType;	//�������
	protected String url;		//Refererֵ
	protected String host;		//url�а�����������Ϣ,����www.google.com
	protected String clientAddr;//������˵�ip��ַ
	protected Date referTime;	//���õ�ʱ��
	
	public String getClientAddr() {
		return clientAddr;
	}
	public void setClientAddr(String clientAddr) {
		this.clientAddr = clientAddr;
	}
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public Date getReferTime() {
		return referTime;
	}
	public void setReferTime(Date referTime) {
		this.referTime = referTime;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getRefId() {
		return refId;
	}
	public void setRefId(int refId) {
		this.refId = refId;
	}
	public int getRefType() {
		return refType;
	}
	public void setRefType(int refType) {
		this.refType = refType;
	}
	
}
