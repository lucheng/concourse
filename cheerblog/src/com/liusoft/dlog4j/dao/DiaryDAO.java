/*
 *  DiaryDAO.java
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

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;

import com.liusoft.dlog4j.SessionUserObject;
import com.liusoft.dlog4j.base._ReplyBean;
import com.liusoft.dlog4j.base._BeanBase;
import com.liusoft.dlog4j.beans.DiaryOutlineBean;
import com.liusoft.dlog4j.beans.DiaryReplyBean;
import com.liusoft.dlog4j.beans.TagBean;
import com.liusoft.dlog4j.beans.BookmarkBean;
import com.liusoft.dlog4j.beans.CatalogBean;
import com.liusoft.dlog4j.beans.DiaryBean;
import com.liusoft.dlog4j.beans.SiteBean;
import com.liusoft.dlog4j.beans.UserBean;
import com.liusoft.dlog4j.search.SearchDataProvider;
import com.liusoft.dlog4j.util.DateUtils;

/**
 * �ռ����ݿ���ʽӿ�
 * 
 * @author liudong
 */
public class DiaryDAO extends DAO implements SearchDataProvider {

	public final static int MAX_RESULT_COUNT = 100; // �������ļ�¼��

	/**
	 * ���þ����ռ�
	 * @param diary_id
	 * @param elite
	 * @return
	 */
	public static int markDiaryAsElite(int diary_id, boolean elite){
		return commitNamedUpdate("MODIFY_TYPE_OF_DIARY", elite?DiaryBean.TYPE_ELITE:0, diary_id);
	}
	
	/**
	 * �г����µ��ռ�
	 * @param fromIdx
	 * @param count
	 * @return
	 */
	public static List listNewArticles(int fromIdx, int count){
		return executeNamedQuery("LIST_NEW_DIARY", fromIdx, count,
				DiaryOutlineBean.STATUS_NORMAL, CatalogBean.TYPE_OWNER);
	}

	/**
	 * ��ȡ����ר����־��Site��days���ڵ������ŵ�����,��������������
	 * @param days
	 * @param count
	 * @return
	 */
	public static List listHotArticles(int days, int count){
		Calendar cal = Calendar.getInstance();
		DateUtils.resetTime(cal);
		cal.add(Calendar.DATE, -days);
		return executeNamedQuery("LIST_HOT_DIARY2", 0, count,
				new Object[]{DiaryOutlineBean.I_STATUS_NORMAL, cal.getTime(),
				CatalogBean.I_TYPE_OWNER});
	}

	/**
	 * ��ȡĳ��Site��days���ڵ������ŵ�����,��������������
	 * @param days
	 * @param count
	 * @return
	 */
	public static List listHotArticles(int siteid, int days, int count){
		Calendar cal = Calendar.getInstance();
		DateUtils.resetTime(cal);
		cal.add(Calendar.DATE, -days);
		return executeNamedQuery("LIST_HOT_DIARY", 0, count, new Object[] {
				new Integer(siteid), DiaryOutlineBean.I_STATUS_NORMAL,
				cal.getTime(), CatalogBean.I_TYPE_OWNER });		
	}

	/**
	 * ��ȡĳ��Site��days����ǰ�����ŵ�����,��������������
	 * @param days
	 * @param count
	 * @return
	 */
	public static List listHotArticlesBefore(int siteid, int days, int count){
		Calendar cal = Calendar.getInstance();
		DateUtils.resetTime(cal);
		cal.add(Calendar.DATE, - days + 1);

		return executeNamedQuery("LIST_HOT_DIARY3", 0, count, new Object[] {
				new Integer(siteid), DiaryOutlineBean.I_STATUS_NORMAL,
				cal.getTime(), CatalogBean.I_TYPE_OWNER });
	}

	/**
	 * ����ָ��վ����ռ�����,���û��ָ��վ���򷵻������ռ���
	 * @param site
	 * @return
	 */
	public static int getDiaryCount(int site){
		String hql = "SELECT COUNT(*) FROM DiaryBean AS d WHERE d.status=?";
		if(site>0){
			hql += " AND d.site.id=?";
			return executeStatAsInt(hql, DiaryBean.STATUS_NORMAL, site);
		}
		return executeStatAsInt(hql, DiaryBean.STATUS_NORMAL);
	}
	
