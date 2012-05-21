/*
 *  DLOG_Photo_VelocityTool.java
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
package com.liusoft.dlog4j.velocity;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liusoft.dlog4j.Globals;
import com.liusoft.dlog4j.SessionUserObject;
import com.liusoft.dlog4j.base._PhotoBase;
import com.liusoft.dlog4j.beans.AlbumBean;
import com.liusoft.dlog4j.beans.PhotoBean;
import com.liusoft.dlog4j.beans.PhotoOutlineBean;
import com.liusoft.dlog4j.beans.PhotoReplyBean;
import com.liusoft.dlog4j.beans.SiteBean;
import com.liusoft.dlog4j.dao.AlbumDAO;
import com.liusoft.dlog4j.dao.PhotoDAO;
import com.liusoft.dlog4j.dao.ReplyDAO;
import com.liusoft.dlog4j.util.RequestUtils;

/**
 * ���ģ���Toolbox��
 * @author Winter Lau
 */
public class DLOG_Photo_VelocityTool extends VelocityTool {

	private static Log log = LogFactory.getLog(DLOG_Photo_VelocityTool.class);
	
	/**
	 * �����ಾ����ϸ��Ϣ
	 * @param album_id
	 * @return
	 */
	public AlbumBean album(int album_id){
		if(album_id <= 0) return null;
		return AlbumDAO.getAlbumByID(album_id);
	}
	
	/**
	 * �����ܵ���Ƭ��
	 * @return
	 */
	public int photo_count(){
		return PhotoDAO.getPhotoCount(-1);
	}
	
	/**
	 * ����ĳ����������
	 * @param site
	 * @param reply_id
	 * @return
	 */
	public PhotoReplyBean reply(int reply_id){
		if(reply_id < 0)
			return null;
		return (PhotoReplyBean)ReplyDAO.getReply(PhotoReplyBean.class, reply_id);
	}
	
	/**
	 * ��ҳ�г�ĳ����Ƭ������
	 * @param site
	 * @param user
	 * @param log_id
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List replies(SiteBean site, SessionUserObject user, _PhotoBase photo, int page, int pageSize){
		if (site == null || photo==null)
			return null;
		if(!canViewThisPhoto(site, user, photo, request))
			return null;

		int fromIdx = (page - 1) * pageSize;
		if(fromIdx < 0)
			fromIdx = 0;
		return PhotoDAO.listPhotoReplies(photo.getId(), fromIdx, pageSize);
	}

	/**
	 * ��ȡ�����������(p_replies.vm)
	 * @param site
	 * @param user
	 * @return
	 */
	public int photo_reply_count(SiteBean site, SessionUserObject user){
		if(site==null) return -1;
		return PhotoDAO.getPhotoReplyCount(site, user);
	}

	/**
	 * �г�����ͼƬ�����ڹ���
	 * @param page
	 * @param count
	 * @return
	 */
	public List list_photos(int page, int count){
		int fromIdx = (page-1)*count;
		return PhotoDAO.listPhotos(fromIdx, count);
	}
	
	public int all_photo_count(){
		return PhotoDAO.photoCount();
	}

	/**
	 * ������photo_album.vmҳ�����г���Ƭ
	 * @param site
	 * @param user
	 * @param album_id
	 * @param month_stamp �·ݴ�,����200506��ʾ��2005��6�·ݵ���Ƭ
	 * @param page
	 * @param count
	 * @return
	 */
	public List list_photos(SiteBean site, SessionUserObject user, int album_id, int month_stamp, int page, int count){
		if(count < 1)
			count = 10;
		int fromIdx = (page-1)*count;
		if(fromIdx < 0)
			fromIdx = 0;
		int year = RequestUtils.getParam(request, "year", -1);
		int month = RequestUtils.getParam(request, "month", -1);
		if(year>0 && month>0 && month_stamp<0)
			month_stamp = year * 100 + month;
		int date = RequestUtils.getParam(request, "date", -1);

		if(site==null)
			return PhotoDAO.listPhotos(album_id, month_stamp, date, fromIdx, count);
		else{
			if(album_id < 1)
				return PhotoDAO.listPhotos(site, user, album_id, month_stamp, date, fromIdx, count);
			else{
				//�ж��û���û�з��ʸ��ಾ��Ȩ��
				AlbumBean album = AlbumDAO.getAlbumByID(album_id);
				if(can_access_album(site, user, album, request)){
					return PhotoDAO.listPhotos(album, fromIdx, count);
				}
			}
		}
		return null;
	}
	
