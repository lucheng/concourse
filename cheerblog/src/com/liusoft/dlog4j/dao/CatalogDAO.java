/*
 *  CatalogDAO.java
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
 */
package com.liusoft.dlog4j.dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.liusoft.dlog4j.CapacityExceedException;
import com.liusoft.dlog4j.SessionUserObject;
import com.liusoft.dlog4j.base.Orderable;
import com.liusoft.dlog4j.beans.CatalogBean;
import com.liusoft.dlog4j.beans.CatalogPermBean;
import com.liusoft.dlog4j.beans.CatalogUserKey;
import com.liusoft.dlog4j.beans.DiaryBean;
import com.liusoft.dlog4j.beans.SiteBean;

/**
 * �ռǷ������ݿ���ʽӿ�
 * 
 * @author liudong
 */
public class CatalogDAO extends DAO {

	public final static int MAX_CATALOG_COUNT = 10;

	/**
	 * ɾ������Ȩ��
	 * 
	 * @param catalog_id
	 * @param user_id
	 * @return
	 * @throws SQLException
	 */
	public static int deletePermission(int catalog_id, int user_id){
		return commitNamedUpdate("DELETE_CATALOG_PERM", catalog_id, user_id);
	}

	/**
	 * ��������Ȩ��
	 * 
	 * @param catalog_id
	 * @param user_id
	 * @param role
	 * @return
	 * @throws SQLException
	 */
	public static int updatePermission(int catalog_id, int user_id, int role){
		return commitNamedUpdate("UPDATE_CATALOG_PERM", role, catalog_id, user_id);
	}

	/**
	 * �������߸���Ȩ��
	 * 
	 * @param catalog_id
	 * @param user_id
	 * @param role
	 * @throws SQLException
	 */
	public static void createPermission(int catalog_id, int user_id, int role){
		CatalogPermBean cpb = new CatalogPermBean();
		cpb.setRole(role);
		cpb.setKey(new CatalogUserKey(catalog_id, user_id));
		saveOrUpdate(cpb);
	}

	/**
	 * �����û���ĳ�������ȵķ���Ȩ��
	 * 
	 * @param catalog_id
	 * @param user_id
	 * @return ����-1��ʾ���û���ָ��������������Ȩ��
	 */
	public static int getUserRoleInCatalog(int catalog_id, int user_id) {
		Number res = executeNamedStat("GET_ROLE_IN_CATALOG", catalog_id, user_id);
		return (res != null) ? res.intValue() : -1;
	}

	/**
	 * �г���ĳ�����������������Ȩ�޵������û� ���������ͨ�����з����ռ��Լ����Ķ�˽�з����е����»��߿���˽�з����з����ռ�
	 * 
	 * @param catalog_id
	 * @return
	 */
	public static List listSpecialPopedomUsersByCatalog(int catalog_id) {
		return findNamedAll("LIST_USER_IN_CATALOG",catalog_id);
	}

	/**
	 * ͳ�Ʒ�����ָ��״̬���ռ��ж���
	 * 
	 * @param catalog_id
	 * @param all
	 * @param status
	 * @return
	 */
	public static int getDiaryCount(int catalog_id, boolean all, int status) {
		String hql = "SELECT COUNT(*) FROM DiaryBean AS d WHERE d.catalog.id=?";
		if (!all){
			hql += " AND d.status=?";
			return executeStatAsInt(hql, catalog_id, status);
		}
		return executeStatAsInt(hql, catalog_id);
	}
	
	/**
	 * ���ĳ�������µ������ռǵ�������
	 * 
	 * @param site
	 * @param catalog_id
	 * @return
	 * @throws SQLException
	 */
	public static int removeDiary(SiteBean site, int catalog_id){
		try {
			beginTransaction();
			int er = executeNamedUpdate("UPDATE_DIARY_STATUS_IN_CATALOG", DiaryBean.STATUS_DELETED, catalog_id, site.getId());
			executeNamedUpdate("UPDATE_CATALOG_DIARY_COUNT", 0, catalog_id, site.getId());
			commit();
			return er;
		} catch (HibernateException e) {
			rollback();
			throw e;
		}
	}