	/**
	 * ���������лָ��ռ�
	 * @param log
	 */
	public static void unDelete(DiaryOutlineBean log){
		Session ssn = getSession();
		try{
			beginTransaction();
			log.setStatus(DiaryBean.STATUS_NORMAL);
			log.getCatalog().incArticleCount(1);
			log.getOwner().getCount().incArticleCount(1);
			
			//���в�����ռ������ߵ��ռ���������һ
			List rpls = log.getReplies();
			for(int i=0;rpls!=null && i<rpls.size();i++){
				DiaryReplyBean prb = (DiaryReplyBean)rpls.get(i);
				if(prb.getUser()!=null)
					prb.getUser().getCount().incArticleReply(1);
			}			
			
			ssn.update(log);
			commit();			
		}catch(HibernateException e){
			rollback();
			throw e;
		}
	}
	
	/**
	 * ����
	 * @param log
	 */
	public static void lock(int log_id){
		setLock(log_id, 1);
	}
	
	/**
	 * ����
	 * @param log
	 */
	public static void unlock(int log_id){
		setLock(log_id, 0);
	}

	/**
	 * ����/�����ռ�
	 * @param log
	 */
	protected static void setLock(int log_id, int lock){
		commitNamedUpdate("LOCK_DIARY", lock, log_id);
	}

	/**
	 * ͳ��ָ���·�ÿ����ռ���
	 * @param site
	 * @param loginUser
	 * @param month
	 * @return
	 */
	public static int[] statCalendarLogs(SiteBean site, SessionUserObject user, Calendar month)
	{
		Calendar firstDate = (Calendar)month.clone();
		firstDate.set(Calendar.DATE,1);
		DateUtils.resetTime(firstDate);
		Calendar nextMonthFirstDate = (Calendar)firstDate.clone();
		nextMonthFirstDate.add(Calendar.MONTH,1);
		
		//����ָ���·��ж�����
		Calendar tempCal = (Calendar)nextMonthFirstDate.clone();
		tempCal.add(Calendar.DATE,-1);
		int dateCount = tempCal.get(Calendar.DATE);			
		int[] logCounts = new int[dateCount+1];
		
		//��ѯ�����µ������ռǽ���ͳ��

		StringBuffer hql = new StringBuffer("SELECT j.writeTime FROM DiaryBean AS j WHERE j.writeTime>=:beginTime AND j.writeTime<:endTime AND j.status=:status AND j.site.id=:site");
		if(!site.isOwner(user)){
			//�ų��û�û��Ȩ�޷��ʵķ���
			hql.append(" AND (j.catalog.type<>:cat_type");
			if(user != null)
				hql.append(" OR (j.catalog.type=:cat_type AND j.catalog.id IN (SELECT p.key.catalog FROM CatalogPermBean AS p WHERE p.key.user=:user))");
			hql.append(')');
		}
		
		Session ssn = getSession();
		
		try{
			Query q = ssn.createQuery(hql.toString()).setCacheable(true);
			q.setTimestamp("beginTime", firstDate.getTime());
			q.setTimestamp("endTime", nextMonthFirstDate.getTime());
			q.setInteger("status", DiaryBean.STATUS_NORMAL);
			q.setInteger("site", site.getId());
			if(!site.isOwner(user)){
				q.setInteger("cat_type", CatalogBean.TYPE_OWNER);
				if(user != null)
					q.setInteger("user", user.getId());
			}
			int total = 0;
			Iterator logs = q.list().iterator();
			while(logs.hasNext()){
				tempCal.setTime((Date)logs.next());
				int date = tempCal.get(Calendar.DATE);
				logCounts[date]++;
				total ++;
			}
			
			logCounts[0] = total;  
			
			return logCounts;
		}finally{
			hql = null;
			firstDate = null;
			nextMonthFirstDate = null;
			tempCal = null;
		}
	}
	
	/**
	 * ����ĳվ�ı�ɾ�����ռ���
	 * @param site
	 * @param user
	 * @return
	 */
	public static int getTrashCount(int site_id){
		return executeNamedStat("DIARY_COUNT_BY_STATUS", site_id, DiaryBean.STATUS_DELETED).intValue();
	}
	
	/**
	 * ����ĳվ�ı�ɾ���������ռ�
	 * @param site
	 * @param user
	 * @return
	 */
	public static List listTrash(int site_id){
		return listTrash(site_id, -1, -1);
	}
	
	public static List listTrash(int site_id, int fromIdx, int count){
		return executeNamedQuery("LIST_DIARY_BY_STATUS",fromIdx,count,site_id, DiaryBean.STATUS_DELETED);
	}
	