	/**
	 * ͳ��ĳ������ÿ�����Ƭ��(_album_calendar.vm)
	 * @param site
	 * @param user
	 * @param year
	 * @param month
	 * @return
	 */
	public List photo_counts_by_month(SiteBean site, SessionUserObject user, int year, int month){
		if(site==null) 
			return null;
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month-1);
		int[] logc = PhotoDAO.statCalendarPhotoCount(site, user, cal);
		List logcs = new ArrayList();
		for(int i=0;i<logc.length;i++){
			logcs.add(new Integer(logc[i]));
		}
		return logcs;
	}
	
	/**
	 * �г�ĳ����վ��������Ƭ����(_album_top_info.vm, p_replies.vm)
	 * 
	 * @param site
	 * @param user
	 * @param last_reply_id
	 * @param count
	 * @return
	 */
	public List list_photo_replies(SiteBean site, int page, int count, SessionUserObject user) {
		if (site == null)
			return null;
		int fromidx = (page - 1) * count;
		return PhotoDAO.listPhotoReplies(site, fromidx, count, user);
	}
	
	/**
	 * ��ȡ��һ����Ƭ(photo/show.vm)
	 * @param site
	 * @param user
	 * @param album_id
	 * @param photo_id
	 * @return
	 */
	public PhotoOutlineBean prev_photo(SiteBean site, SessionUserObject user, int album_id, int photo_id){
		if (site == null || photo_id < 0)
			return null;
		try{
			return PhotoDAO.getPrevPhoto(site,user,album_id,photo_id);
		}catch(Exception e){
			log.error("prev_photo execute failed.", e);
		}
		return null;
	}

	/**
	 * ��ȡ��һ����Ƭ(photo/show.vm)
	 * @param site
	 * @param user
	 * @param album_id
	 * @param photo_id
	 * @return
	 */
	public PhotoOutlineBean next_photo(SiteBean site, SessionUserObject user, int album_id, int photo_id){
		if (site == null || photo_id < 0)
			return null;
		try{
			return PhotoDAO.getNextPhoto(site, user, album_id, photo_id);
		}catch(Exception e){
			log.error("next_photo execute failed.", e);
		}
		return null;
	}
	/**
	 * ������Ƭ��������Ƭ���Ķ���
	 * @param site
	 * @param user
	 * @param log
	 */
	public void visit_photo(SiteBean site, SessionUserObject user, _PhotoBase photo){
		if(photo!=null && photo.getSite().getId()==site.getId()){			
			try{
				PhotoDAO.incViewCount(photo.getId(), 1);
			}catch(Exception e){
				log.error("visit_diary failed.", e);
			}
		}
	}
	/**
	 * ��ȡ��Ƭ����ϸ����
	 * @param site
	 * @param user
	 * @param photo_id
	 * @return
	 */
	public PhotoBean photo(SiteBean site, SessionUserObject user, int photo_id){
		if(site==null || photo_id < 1)
			return null;
		PhotoBean photo = PhotoDAO.getPhotoByID(photo_id);
		if(canViewThisPhoto(site,user,photo,request))
			return photo;
		return null;
	}
	
	/**
	 * �ж�ĳ�û��Ƿ��в鿴ĳ����Ƭ��Ȩ��
	 * @param site
	 * @param user
	 * @param photo
	 * @return
	 */
	protected boolean canViewThisPhoto(SiteBean site, SessionUserObject user, _PhotoBase photo, HttpServletRequest req){
		if(photo==null || photo.getSite().getId() != site.getId())
			return false;
		//�ж��û��Ƿ��з��ʵ�Ȩ��
		//1. վ�����Է����κ���������Ƭ
		if(user!=null && site.isOwner(user))
			return true;
		//2. ��վ��
		if(photo.getStatus()!=PhotoBean.STATUS_NORMAL)
			return false;
		//�ж��ಾ��Ȩ��
		//���������κ��˿������
		if(photo.getAlbum().getType()==AlbumBean.TYPE_PUBLIC)
			return true;
		if(photo.getAlbum().getType()==AlbumBean.TYPE_VERIFIED){
			//����û��Ƿ��Ѿ�ͨ����֤
			HttpSession ssn = req.getSession(false);
			if(ssn!=null && ssn.getAttribute("ALBUM_" + photo.getAlbum().getId())!=null){				
				return true;
			}
		}
		return false;
	}

	/**
	 * �ж�ĳ�û��Ƿ��в鿴ĳ����Ƭ��Ȩ��
	 * @param site
	 * @param user
	 * @param photo
	 * @return
	 */
	public boolean can_access_album(SiteBean site, SessionUserObject user, AlbumBean album, HttpServletRequest req){
		if(album==null || album.getSite().getId() != site.getId())
			return false;
		//�ж��û��Ƿ��з��ʵ�Ȩ��
		//1. վ�����Է����κ���������Ƭ
		if(user!=null && site.isOwner(user))
			return true;
		//�ж��ಾ��Ȩ��
		//���������κ��˿������
		if(album.getType()==AlbumBean.TYPE_PUBLIC)
			return true;
		if(album.getType()==AlbumBean.TYPE_VERIFIED){
			//����û��Ƿ��Ѿ�ͨ����֤
			HttpSession ssn = req.getSession(false);
			if(ssn!=null && ssn.getAttribute(Globals.ALBUM_VERIFY_KEY + album.getId())!=null){				
				return true;
			}
		}
		return false;
	}
	
	/**
	 * ��ȡ��Ƭ��
	 * @param site
	 * @param user
	 * @param album_id
	 * @param month
	 * @return
	 */
	public int photo_count(SiteBean site, SessionUserObject user, int album_id, int month_stamp){
		if(site==null)
			return -1;
		int year = RequestUtils.getParam(request, "year", -1);
		int month = RequestUtils.getParam(request, "month", -1);
		if(year>0 && month>0 && month_stamp<0)
			month_stamp = year * 100 + month;
		int date = RequestUtils.getParam(request, "date", -1);
		return PhotoDAO.getPhotoCount(site, user, album_id, month_stamp, date);
	}
	
	/**
	 * �г��������Ч���·�
	 * @param site
	 * @return
	 */
	public List list_photo_months(SiteBean site){
		if(site==null)
			return null;
		List months = PhotoDAO.listMonths(site.getId());
		Collections.reverse(months);
		return months;
	}

	/**
	 * ������Ƭ�·ݵ���ʾ
	 * @param site
	 * @return
	 */
	public List format_photo_months(List months){
		if(months==null)
			return null;
		List new_months = new ArrayList();
		if(months.size()>0){
			new_months.addAll(months);
			final SimpleDateFormat month_fm = new SimpleDateFormat("MMM yyyy", request.getLocale());
			Calendar time = Calendar.getInstance();
			for(int i=0;i<new_months.size();i++){
				int value = ((Integer)new_months.get(i)).intValue();
				time.set(Calendar.YEAR, value / 100);
				time.set(Calendar.MONTH, ((value % 100) -1));
				new_months.set(i, month_fm.format(time.getTime()));
			}
		}
		return new_months;
	}
	
}
