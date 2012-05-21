/*
 *  DLOG_Diary_VelocityTool.java
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
package com.liusoft.dlog4j.velocity;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.HibernateException;

import com.liusoft.dlog4j.DLOG_CacheManager;
import com.liusoft.dlog4j.SessionUserObject;
import com.liusoft.dlog4j.TextCacheManager;
import com.liusoft.dlog4j.base._DiaryBase;
import com.liusoft.dlog4j.beans.CatalogBean;
import com.liusoft.dlog4j.beans.DiaryBean;
import com.liusoft.dlog4j.beans.DiaryOutlineBean;
import com.liusoft.dlog4j.beans.DiaryReplyBean;
import com.liusoft.dlog4j.beans.SiteBean;
import com.liusoft.dlog4j.dao.CatalogDAO;
import com.liusoft.dlog4j.dao.DiaryDAO;
import com.liusoft.dlog4j.dao.FCKUploadFileDAO;
import com.liusoft.dlog4j.dao.ReplyDAO;

/**
 * �ռ���ص�Toolbox��
 * @author liudong
 */
public class DLOG_Diary_VelocityTool{
	
	final static Log log = LogFactory.getLog(DLOG_Diary_VelocityTool.class);

	private final static String CACHE_KEY = "dlog_home_info";
	
	/**
	 * �г������ŵ�ר������
	 * @param days
	 * @param count
	 * @return
	 */
	public List list_hot_articles(SiteBean site, int days, int count){
		if(site==null)
			return null;
		StringBuffer nKey = new StringBuffer("hot_articles_");
		nKey.append(site.getId());
		nKey.append('_');
		nKey.append(days);
		nKey.append('_');
		nKey.append(count);
		List articles = (List)DLOG_CacheManager.getObjectCached(CACHE_KEY, nKey.toString());
		if(articles == null){
			articles = DiaryDAO.listHotArticles(site.getId(), days, count);
			if(articles==null || articles.size()==0){
				articles = DiaryDAO.listHotArticles(site.getId(), days * 100, count);
			}
			else
			if(articles.size() < count){
				List others = DiaryDAO.listHotArticlesBefore(site.getId(),
						days, count - articles.size());
				articles.addAll(others);
			}
			DLOG_CacheManager.putObjectCached(CACHE_KEY, nKey, (Serializable)articles);
		}
		return articles;
	}

	/**
	 * �г���ǰ�Ѿ��ϴ��ĸ���
	 * @param session_id
	 * @return
	 */
	public List attachments(SessionUserObject user, String session_id){
		if(user == null)
			return null;
		return FCKUploadFileDAO.listOrphanFiles(user.getId(), session_id);
	}
	
	/**
	 * ����ĳ����������
	 * @param site
	 * @param reply_id
	 * @return
	 */
	public DiaryReplyBean reply(int reply_id){
		if(reply_id < 0)
			return null;
		return (DiaryReplyBean)ReplyDAO.getReply(DiaryReplyBean.class, reply_id);
	}
	
	/**
	 * �ж��û��ɷ��з���ָ���ռǵ�Ȩ�޲������ռ���ϸ����(showlog.vm)
	 * 
	 * @param site
	 * @param user
	 * @param log_id
	 * @return
	 * @throws HibernateException
	 */
	public _DiaryBase diary(SiteBean site, SessionUserObject user, int log_id) {
		if (site == null || log_id < 0)
			return null;
		// ��ν��ռǵ����ݽ��л���,��������ݿ�ֱ�Ӷ�ȡ���ı�
		String text = TextCacheManager.getTextContent(DiaryBean.TYPE_DIARY, log_id);
		_DiaryBase diary = null;
		if(text==null){
			diary = DiaryDAO.getDiaryByID(log_id);
			if(diary!=null && diary.getStatus()==DiaryBean.STATUS_NORMAL){
				TextCacheManager.updateTextContent(DiaryBean.TYPE_DIARY, log_id, diary.getContent());
			}
		}
		else{
			diary = DiaryDAO.getDiaryOutlineByID(log_id);
			if(diary!=null)
				diary.setContent(text);
		}
		if (diary == null || diary.getSite().getId() != site.getId())
			return null;
		if(user!=null && diary.getOwner().getId()==user.getId())
			return diary;
		if (!CatalogDAO.canUserViewThisCatalog(diary.getCatalog(), user))
			return null;
		return diary;
	}