	/**
	 * ����ĳ�˵��ռǲݸ���
	 * @param site
	 * @param user
	 * @return
	 */
	public static int getDraftCount(SiteBean site, int userid){		
		return executeNamedStatAsInt("DRAFT_COUNT", site.getId(),userid, DiaryBean.STATUS_DRAFT);
	}
	
	/**
	 * ����ĳ�˵����вݸ��
	 * @param site
	 * @param user
	 * @return
	 */
	public static List listDrafts(SiteBean site, int userid){
		return listDrafts(site, userid, -1, -1);
	}

	public static List listDrafts(SiteBean site, int userid, int fromIdx, int count){
		return executeNamedQuery("LIST_DRAFT",fromIdx,count,site.getId(),userid,DiaryBean.STATUS_DRAFT);
	}
	
	/**
	 * �����ռǵ��Ķ���
	 * @param log_id
	 * @param incCount
	 * @return
	 */
	public static void incViewCount(int log_id, int incCount){
		commitNamedUpdate("INC_DIARY_VIEW_COUNT",
				new Object[] { new Integer(incCount),
						new Timestamp(System.currentTimeMillis()),
						new Integer(log_id) });
	}
	
	/**
	 * ���ռ���Ϊɾ��״̬
	 * @param log_id
	 * @throws SQLException 
	 */
	public static void delete(DiaryBean log){
		try{
			beginTransaction();
			log.getCatalog().incArticleCount(-1);
			log.getOwner().getCount().incArticleCount(-1);

			//���в�����ռ������ߵ��ռ���������һ
			List rpls = log.getReplies();
			for(int i=0;i<rpls.size();i++){
				DiaryReplyBean prb = (DiaryReplyBean)rpls.get(i);
				if(prb.getUser()!=null)
					prb.getUser().getCount().incArticleReply(-1);
			}			
			
			log.setStatus(DiaryBean.STATUS_DELETED);
			commit();
		}catch(HibernateException e){
			rollback();
			throw e;
		}
	}

	/**
	 * ����ɾ���ռǰ���������(�����κ�Ȩ���ж�)
	 * @param log_id
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public static void forceDelete(int log_id) throws Exception{
		Session ssn = getSession();
		try{
			DiaryBean log = (DiaryBean)ssn.load(DiaryBean.class, new Integer(log_id));
			beginTransaction();
			//����������ռ����Ӧ�ķ����ռ�����һ
			if(log.getStatus()==DiaryBean.STATUS_NORMAL){
				log.getCatalog().incArticleCount(-1);
			}
			//ɾ����ǩ
			TagDAO.deleteTagByRefId(log_id, TagBean.TYPE_DIARY);
			
			//ɾ������
			FCKUploadFileDAO.deleteFilesByRef(ssn, log.getSite().getId(), log_id,
					DiaryBean.TYPE_DIARY);

			//���в������Ƭ�����ߵ������������һ
			cleanupReplies(ssn, log_id);
			
			//ɾ���ռ�
			ssn.delete(log);
			commit();
		}catch(HibernateException e){
			rollback();
			throw e;
		}
	}

	/**
	 * ����ɾ��ĳ����վ��������
	 * @param site_id
	 * @throws SQLException 
	 * @throws IOException 
	 */
	public static void cleanupTrash(int site_id) throws Exception{
		List logs = findNamedAll("QUERY_TRASH_BEFORE_CLEANUP",site_id, DiaryBean.STATUS_DELETED);
		if(logs!=null && logs.size()>0){
			try{
				Session ssn = getSession();
				beginTransaction();	
				for(int i=0;i<logs.size();i++){
					DiaryOutlineBean log = (DiaryOutlineBean)logs.get(i);
					
					//ɾ�����ռǵ���������
					cleanupReplies(ssn, log.getId());
					//ɾ����ǩ
					TagDAO.deleteTagByRefId(log.getId(), TagBean.TYPE_DIARY);					
					//ɾ������
					FCKUploadFileDAO.deleteFilesByRef(ssn, site_id, log.getId(), DiaryBean.TYPE_DIARY);
					//ɾ���ռ�
					ssn.delete(log);
				}
				commit();
			}catch(HibernateException e){
				rollback();
				throw e;
			}
		}
	}

	/**
	 * ɾ���ռ�����,�Զ����ٶ�Ӧ�ռǵ�������
	 * @param reply
	 */
	private static int cleanupReplies(Session ssn, int log_id){
		return executeNamedUpdate("DELETE_REPLIES_OF_DIARY", log_id);
	}

