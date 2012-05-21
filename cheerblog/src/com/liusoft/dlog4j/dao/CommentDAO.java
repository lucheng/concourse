/*
 *  CommentDAO.java
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
 *  2006-7-22
 */
package com.liusoft.dlog4j.dao;

import java.util.List;

import com.liusoft.dlog4j.beans.CommentBean;

/**
 * �������ݿ�����ӿ�
 * @author liudong
 */
public class CommentDAO extends DAO {

	/**
	 * ɾ��ĳ������
	 * @param cmt_id
	 * @return
	 */
	public static int deleteCommentByID(int cmt_id){
		return delete(CommentBean.class, cmt_id);
	}
	
	/**
	 * �г�ĳ�����������
	 * @param eid
	 * @param etype
	 * @param fromIdx
	 * @param fetchSize
	 * @param reverse
	 * @param withContent
	 * @return
	 */
	public static List listComments(int eid, int etype, int fromIdx,
			int fetchSize, boolean reverse, boolean withContent) {
		StringBuffer hql = new StringBuffer("FROM ");
		hql.append(withContent?"CommentBean":"CommentOutlineBean");
		hql.append(" AS c WHERE c.eid=? AND c.etype=? ORDER BY c.id");
		if(reverse)	hql.append(" DESC");
		return executeQuery(hql.toString(), fromIdx, fetchSize, eid, etype);
	}
	
	/**
	 * �г�ĳ��������������
	 * @param siteid
	 * @param etype
	 * @param fromIdx
	 * @param fetchSize
	 * @return
	 */
	public static List listNewestComments(int siteid, int etype, int fromIdx, int fetchSize){
		String hql = "FROM CommentOutlineBean c WHERE c.site.id=? AND c.etype=? ORDER BY c.id DESC";
		return executeQuery(hql, fromIdx, fetchSize, siteid, etype);
	}
	
	/**
	 * �г�ĳ��վ���������µ�����
	 * @param siteid
	 * @param fromIdx
	 * @param fetchSize
	 * @return
	 */
	public static List listNewestComments(int siteid, int fromIdx, int fetchSize){
		String hql = "FROM CommentOutlineBean c WHERE c.site.id=? ORDER BY c.id DESC";
		return executeQuery(hql, fromIdx, fetchSize, siteid);
	}
	
}