	/**
	 * ֱ�Ӷ�ȡĳһƪ�ռ�
	 * 
	 * @param log_id
	 * @return
	 * @throws HibernateException
	 */
	public _DiaryBase diary(int log_id) {
		if (log_id < 0)
			return null;
		String text = TextCacheManager.getTextContent(DiaryBean.TYPE_DIARY, log_id);
		_DiaryBase diary = null;
		if(text==null){
			diary = DiaryDAO.getDiaryByID(log_id);
			if(diary!=null && diary.getStatus()==DiaryBean.STATUS_NORMAL){
				TextCacheManager.updateTextContent(DiaryBean.TYPE_DIARY, log_id, diary.getContent());
			}
		}
		else{
			diary = DiaryDAO.getDiaryOutlineByID(log_id);
			if(diary!=null)
				diary.setContent(text);
		}
		return diary;
	}
	
	/**
	 * ����ռ�����
	 * @param diary
	 */
	public void fill_diary_content(_DiaryBase diary){		
		String text = TextCacheManager.getTextContent(DiaryBean.TYPE_DIARY, diary.getId());
		if(text==null){
			DiaryBean db = DiaryDAO.getDiaryByID(diary.getId());
			diary.setContent(db.getContent());
			if(diary!=null && diary.getStatus()==DiaryBean.STATUS_NORMAL){
				TextCacheManager.updateTextContent(DiaryBean.TYPE_DIARY, diary.getId(), diary.getContent());
			}
		}
		else{
			diary.setContent(text);
		}
	}
	
	/**
	 * ��ȡ��һƪ�ռ�(showlog.vm)
	 * @param site
	 * @param user
	 * @param catalog_id
	 * @param log_id
	 * @return
	 */
	public DiaryOutlineBean prev_diary(SiteBean site, SessionUserObject user, int catalog_id, int log_id){
		if (site == null || log_id < 0)
			return null;
		try{
			return DiaryDAO.getPrevDiary(site,user,catalog_id,log_id);
		}catch(Exception e){
			log.error("DLOG_VelocityTool.prev_diary execute failed.", e);
		}
		return null;
	}

	/**
	 * ��ȡ��һƪ�ռ�(showlog.vm)
	 * @param site
	 * @param user
	 * @param catalog_id
	 * @param log_id
	 * @return
	 */
	public DiaryOutlineBean next_diary(SiteBean site, SessionUserObject user, int catalog_id, int log_id){
		if (site == null || log_id < 0)
			return null;
		try{
			return DiaryDAO.getNextDiary(site, user, catalog_id, log_id);
		}catch(Exception e){
			log.error("DLOG_VelocityTool.next_diary execute failed.", e);
		}
		return null;
	}
	
	/**
	 * ��ȡĳ����վ���µ�һƪ�ռ�
	 * @param site
	 * @param user
	 * @param fromIdx
	 * @param count
	 * @param withContent
	 * @return
	 */
	public List top_diary(SiteBean site, SessionUserObject user, int page, int count, boolean withContent) {
		if (site == null)
			return null;
		return list_diary(site,user,-1,-1,-1,-1,page, count, withContent);
	}

	/**
	 * �г������ϴ����ļ������ڹ���
	 * @param page
	 * @param count
	 * @return
	 */
	public List list_files(int page, int count){
		int fromIdx = (page-1)*count;
		return FCKUploadFileDAO.listFiles(fromIdx, count);
	}
	
	public int file_count(){
		return FCKUploadFileDAO.fileCount();
	}

