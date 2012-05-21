/*
 *  AlbumDAO.java
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

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;

import com.liusoft.dlog4j.CapacityExceedException;
import com.liusoft.dlog4j.base.Orderable;
import com.liusoft.dlog4j.beans.AlbumBean;
import com.liusoft.dlog4j.beans.SiteBean;

/**
 * �ಾ���ݿ���ʽӿ�
 * 
 * @author Winter Lau
 */
public class AlbumDAO extends DAO {

	public final static int MAX_ALBUM_COUNT = 20;

	/**
	 * �ж�һ���ಾ�Ƿ�Ϊ�գ�����û����Ƭ�����ಾ
	 * @param album_id
	 * @return
	 */
	public static boolean isAlbumEmpty(int album_id){
		if(executeNamedStatAsInt("PHOTO_COUNT_OF_ALBUM", album_id, album_id) > 0)
			return false;
		//���Ƿ������ಾ
		return executeNamedStatAsInt("SUB_ALBUM_COUNT", album_id)<=0;
	}
	
	/**
	 * �ƶ���Ƭ
	 * 
	 * @param site
	 * @param fromCat
	 * @param toCat
	 * @return �����ƶ���Ƭ������
	 * @throws SQLException
	 */
	public static int movePhoto(int siteid, AlbumBean fromCat,AlbumBean toCat){
		
		if(siteid<=0 || fromCat==null || toCat==null)
			throw new IllegalArgumentException();
		
		if(fromCat.getId()==toCat.getId())
			return 0;
		
		int single_photo_count = 0;
		
		try {
			//1. ����Դ�ಾ���������ಾ����Ƭ�����������������Ƭ
			int photo_count = 0;
			List childs = fromCat.getChilds();
			for(int i=0;childs!=null&&i<childs.size();i++){
				AlbumBean abean = (AlbumBean)childs.get(i);
				photo_count += abean.getPhotoCount();
			}
			
			//2. ����Ҫ�ƶ�����Ƭ��
			single_photo_count = fromCat.getPhotoCount()-photo_count;
			
			//3. �޸���Ƭ���ڵķ���
			beginTransaction();
			executeNamedUpdate("MOVE_PHOTO", toCat.getId(), fromCat.getId(), siteid);

			//4. �޸�Ŀ���ಾ����Ƭ��
			executeNamedUpdate("INC_ALBUM_PHOTO_COUNT", single_photo_count, toCat.getId(), siteid);
			
			//5. �޸�Դ�ಾ�ĸ�һ���ಾ����Ƭ��
			AlbumBean src_parent = fromCat.getParent();
			do{
				if(src_parent == null)
					break;
				executeNamedUpdate("INC_ALBUM_PHOTO_COUNT", -single_photo_count, src_parent.getId(), siteid);
				src_parent = src_parent.getParent();
			}while(true);				

			//6. �޸�Ŀ���ಾ�ĸ�һ���ಾ����Ƭ��
			AlbumBean obj_parent = toCat.getParent();
			do{
				if(obj_parent == null)
					break;
				executeNamedUpdate("INC_ALBUM_PHOTO_COUNT", single_photo_count, obj_parent.getId(), siteid);
				obj_parent = obj_parent.getParent();
			}while(true);				

			//7. ���¼���Դ�ಾ����Ƭ��
			executeNamedUpdate("UPDATE_ALBUM_PHOTO_COUNT", photo_count, fromCat.getId(), siteid);

			//8.�ύ
			commit();
		} catch (HibernateException e) {
			rollback();
			throw e;
		}
		return single_photo_count;
	}

	/**
	 * �����ಾ�ı�Ż�ȡ�ಾ��ϸ��Ϣ
	 * 
	 * @param album_id
	 * @return
	 */
	public static AlbumBean getAlbumByID(int album_id) {
		if(album_id < 1)
			return null;
		return (AlbumBean)DAO.getBean(AlbumBean.class, album_id);
	}

	/**
	 * ��������˳�� �����ڴ��������ʱ���Ѿ����Ա�֤���з���������ĵ����� ���ֱ�ӽ����������������ֵ����
	 * 
	 * @param site
	 * @param linkid
	 * @param up
	 *            ���ϵ����������µ���
	 * @throws SQLException
	 */
	public static void move(SiteBean site, int album_id, boolean up){
		List objects = site.getCatalogs();
		for (int i = 0; i < objects.size(); i++) {
			Orderable obj = (Orderable) objects.get(i);
			int sort_order = obj.getSortOrder();
			if (obj.getId() == album_id) {
				if (up) {
					if (i > 0) {
						try {
							Orderable prev = (Orderable) objects.get(i - 1);
							int prev_order = prev.getSortOrder();
							DAO.beginTransaction();
							executeNamedUpdate("UPDATE_ALBUM_ORDER", sort_order, prev.getId());
							executeNamedUpdate("UPDATE_ALBUM_ORDER", prev_order, obj.getId());
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
							executeNamedUpdate("UPDATE_ALBUM_ORDER", sort_order, next.getId());
							executeNamedUpdate("UPDATE_ALBUM_ORDER", next_order, obj.getId());
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
	 * ����ಾ
	 * 
	 * @param parentId
	 * @param obj
	 * @param pos
	 * @param up
	 * @throws SQLException
	 * @throws CapacityExceedException
	 */
	public static void create(int parentId, AlbumBean obj, int pos, int direction)
			throws CapacityExceedException {
		Session ssn = getSession();
		int order_value = 1;
		if (pos > 0) {
			AlbumBean friend = getAlbumByID(pos);
			order_value = friend.getSortOrder();
		}
		// ���ڵ�
		if (parentId > 0){
			AlbumBean parent = (AlbumBean)DAO.getBean(AlbumBean.class, parentId);
			if(parent!=null)
				obj.setParent(parent);
		}

		obj.setSortOrder(order_value - ((direction==1) ? 1 : 0));
		try {
			beginTransaction();
			ssn.save(obj);
			// ���¶�ȡ�����б�����˳���������
			List albums = findNamedAll("LIST_ALBUM",obj.getSite().getId());
			if (albums.size() >= ConfigDAO.getMaxAlbumCount(obj.getSite().getId()))
				throw new CapacityExceedException(albums.size());
			if (albums.size() > 1) {
				for (int i = 0; i < albums.size(); i++) {
					Orderable lb = (Orderable) albums.get(i);
					executeNamedUpdate("UPDATE_ALBUM_ORDER", i+1, lb.getId());
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
	 * �˴����ܸ�ΪHQL��ʽִ�У���Ϊ��Ҫ���м���ɾ��
	 * @param siteid
	 * @param linkid
	 * @return
	 * @throws SQLException
	 */
	public static void delete(int siteid, int album_id){
		AlbumBean album = (AlbumBean)getBean(AlbumBean.class, album_id);
		if(album!=null && album.getSite().getId()==siteid)
			delete(album);
	}
}