	/**
	 * �ж��û��Ƿ��б༭ĳƪ�ռǵ�Ȩ��
	 * @param user
	 * @param diary
	 * @return
	 */
	public static boolean canUserEditDiary(SessionUserObject user, DiaryBean diary){
		if(user==null || diary==null || user.getStatus()!=UserBean.STATUS_NORMAL)
			return false;
		if(diary.getOwner().getId()==user.getId())
			return true;
		if(diary.getSite().isOwner(user))
			return true;
		return false;
	}
	/**
	 * �õ�ָ���ռǵ���һƪ(������ʾ�ռ�ҳ)
	 * @param site
	 * @param user
	 * @param cat_id
	 * @param log_id
	 * @return
	 */
	public static DiaryOutlineBean getPrevDiary(SiteBean site, SessionUserObject user, int cat_id, int log_id){
		if(site==null) 
			return null;
		StringBuffer hql = new StringBuffer("FROM DiaryOutlineBean AS j WHERE j.site.id=:site AND j.status=:status AND j.id<:diary");
		if(!site.isOwner(user)){
			//�ų��û�û��Ȩ�޷��ʵķ���
			hql.append(" AND (j.catalog.type<>:type");
			if(user != null)
				hql.append(" OR (j.catalog.type=:type AND j.catalog.id IN (SELECT p.key.catalog FROM CatalogPermBean AS p WHERE p.key.user=:user))");
			hql.append(')');
		}
		if (cat_id > 0){
			hql.append(" AND j.catalog.id=:catalog");
		}
		hql.append(" ORDER BY j.id DESC");
		Session ssn = getSession();
		try{
			Query q = ssn.createQuery(hql.toString());
			q.setInteger("site", site.getId());
			q.setInteger("status", DiaryBean.STATUS_NORMAL);
			q.setInteger("diary", log_id);
			if(cat_id > 0)
				q.setInteger("catalog", cat_id);
			if(!site.isOwner(user)){
				q.setInteger("type", CatalogBean.TYPE_OWNER);
				if(user != null)
					q.setInteger("user", user.getId());
			}
			q.setMaxResults(1);
			return (DiaryOutlineBean)q.uniqueResult();
		}finally{
			hql = null;
		}
	}

	/**
	 * �õ�ָ���ռǵ���һƪ(������ʾ�ռ�ҳ)
	 * @param site
	 * @param user
	 * @param cat_id
	 * @param log_id
	 * @return
	 */
	public static DiaryOutlineBean getNextDiary(SiteBean site, SessionUserObject user, int cat_id, int log_id){
		if(site==null) return null;
		StringBuffer hql = new StringBuffer("FROM DiaryOutlineBean AS j WHERE j.site.id=:site AND j.status=:status AND j.id>:diary");
		if(!site.isOwner(user)){
			//�ų��û�û��Ȩ�޷��ʵķ���
			hql.append(" AND (j.catalog.type<>:type");
			if(user != null)
				hql.append(" OR (j.catalog.type=:type AND j.catalog.id IN (SELECT p.key.catalog FROM CatalogPermBean AS p WHERE p.key.user=:user))");
			hql.append(')');
		}
		if (cat_id > 0){
			hql.append(" AND j.catalog.id=:catalog");
		}
		hql.append(" ORDER BY j.id ASC");
		Session ssn = getSession();
		try{
			Query q = ssn.createQuery(hql.toString());
			q.setInteger("site", site.getId());
			q.setInteger("status", DiaryBean.STATUS_NORMAL);
			q.setInteger("diary", log_id);
			if(cat_id > 0)
				q.setInteger("catalog", cat_id);
			if(!site.isOwner(user)){
				q.setInteger("type", CatalogBean.TYPE_OWNER);
				if(user != null)
					q.setInteger("user", user.getId());
			}
			q.setMaxResults(1);
			return (DiaryOutlineBean)q.uniqueResult();
		}finally{
			hql = null;
		}
	}
	