	/**
	 * ����Ҫ���������ȡ�ռ�(�����ռ�����)
	 * 
	 * @param site
	 * @param user
	 * @param catalog_id
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List list_diary(SiteBean site, SessionUserObject user, int catalog_id, int year,int month,int date,
			int page, int pageSize) {
		return list_diary(site, user, catalog_id, year,month,date, page, pageSize, true);
	}

	/**
	 * ����Ҫ���������ȡ�ռ�
	 * 
	 * @param site
	 * @param user
	 * @param catalog_id
	 * @param page
	 * @param pageSize
	 * @param withContent �Ƿ���Ҫ�����ռ���ϸ����
	 * @return
	 */
	public List list_diary(SiteBean site, SessionUserObject user, int catalog_id, int year,int month,int date,
			int page, int pageSize, boolean withContent) {
		int fromIdx = (page - 1) * pageSize;
		if (fromIdx < 0)
			fromIdx = 0;
		if (pageSize < 1)
			pageSize = 5;
		if (site == null)
			return DiaryDAO.listDiary(year, month, date, fromIdx, pageSize, withContent);
		else
			return DiaryDAO.listDiary(site, user, catalog_id, year,month,date, fromIdx, pageSize, withContent);
	}

	/**
	 * �����ռ���
	 * 
	 * @param site
	 * @param user
	 * @param catalog_id
	 * @return
	 */
	public int diary_count(SiteBean site, SessionUserObject user, int catalog_id, int year, int month, int date) {
		if (site == null)
			return -1;
		return DiaryDAO.getDiaryCount(site, user, catalog_id, year,month,date);
	}
	
	/**
	 * �����ܵ��ռ����������������ռ�
	 * @return
	 */
	public int public_diary_count(){
		return DiaryDAO.getPublicDiaryCount();
	}
	
	/**
	 * ��ҳ�г�ĳƪ�ռǵ�����
	 * @param site
	 * @param user
	 * @param diary
	 * @param page
	 * @param pageSize
	 * @param reverse �Ƿ���,�����ֵΪtrue����������������ǰ��
	 * @return
	 */
	public List replies(SiteBean site, SessionUserObject user, _DiaryBase diary, int page, int pageSize, boolean reverse){
		if (site == null)
			return null;
		if (diary == null || diary.getSite().getId() != site.getId())
			return null;
		if (!CatalogDAO.canUserViewThisCatalog(diary.getCatalog(), user))
			return null;
		int fromIdx = (page - 1) * pageSize;
		if(fromIdx < 0)
			fromIdx = 0;
		return DiaryDAO.listDiaryReplies(diary.getId(), fromIdx, pageSize, reverse);
	}

	/**
	 * �ж��û��Ƿ��б༭ĳƪ�ռǵ�Ȩ��
	 * @param user
	 * @param diary
	 * @return
	 */
	public boolean can_user_edit_diary(SessionUserObject user, _DiaryBase diary){
		if(user==null || diary==null)
			return false;
		if(diary.getOwner().getId()==user.getId())
			return true;
		if(diary.getSite().isOwner(user))
			return true;
		return false;
	}
	
	/**
	 * �г�ĳ����վ�������ռ�����(_diary_top_info.vm, j_replies.vm)
	 * 
	 * @param site
	 * @param user
	 * @param last_reply_id
	 * @param count
	 * @return
	 */
	public List list_diary_replies(SiteBean site, int page, int count, SessionUserObject user) {
		if (site == null)
			return null;
		int fromidx = (page - 1) * count;
		return DiaryDAO.listDiaryReplies(site, fromidx, count, user);
	}

	/**
	 * ��ȡ�ռ���������(j_replies.vm)
	 * @param site
	 * @param user
	 * @return
	 */
	public int diary_reply_count(SiteBean site, SessionUserObject user){
		if(site==null) 
			return -1;
		return DiaryDAO.getDiaryReplyCount(site, user);
	}

	/**
	 * ͳ��ĳ������ÿ����ռ���(_diary_calendar.vm)
	 * @param year
	 * @param month
	 * @return ��������еĵ�һ��Ԫ���Ǹ��µ��ռ�������,�����Ƕ�Ӧÿ����ռ���
	 */
	public List diary_counts_by_month(SiteBean site, SessionUserObject user, int year, int month){
		if(site==null) 
			return null;
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		int[] logc = DiaryDAO.statCalendarLogs(site, user, cal);
		List logcs = new ArrayList();
		for(int i=0;i<logc.length;i++){
			logcs.add(new Integer(logc[i]));
		}
		return logcs;
	}
	