	/**
	 * �ƶ��ռ�
	 * 
	 * @param site
	 * @param fromCatalogId
	 * @param toCatalogId
	 * @return
	 * @throws SQLException
	 */
	public static int moveDiary(SiteBean site, CatalogBean fromCat, CatalogBean toCat){
		try {
			beginTransaction();
			int er = executeNamedUpdate("MOVE_DIARY", toCat.getId(), fromCat.getId(), site.getId());

			executeNamedUpdate("UPDATE_CATALOG_DIARY_COUNT", 0, fromCat.getId(), site.getId());
			executeNamedUpdate("INC_CATALOG_DIARY_COUNT", fromCat.getArticleCount(), toCat.getId(), site.getId());
			
			commit();
			return er;
		} catch (HibernateException e) {
			rollback();
			throw e;
		}
	}

	/**
	 * �ж�ĳ���û��Ƿ��з���ָ���ռǷ����Ȩ��(���)
	 * 
	 * @param catalog
	 * @param user
	 * @return
	 * @throws HibernateException
	 */
	public static boolean canUserViewThisCatalog(CatalogBean catalog,
			SessionUserObject user) throws HibernateException {
		if (catalog.getType() == CatalogBean.TYPE_OWNER) {
			if (user == null)
				return false;
			if (catalog.getSite().isOwner(user))
				return true;
			else {
				return executeNamedStatAsInt("CHECK_USER_PERM_IN_CATALOG",catalog.getId(),user.getId()) > 0 ;
			}
		}
		return true;
	}

	/**
	 * �����ռǷ���ı�Ż�ȡ�ռǷ�����ϸ��Ϣ
	 * 
	 * @param catalog_id
	 * @return
	 */
	public static CatalogBean getCatalogByID(int catalog_id) {
		if(catalog_id < 0)
			return null;
		return (CatalogBean)getBean(CatalogBean.class, catalog_id);
	}

	/**
	 * �ж��û���ĳ�������µ�Ȩ��
	 * 
	 * @param perms
	 * @param catalog_id
	 * @param user_id
	 * @return
	 */
	private static int getUserRoleInCatalog(List perms, CatalogBean catalog,
			SessionUserObject user) {
		if(catalog==null || user==null || perms==null)
			return -1;
		for (int i = 0; i < perms.size(); i++) {
			CatalogPermBean perm = (CatalogPermBean) perms.get(i);
			if (perm.getKey().getCatalog() == catalog.getId()
					&& perm.getKey().getUser() == user.getId())
				return perm.getRole();
		}
		return -1;
	}
	
	/**
	 * ��ѯ�û���ĳ��վ���Ͽ�д�ռǵķ�����
	 * @param site
	 * @param user
	 * @return
	 */
	public static boolean userCanBlog(SiteBean site, SessionUserObject user){
		if(site == null || user==null)
			return false;
		if(site.isOwner(user))
			return true;
		return executeNamedStatAsInt("CHECK_USER_CAN_DIARY", user.getId(), CatalogPermBean.ROLE_BLOG, site.getId())>0;
	}