	/**
	 * ����ռ�
	 * @param journal
	 * @param add_bookmark
	 * @throws HibernateException
	 * @throws SQLException 
	 */
	public static void create(DiaryBean journal, boolean add_bookmark){
		try{
			Session ssn = getSession();
			beginTransaction();
			if(journal.getStatus()==DiaryBean.STATUS_NORMAL){
				journal.getCatalog().incArticleCount(1);
				journal.getOwner().getCount().incArticleCount(1);
			}
			ssn.save(journal);	
			if(journal.getCatalog().getType()==CatalogBean.TYPE_GENERAL){
				//ֻ�й��������е��ռǲſ������ñ�ǩ
				List tags = journal.getKeywords();
				if(tags!=null && tags.size()>0){
					int tag_count = 0;
					for(int i=0;i<tags.size();i++){
						if(tag_count>=MAX_TAG_COUNT)
							break;
						String tag_name = (String)tags.get(i);
						if(tag_name.getBytes().length > MAX_TAG_LENGTH)
							continue;
						TagBean tag = new TagBean();
						tag.setSite(journal.getSite());
						tag.setRefId(journal.getId());
						tag.setRefType(DiaryBean.TYPE_DIARY);
						tag.setName(tag_name);
						ssn.save(tag);
						tag_count ++;
					}
				}
			}
			if(add_bookmark){
				BookmarkBean bmb = new BookmarkBean();
				bmb.setOwner(journal.getOwner());
				bmb.setSite(journal.getSite());
				bmb.setCreateTime(new Date());
				bmb.setParentId(journal.getId());
				bmb.setParentType(_BeanBase.TYPE_DIARY);
				bmb.setTitle(journal.getTitle());
				journal.getOwner().getCount().incBookmarkCount(1);
				ssn.save(bmb);
			}
			commit();
		}catch(HibernateException e){
			rollback();
			throw e;
		}
	}
	
	/**
	 * �޸��ռ�
	 * @param diary
	 */
	public static void update(DiaryBean diary, boolean updateTags){
		try{
			beginTransaction();			
			if(updateTags){				
				TagDAO.deleteTagByRefId(diary.getId(), DiaryBean.TYPE_DIARY);	
				if(diary.getCatalog().getType()==CatalogBean.TYPE_GENERAL){
					List tags = diary.getKeywords();
					if(tags!=null && tags.size()>0){
						int tag_count = 0;
						for(int i=0;i<tags.size();i++){
							if(tag_count>=MAX_TAG_COUNT)
								break;
							String tag_name = (String)tags.get(i);
							if(tag_name.getBytes().length > MAX_TAG_LENGTH)
								continue;
							TagBean tag = new TagBean();
							tag.setSite(diary.getSite());
							tag.setRefId(diary.getId());
							tag.setRefType(DiaryBean.TYPE_DIARY);
							tag.setName((String)tags.get(i));
							diary.getTags().add(tag);
							tag_count ++;
						}
					}
				}
			}
			commit();
		}catch(HibernateException e){
			rollback();
			throw e;
		}
	}
	
	/**
	 * �����ռǵı�Ż�ȡ�ռ���ϸ��Ϣ
	 * @param article_id
	 * @return
	 */
	public static DiaryBean getDiaryByID(int article_id){
		if(article_id < 0)
			return null;
		return (DiaryBean)getBean(DiaryBean.class, article_id);
	}

	/**
	 * �����ռǵı�Ż�ȡ�ռǸ�Ҫ��Ϣ
	 * @param article_id
	 * @return
	 */
	public static DiaryOutlineBean getDiaryOutlineByID(int article_id){
		if(article_id < 0)
			return null;
		return (DiaryOutlineBean)getBean(DiaryOutlineBean.class, article_id);
	}
	
	/**
	 * ��ȡ�ռ����ڵķ���
	 * @param log_id
	 * @return
	 */
	public static CatalogBean getCatalogByDiary(int log_id){
		if(log_id < 0)
			return null;
		return (CatalogBean)namedUniqueResult("CATALOG_OF_DIARY", log_id);
	}
	
	/**
	 * ��ȡ�����ռ��������������ص�
	 * @return
	 */
	public static int getPublicDiaryCount(){
		return executeNamedStat("PUBLIC_DIARY_COUNT", DiaryBean.STATUS_NORMAL, CatalogBean.TYPE_OWNER).intValue();
	}
	