	/**
	 * �õ����������ռ���(_catalog_and_calendar.vm, trash.vm)
	 * @param site
	 * @param user
	 * @return
	 */
	public int trash_count(SiteBean site, SessionUserObject user){
		if(site==null || user==null)
			return -1;
		if(!site.isOwner(user))
			return -1;
		return DiaryDAO.getTrashCount(site.getId());
	}
	
	/**
	 * �г��������е������ռ�(trash.vm)
	 * @param site
	 * @param user
	 * @return
	 */
	public List list_trash(SiteBean site, SessionUserObject user){
		return list_trash(site, user, 1, 0);
	}

	/**
	 * �г��������е������ռ�(trash.vm)
	 * @param site
	 * @param user
	 * @return
	 */
	public List list_trash(SiteBean site, SessionUserObject user, int page, int pageSize){
		if(site==null || user==null)
			return null;
		if(!site.isOwner(user))
			return null;
		int fromIdx = (page - 1) * pageSize;
		return DiaryDAO.listTrash(site.getId(), fromIdx, pageSize);
	}
	
	/**
	 * �õ��ݸ���(_catalog_and_calendar.vm, drafts.vm) 
	 * @param site
	 * @param user
	 * @return
	 */
	public int draft_count(SiteBean site, SessionUserObject user){
		if(site==null || user==null) return -1;
		return DiaryDAO.getDraftCount(site, user.getId());
	}
	
	/**
	 * �õ����еĲݸ�(drafts.vm)
	 * @param site
	 * @param user
	 * @return
	 */
	public List list_drafts(SiteBean site, SessionUserObject user){
		return list_drafts(site, user, 1, 0);
	}

	public List list_drafts(SiteBean site, SessionUserObject user, int page, int pageSize){
		if(site==null || user==null) return null;
		int fromIdx = (page - 1) * pageSize;		
		return DiaryDAO.listDrafts(site, user.getId(), fromIdx, pageSize);
	}
	
	/**
	 * �����ռǣ������ռǵ��Ķ���
	 * @param site
	 * @param user
	 * @param log
	 */
	public void visit_diary(SiteBean site, SessionUserObject user, _DiaryBase diary){
		if(diary!=null && diary.getSite().getId()==site.getId()){
			try{
				DiaryDAO.incViewCount(diary.getId(), 1);
			}catch(Exception e){
				log.error("DLOG_VelocityTool.visit_diary failed.", e);
			}
		}
	}

	/**
	 * �г�ָ����վ�������ռǷ���
	 * 
	 * @param site_id
	 * @param user
	 * @param maintain
	 * @return
	 * @throws HibernateException
	 */
	public List catalogs(SiteBean site, SessionUserObject user, boolean maintain) {
		if (site == null)
			return null;
		if (site.isOwner(user))
			return site.getCatalogs();
		else {
			return CatalogDAO.listCatalogs(site, user, maintain);
		}
	}

	/**
	 * ��ѯ�û���ĳ��վ���Ͽ�д�ռǵķ�����(_catalog_and_calendar.vm)
	 * @param site
	 * @param user
	 * @return
	 */
	public boolean user_can_blog(SiteBean site, SessionUserObject user){
		if(site == null || user == null)
			return false;
		return CatalogDAO.userCanBlog(site, user);
	}

	/**
	 * ��ȡĳ�������ϸ����
	 * @param site
	 * @param user
	 * @param cat_id
	 * @return
	 */
	public CatalogBean catalog(SiteBean site, SessionUserObject user, int cat_id){
		if(site==null || cat_id < 1)
			return null;
		CatalogBean catalog = CatalogDAO.getCatalogByID(cat_id);
		if (catalog != null && catalog.getSite().getId() == site.getId()
				&& CatalogDAO.canUserViewThisCatalog(catalog, user))
			return catalog;
		return null;
	}

	/**
	 * �г���ĳ���ռǷ���ӵ������Ȩ�޵������û�
	 * @param site
	 * @param user
	 * @param catalog
	 * @return
	 */
	public List list_special_popedom_users_by_catalog(SiteBean site, SessionUserObject user, CatalogBean catalog){
		if(site==null||user==null||catalog==null)
			return null;
		if(site.isOwner(user) && site.getId()==catalog.getSite().getId())
			return CatalogDAO.listSpecialPopedomUsersByCatalog(catalog.getId());
		return null;
	}
	
}