	/**
	 * �г���ĳ��վ��ĳ���û��ɼ������з��� (�˷���Ӧ����sessionһ��������)
	 * 
	 * @param site
	 * @param user_id
	 * @param maintain
	 *            ������д�ռǻ��������
	 * @return
	 * @throws HibernateException
	 */
	public static List listCatalogs(SiteBean site, SessionUserObject user, boolean maintain) {
		List catalogs = new ArrayList();
		catalogs.addAll(site.getCatalogs());
		List perms = null;
		if(user != null){
			Query q = getSession().getNamedQuery("USER_PERMS");
			q.setInteger(0, user.getId());
			perms = q.list();
		}
		Iterator iter = catalogs.iterator();
		while (iter.hasNext()) {
			CatalogBean catalog = (CatalogBean) iter.next();
			// ���ɷ����κ��˶����Է���
			if (catalog.getType() == CatalogBean.TYPE_FREE)
				continue;
			int role = getUserRoleInCatalog(perms, catalog, user);
			if (!maintain) {// �����
				if (catalog.getType() != CatalogBean.TYPE_GENERAL) {
					if (role < 0)
						iter.remove();
				}
			} else {// д�ռ���
				if (catalog.getType() == CatalogBean.TYPE_GENERAL)
					iter.remove();
				else {
					if (role != CatalogPermBean.ROLE_BLOG)
						iter.remove();
				}
			}
		}
		return catalogs;
	}

	/**
	 * ��������˳�� �����ڴ��������ʱ���Ѿ����Ա�֤���з���������ĵ����� ���ֱ�ӽ����������������ֵ����
	 * 
	 * @param site
	 * @param linkid
	 * @param up
	 *            ���ϵ����������µ���
	 */
	public static void move(SiteBean site, int cat_id, boolean up){
		List objects = site.getCatalogs();
		for (int i = 0; i < objects.size(); i++) {
			Orderable obj = (Orderable) objects.get(i);
			int sort_order = obj.getSortOrder();
			if (obj.getId() == cat_id) {
				if (up) {
					if (i > 0) {
						try {
							Orderable prev = (Orderable) objects.get(i - 1);
							int prev_order = prev.getSortOrder();
							beginTransaction();
							executeNamedUpdate("UPDATE_CATALOG_ORDER",sort_order, prev.getId());
							executeNamedUpdate("UPDATE_CATALOG_ORDER",prev_order, obj.getId());
							commit();
						} catch (HibernateException e) {
							rollback();
							throw e;
						}
					}
				} else {
					if (i < (objects.size() - 1)) {
						try {
							Orderable next = (Orderable) objects.get(i + 1);
							int next_order = next.getSortOrder();
							beginTransaction();
							executeNamedUpdate("UPDATE_CATALOG_ORDER",sort_order, next.getId());
							executeNamedUpdate("UPDATE_CATALOG_ORDER",next_order, obj.getId());
							commit();
						} catch (HibernateException e) {
							rollback();
							throw e;
						}
					}
				}
				break;
			}
		}
	}

	/**
	 * ����ռǷ���
	 * 
	 * @param lnk
	 * @param pos
	 * @param dir
	 * @throws SQLException
	 * @throws CapacityExceedException
	 */
	public static void create(CatalogBean obj, int pos, boolean up){
		Session ssn = getSession();
		int order_value = 1;
		if (pos > 0) {
			CatalogBean friend = (CatalogBean) ssn.get(CatalogBean.class,
					new Integer(pos));
			order_value = friend.getSortOrder();
		}
		obj.setSortOrder(order_value - (up ? 1 : 0));
		try {
			beginTransaction();
			ssn.save(obj);
			List catalogs = findNamedAll("LIST_CATALOGS",obj.getSite().getId());
			if (catalogs.size() > 1) {
				for (int i = 0; i < catalogs.size(); i++) {					
					Orderable lb = (Orderable) catalogs.get(i);
					executeNamedUpdate("UPDATE_CATALOG_ORDER",(i+1),lb.getId());
				}
			}
			commit();
		} catch (HibernateException e) {
			rollback();
			throw e;
		}
	}

	/**
	 * ɾ���ռǷ���
	 * 
	 * @param siteid
	 * @param linkid
	 * @return
	 * @throws SQLException
	 */
	public static void delete(int siteid, int catalog_id){
		commitNamedUpdate("DELETE_CATALOG", siteid, catalog_id);
	}

}