	/**
	 * ��ȡָ����վָ��������ռ���
	 * @param site
	 * @param user
	 * @param catalog_id
	 * @param year
	 * @param month
	 * @param date
	 * @return
	 */
	public static int getDiaryCount(SiteBean site, SessionUserObject user, int catalog_id, int year, int month, int date){
		StringBuffer hql = new StringBuffer("SELECT COUNT(*) FROM DiaryBean AS a WHERE a.status=:status AND a.site.id=:site");
		if(!site.isOwner(user)){
			//�ų��û�û��Ȩ�޷��ʵķ���
			hql.append(" AND (a.catalog.type<>:cat_type");
			if(user != null)
				hql.append(" OR (a.catalog.type=:cat_type AND a.catalog.id IN (SELECT p.key.catalog FROM CatalogPermBean AS p WHERE p.key.user=:user))");
			hql.append(')');
		}
		if (catalog_id > 0)
			hql.append(" AND a.catalog.id=:catalog");
		if(year > 0 || month > 0 || date > 0){
			hql.append(" AND a.writeTime >= :beginTime AND a.writeTime < :endTime");
		}
		try {
			Session ssn = getSession();
			Query q = ssn.createQuery(hql.toString());
			q.setInteger("status", DiaryBean.STATUS_NORMAL);
			q.setInteger("site", site.getId());
			if(!site.isOwner(user)){
				q.setInteger("cat_type", CatalogBean.TYPE_OWNER);
				if(user != null){
					q.setInteger("user", user.getId());
				}
			}
			if (catalog_id > 0) {
				q.setInteger("catalog", catalog_id);
			}
			if(year > 0 || month > 0 || date > 0){
				Calendar[] cals = genTimeParams(year,month,date);
				q.setTimestamp("beginTime", cals[0].getTime());
				q.setTimestamp("endTime", cals[1].getTime());
			}
			return ((Number) q.uniqueResult()).intValue();
		} finally {
			hql = null;
		}
	}
	
	/**
	 * ��ȡʱ��ε�ǰ������ʱ���
	 * @param year
	 * @param month
	 * @param date
	 * @return
	 */
	protected static Calendar[] genTimeParams(int year, int month, int date){
		Calendar[] params = new Calendar[2];
		if(year>0&&month>0&&date>0){//��ѯĳ��
			params[0] = DateUtils.getDateBegin(year,month,date);
			params[1] = (Calendar)params[0].clone();
			params[1].add(Calendar.DATE,1);
		}
		else
		if(year>0&&month>0){//��ѯĳ��
			params[0] = DateUtils.getDateBegin(year,month,1);			
			params[1] = (Calendar)params[0].clone();
			params[1].add(Calendar.MONTH,1);
		}
		else
		if(year>0){//��ѯĳ��
			params[0] = DateUtils.getDateBegin(year,1,1);			
			params[1] = (Calendar)params[0].clone();
			params[1].add(Calendar.YEAR,1);
		}	
		return params;
	}

	/**
	 * ��ȡָ����վָ��������ռ�
	 * @param site
	 * @param user
	 * @param catalog_id
	 * @param year
	 * @param month
	 * @param date
	 * @param fromIdx
	 * @param count
	 * @return
	 */
	public static List listDiary(int year,int month,int date,int fromIdx, int count, boolean withContent){
		StringBuffer hql = new StringBuffer("FROM ");		
		hql.append(withContent?"DiaryBean":"DiaryOutlineBean");
		hql.append(" AS a WHERE a.status=:status");
		//�ų��������޵ķ���
		hql.append(" AND (a.catalog.type<>:cat_type)");
		if(year > 0 || month > 0 || date > 0){
			hql.append(" AND a.writeTime >= :beginTime AND a.writeTime < :endTime");
		}
		hql.append(" ORDER BY a.id DESC");
		try {
			Session ssn = getSession();
			Query q = ssn.createQuery(hql.toString());
			q.setInteger("status", DiaryBean.STATUS_NORMAL);
			q.setInteger("cat_type", CatalogBean.TYPE_OWNER);
			if(year > 0 || month > 0 || date > 0){
				Calendar[] cals = genTimeParams(year,month,date);
				q.setTimestamp("beginTime", cals[0].getTime());
				q.setTimestamp("endTime", cals[1].getTime());
			}
			if(fromIdx>0)
				q.setFirstResult(fromIdx);
			if(count>0)
				q.setMaxResults(count);
			return q.list();
		} finally {
			hql = null;
		}
	}

