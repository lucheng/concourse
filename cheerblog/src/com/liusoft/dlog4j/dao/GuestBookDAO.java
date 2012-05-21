/*
 *  GuestBookDAO.java
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
package com.liusoft.dlog4j.dao;

import java.util.Date;
import java.util.List;

import com.liusoft.dlog4j.beans.GuestBookBean;
import com.liusoft.dlog4j.beans.SiteBean;

/**
 * ���Ա������ݷ��ʽӿ�
 * @author Winter Lau
 */
public class GuestBookDAO extends DAO {
	
	/**
	 * ��ȡĳ��������Ϣ
	 * @param msg_id
	 * @return
	 */
	public static GuestBookBean getMsg(int siteid, int msg_id){
		if(msg_id < 0)
			return null;
		GuestBookBean gbb = (GuestBookBean)getBean(GuestBookBean.class, msg_id);
		if(gbb.getSiteId()==siteid)
			return gbb;
		return null;
	}

	/**
	 * ��ȡĳ��վ������԰���Ϣ��
	 * @param site
	 * @return
	 */
	public static int getMsgCount(SiteBean site){
		if(site == null) return -1;
		return executeNamedStatAsInt("GUESTBOOK_COUNT", site.getId());
	}

	/**
	 * ��ȡĳ��վ��������԰���Ϣ��
	 * @param site
	 * @return
	 */
	public static int getNewMsgCount(SiteBean site, int fromId){
		if(site == null) return -1;
		return executeNamedStat("GUESTBOOK_COUNT_AFTER", site.getId(), fromId).intValue();
	}
	
	/**
	 * ��ҳ������Ա��е�������Ϣ
	 * @param site
	 * @param fromIdx
	 * @param fetchCount
	 * @return
	 */
	public static List listMsgs(SiteBean site, int fromIdx, int fetchCount){
		return executeNamedQuery("LIST_GUESTBOOK", fromIdx, fetchCount, site.getId());
	}
	
	/**
	 * ɾ�����԰��еĿ�����Ϣ
	 * @param site
	 * @param msg_id
	 * @return
	 */
	public static int deleteMsg(int siteid, int msg_id){
		return commitNamedUpdate("DELETE_GUESTBOOK", msg_id, siteid);
	}
	
	/**
	 * д��һ���µ����԰���Ϣ
	 * @param gbb
	 */
	public static void createMsg(GuestBookBean gbb){
		if(gbb.getCreateTime()==null)
			gbb.setCreateTime(new Date());
		save(gbb);
	}

}