	/**
	 * ��ȡָ����վָ��������ռ�
	 * @param site
	 * @param user
	 * @param catalog_id
	 * @param year
	 * @param month
	 * @param date
	 * @param fromIdx
	 * @param count
	 * @return
	 */
	public static List listDiary(SiteBean site, SessionUserObject user, int catalog_id, int year,int month,int date,
			int fromIdx, int count, boolean withContent){
		StringBuffer hql = new StringBuffer("FROM ");		
		hql.append(withContent?"DiaryBean":"DiaryOutlineBean");
		hql.append(" AS a WHERE a.status=:status AND a.site.id=:site");
		//��������ԱҲ���ܿ���������վ������Ŀ¼(2006-5-22 by Winter Lau)
		if(user==null || site.getOwner().getId() != user.getId()){
			//�ų��û�û��Ȩ�޷��ʵķ���
			hql.append(" AND (a.catalog.type<>:cat_type");
			if(user != null)
				hql.append(" OR (a.catalog.type=:cat_type AND a.catalog.id IN (SELECT p.key.catalog FROM CatalogPermBean AS p WHERE p.key.user=:user))");
			hql.append(')');
		}
		if (catalog_id > 0)
			hql.append(" AND a.catalog.id=:catalog");
		if(year > 0 || month > 0 || date > 0){
			hql.append(" AND a.writeTime >= :beginTime AND a.writeTime < :endTime");
		}
		hql.append(" ORDER BY a.id DESC");
		try {
			Session ssn = getSession();
			Query q = ssn.createQuery(hql.toString());
			q.setInteger("status", DiaryBean.STATUS_NORMAL);
			q.setInteger("site", site.getId());
			if(user==null || site.getOwner().getId() != user.getId()){
				q.setInteger("cat_type", CatalogBean.TYPE_OWNER);
				if(user != null){
					q.setInteger("user", user.getId());
				}
			}
			if (catalog_id > 0) {
				q.setInteger("catalog", catalog_id);
			}
			if(year > 0 || month > 0 || date > 0){
				Calendar[] cals = genTimeParams(year,month,date);
				q.setTimestamp("beginTime", cals[0].getTime());
				q.setTimestamp("endTime", cals[1].getTime());
			}
			if(fromIdx>0)
				q.setFirstResult(fromIdx);
			if(count>0)
				q.setMaxResults(count);
			return q.list();
		} finally {
			hql = null;
		}
	}

	/**
	 * ��ȡĳ��ʱ����Ժ�������������ռ�(SearchEnginePlugIn::buildLogIndex)
	 * @param date
	 * @param max_count
	 * @return
	 * @throws Exception
	 */
	public static List listDiaryAfter(Date date, int max_count){
		return executeNamedQuery("LIST_DIARY_AFTER", 0, max_count, new Object[]{date,
				DiaryBean.I_STATUS_NORMAL, new Integer(CatalogBean.TYPE_OWNER)});
	}

	/**
	 * �������µ�������
	 * @param catalog_id
	 * @param incCount
	 * @return
	 * @throws SQLException
	 */
	static int incTrackBackCount(Session ssn, int log_id, int incCount){
		Query q = ssn.getNamedQuery("INC_DIARY_TB_COUNT");
		q.setInteger(0, incCount);
		q.setInteger(1, log_id);
		return q.executeUpdate();
	}

	/* (non-Javadoc)
	 * @see com.liusoft.dlog4j.search.SearchDataProvider#fetchAfter(java.util.Date)
	 */
	public List fetchAfter(Date beginTime) throws Exception {
		return DiaryDAO.listDiaryAfter(beginTime, -1);
	}

	/**
	 * �г������ռ�����
	 * @param site
	 * @param user
	 * @param fromIdx
	 * @param count
	 * @return
	 */
	public static List listDiaryReplies(SiteBean site, int fromIdx, int count, SessionUserObject user){
		StringBuffer hql = new StringBuffer("FROM DiaryReplyBean AS r WHERE r.status=:status AND r.site.id=:site AND r.diary.status=:diary_status");
		if(!site.isOwner(user)){
			//�ų��û�û��Ȩ�޷��ʵķ���
			hql.append(" AND (r.diary.catalog.type<>:cat_type");
			if(user != null)
				hql.append(" OR (r.diary.catalog.type=:cat_type AND r.diary.catalog.id IN (SELECT p.key.catalog FROM CatalogPermBean AS p WHERE p.key.user=:userid))");
			hql.append(')');
			hql.append(" AND (r.ownerOnly = 0 OR r.user.id = :userid)");
		}
		hql.append(" ORDER BY r.id DESC");
		Session ssn = getSession();
		Query q = ssn.createQuery(hql.toString());
		q.setInteger("status", DiaryReplyBean.STATUS_NORMAL);
		q.setInteger("site", site.getId());
		q.setInteger("diary_status", DiaryOutlineBean.STATUS_NORMAL);
		if(!site.isOwner(user)){
			q.setInteger("cat_type", CatalogBean.TYPE_OWNER);
			q.setInteger("userid", (user!=null)?user.getId():-1);
		}
		if(fromIdx>0)
			q.setFirstResult(fromIdx);
		if(count>0)
			q.setMaxResults(count);
		return q.list();
	}

	/**
	 * ��ҳ�г�ĳƪ�ռǵ�����
	 * @param log_id
	 * @param fromIdx
	 * @param count
	 * @return
	 */
	public static List listDiaryReplies(int log_id, int fromIdx, int count, boolean reverse){
		String hql_name = reverse?"LIST_REPLIES_OF_DIARY":"LIST_REPLIES_OF_DIARY2";
		return executeNamedQuery(hql_name, fromIdx, count, log_id);
	}

	/**
	 * ��ȡĳ��ʱ����Ժ����������������(SearchEnginePlugIn::buildReplyIndex)
	 * @param date
	 * @return
	 * @throws Exception
	 */
	public static List listDiaryRepliesAfter(Date date){
		return findNamedAll("LIST_DIARY_REPLIES", new Object[]{date, _ReplyBean.I_STATUS_NORMAL, CatalogBean.I_TYPE_OWNER});
	}

	/**
	 * ��ȡ��������(j_replies.vm)
	 * @param site
	 * @param user
	 * @return
	 */
	public static int getDiaryReplyCount(SiteBean site, SessionUserObject user){
		StringBuffer hql = new StringBuffer("SELECT COUNT(*) FROM DiaryReplyBean AS r WHERE r.status=? AND r.site.id=?");
		if(!site.isOwner(user)){
			//�ų��û�û��Ȩ�޷��ʵķ���
			hql.append(" AND (r.diary.catalog.type<>?");
			if(user != null)
				hql.append(" OR (r.diary.catalog.type=? AND r.diary.catalog.id IN (SELECT p.key.catalog FROM CatalogPermBean AS p WHERE p.key.user=?))");
			hql.append(')');
		}
		Session ssn = getSession();
		Query q = ssn.createQuery(hql.toString());
		q.setInteger(0, DiaryReplyBean.STATUS_NORMAL);
		q.setInteger(1, site.getId());
		if(!site.isOwner(user)){
			q.setInteger(2, CatalogBean.TYPE_OWNER);
			if(user != null){
				q.setInteger(3, CatalogBean.TYPE_OWNER);
				q.setInteger(4, user.getId());
			}
		}
		return ((Number)q.uniqueResult()).intValue();
	}

	/**
	 * ����ָ��վ����ռ���������
	 * @param site
	 * @return
	 */
	public static int getDiaryReplyCount(int site){
		String hql = "SELECT COUNT(*) FROM DiaryReplyBean AS d WHERE d.status=?";
		if(site>0){
			hql += " AND d.site.id=?";
			return executeStatAsInt(hql, DiaryReplyBean.STATUS_NORMAL, site);
		}
		return executeStatAsInt(hql, DiaryReplyBean.STATUS_NORMAL);
	}

	/**
	 * ɾ���ռ�����,�Զ����ٶ�Ӧ�ռǵ�������
	 * @param reply
	 */
	public static void deleteDiaryReply(DiaryReplyBean reply){
		Session ssn = getSession();
		try{
			beginTransaction();
			if(reply.getDiary()!=null)
				reply.getDiary().incReplyCount(-1);
			if(reply.getUser()!=null)
				reply.getUser().getCount().incArticleReply(-1);
			ssn.delete(reply);
			commit();
		}catch(HibernateException e){
			rollback();
		}
	}

	/**
	 * �����ռ�����,�Զ����¶�Ӧ�ռǵ�������
	 * �����������������������������Զ�����
	 * @param reply
	 */
	public static void createDiaryReply(DiaryReplyBean reply){
		try{
			Session ssn = getSession();
			int max_reply_count = ConfigDAO.getMaxReplyCount(reply.getSite().getId());
			beginTransaction();	
			reply.getDiary().incReplyCount(1);
			if(reply.getDiary().getReplyCount()>=max_reply_count && max_reply_count > 0)
				reply.getDiary().setLock(1);
			reply.getDiary().setLastReplyTime(new Date());
			if(reply.getUser()!=null)
				reply.getUser().getCount().incArticleReply(1);
			ssn.save(reply);
			commit();
		}catch(HibernateException e){
			rollback();
			throw e;
		}
	}	
}
