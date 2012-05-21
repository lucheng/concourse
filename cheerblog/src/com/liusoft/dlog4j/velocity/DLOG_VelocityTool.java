/*
 *  DLOG_VelocityTool.java
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

import java.io.File;
import java.net.URL;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.digester.rss.Channel;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.MessageResources;
import org.apache.velocity.tools.struts.StrutsUtils;
import org.hibernate.HibernateException;

import com.liusoft.dlog4j.SessionUserObject;
import com.liusoft.dlog4j.UserLoginManager;
import com.liusoft.dlog4j.beans.BookmarkBean;
import com.liusoft.dlog4j.beans.ExternalReferBean;
import com.liusoft.dlog4j.beans.LinkBean;
import com.liusoft.dlog4j.beans.MessageBean;
import com.liusoft.dlog4j.beans.SiteBean;
import com.liusoft.dlog4j.beans.UserBean;
import com.liusoft.dlog4j.dao.BookmarkDAO;
import com.liusoft.dlog4j.dao.ExternalReferDAO;
import com.liusoft.dlog4j.dao.GuestBookDAO;
import com.liusoft.dlog4j.dao.LinkDAO;
import com.liusoft.dlog4j.dao.MessageDAO;
import com.liusoft.dlog4j.dao.SiteDAO;
import com.liusoft.dlog4j.dao.UserDAO;
import com.liusoft.dlog4j.util.RequestUtils;
import com.liusoft.dlog4j.util.StringUtils;
import com.liusoft.dlog4j.xml.RSSFetcher;

/**
 * DLOG4J��Toolbox��
 * @author liudong
 */
public class DLOG_VelocityTool extends VelocityTool {

	private static Log log = LogFactory.getLog(DLOG_VelocityTool.class);		
	
	/**
	 * �����Զ�Ӧvelocity-toolbox.xml�е�����
	 */
	private boolean saveRefer = true;
	
	/**
	 * �г�ĳ�˵���ǩ
	 * @param user
	 * @return
	 */
	public List bookmarks(SessionUserObject user){
		if(user==null)
			return null;
		return BookmarkDAO.list(user.getId());
	}
	
	/**
	 * ��ȡFCKUpload���������ɵĻỰID
	 * @return
	 */
	public String dlog_session_id(HttpServletRequest req){
		return RequestUtils.getDlogSessionId(req);
	}
	
	/**
	 * ��ȡһ��ȫ·�����ļ�������
	 * @param absolute_path
	 * @return
	 */
	public String file_name(String absolute_path){
		return StringUtils.substringAfterLast(absolute_path, File.separator);
	}
	
	/**
	 * ��¼�ⲿ��վ����
	 * @param site
	 * @param ref_id
	 * @param ref_type
	 * @param req
	 */
	public void save_refer(SiteBean site, int ref_id, int ref_type, HttpServletRequest req){
		if(!saveRefer)
			return ;
		String refer = RequestUtils.getHeader(req, "refer");
		if(StringUtils.isNotEmpty(refer)){
			URL url;
			try {
				url = new URL(refer);
				String host = url.getHost();
				if(!StringUtils.equals(req.getServerName(),host)){
					ExternalReferBean rbean = new ExternalReferBean();
					rbean.setUrl(refer);
					rbean.setClientAddr(req.getRemoteAddr());
					rbean.setReferTime(new Date());
					rbean.setRefId(ref_id);
					rbean.setRefType(ref_type);
					rbean.setSite(site);
					rbean.setHost(host);
					ExternalReferDAO.save(rbean);
				}
			} catch (Exception e) {
				log.error("Save refer failed, ip="+req.getRemoteAddr()+",refer="+refer, e);
			} finally {
				url = null;
			}
		}
	}
	
	/**
	 * �ж��û��ܷ����ĳ����վ
	 * @param site
	 * @param loginUser
	 * @return
	 */
	public boolean can_access_site(SiteBean site, UserBean loginUser){
		if(site == null)
			return true;
		boolean is_owner = is_owner(site, loginUser);
		if(is_owner)
			return true;
		switch(site.getAccessMode()){
		case SiteBean.ACCESS_MODE_PUBLIC:
			return true;
		case SiteBean.ACCESS_MODE_PRIVATE:
			return is_owner;
		case SiteBean.ACCESS_MODE_LOGIN:
			return loginUser!=null;
		case SiteBean.ACCESS_MODE_FRIEND:
			//�ж��Ƿ�վ���ĺ���
			return is_friend_of(site.getOwner().getId(),
					(loginUser != null) ? loginUser.getId() : -1);
		case SiteBean.ACCESS_MODE_SECRET_CODE:
			//�ж��Ƿ��Ѿ���������
			HttpSession ssn = request.getSession(false);
			if(ssn!=null){
				String pwd = (String)ssn.getAttribute("ACCESS_CODE_OF_SITE#"+site.getId());
				return pwd!=null && StringUtils.equals(site.getAccessCode(), pwd);
			}
		}
		return false;
	}
	
	/**
	 * �ж��������Ƿ�Ϊ����
	 * @param user1
	 * @param user2
	 * @return
	 */
	public boolean is_friend_of(int user1, int user2){
		if(user1<1 || user2<1)
			return false;
		return UserDAO.getFriend(user1, user2)!=null;
	}
	
	/**
	 * ���ɿͻ��˰�ȫʶ����
	 * @return
	 */
	public String gen_client_id(){
		return UserLoginManager.generateClientId(request, response);
	}
	
	/**
	 * ��ȡĳ��վ������԰���Ϣ��
	 * @param site
	 * @return
	 */
	public int get_guest_msg_count(SiteBean site){
		if(site==null)
			return -1;
		return GuestBookDAO.getMsgCount(site);
	}
	
	/**
	 * ��ҳ������԰��е���Ϣ
	 * @param site
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List list_guest_msgs(SiteBean site, int page, int pageSize){
		if(site==null)
			return null;
		if(pageSize < 1 || pageSize > 100)
			pageSize = 10;
		int fromIdx = (page - 1) * pageSize;
		if(fromIdx < 0)
			fromIdx = 0;
		return GuestBookDAO.listMsgs(site, fromIdx, pageSize);
	}
	
	/**
	 * �õ�ĳ��վ���µ����Բ���������Ϣ��
	 * @param site
	 * @param fromId
	 * @return
	 */
	public int get_guest_msg_count_after(SiteBean site, int fromId){
		if(site == null)
			return -1;
		return GuestBookDAO.getNewMsgCount(site, fromId);
	}
	
	/**
	 * @see listmsg.vm
	 * @param user
	 */
	public void read_msgs(SessionUserObject user){
		if(user!=null){
			try{
				MessageDAO.readNewMsgs(user.getId());
			}catch(Exception e){
				context.log("DLOG_VelocityTool.read_msgs failed.", e);
			}
		}
	}
	
	/**
	 * ��ȡĳ��������Ϣ(sendmsg.vm)
	 * @param msg_id
	 * @return
	 */
	public MessageBean get_msg(int msg_id){
		if(msg_id <1)
			return null;
		return MessageDAO.getMsg(msg_id);
	}
	
	/**
	 * ������ǩ���ɳ���(bookmark.vm)
	 * @param bmb
	 * @return
	 */
	public String gen_bookmark_hyperlink(BookmarkBean bmb){
		return gen_bookmark_hyperlink(bmb, "html");
	}

	/**
	 * ������ǩ���ɳ���(bookmark.vm)
	 * @param bmb
	 * @return
	 */
	public String gen_bookmark_hyperlink(BookmarkBean bmb, String subDir){
		if(bmb==null)
			return null;
		return bmb.url(request, subDir);
	}
	
	/**
	 * �ж��Ƿ��и�ĳ���˵�����
	 * @param site
	 * @param user
	 * @return
	 */
	public boolean has_new_msg(SiteBean site, SessionUserObject user){
		if(user==null)
			return false;
		return MessageDAO.hasNewMessage(user.getId());
	}
	
	/**
	 * ����ĳ���û�����������
	 * @param user
	 * @return
	 */
	public int get_new_msg_count(SessionUserObject user){
		if(user==null) 
			return -1;
		return MessageDAO.getNewMessageCount(user.getId());
	}

	/**
	 * ����ĳ���û���������
	 * @param user
	 * @return
	 */
	public int get_msg_count(SessionUserObject user){
		if(user==null)
			return -1;
		return MessageDAO.getMessageCount(user.getId());
	}
	
	/**
	 * ץȡƵ������
	 * @param type
	 * @param url
	 * @return
	 */
	public Channel fetch_channel(int type, String url){
		if(StringUtils.isEmpty(url))
			return null;
		return RSSFetcher.fetchChannel(type, url);
	}
	
	/**
	 * ��ȡ������Ϣ(/html/rssview.vm)
	 * @param site
	 * @param linkid
	 * @return
	 * @important �˷�����Ϊ������Ҫ�ڶ�ȡƵ��ʱ��ķѱȽϳ���ʱ�䣬Ϊ�˲�ռ�����ݿ���Դ���ڴ��ͷ����ݿ�����
	 */
	public LinkBean get_link(int linkid){
		if(linkid<0)
			return null;
		return LinkDAO.getLinkByID(linkid);
	}
	
	/**
	 * �����û��Ƿ�Ϊָ��վ���վ��
	 * @param site
	 * @param user
	 * @return
	 */
	public boolean is_owner(SiteBean site, SessionUserObject user){
		if(site==null) 
			return false;
		return site.isOwner(user);
	}
	
	/**
	 * �ж��û��ǲ��ǳ�������Ա
	 * @param site
	 * @param user
	 * @return
	 */
	public boolean is_superior(SessionUserObject user){
		return SiteBean.isSuperior(user);
	}
	
	/**
	 * ��ʾʱ��(diary.vm)
	 * @param year
	 * @param month
	 * @param date
	 * @return
	 */
	public String show_time(int year, int month, int date){
		StringBuffer stime = new StringBuffer();
		if(year>0&&month>0&&date>0){//ĳ��
			stime.append(year);
			stime.append('.');
			stime.append(month);
			stime.append('.');
			stime.append(date);
		}
		else
		if(year>0&&month>0){//ĳ��
			stime.append(year);
			stime.append('.');
			stime.append(month);
		}
		else
		if(year>0){//ĳ��
			stime.append(year);
		}
		return stime.toString();
	}
	
	/**
	 * ������վ��Ż�ȡ����ϸ����(_global.vm)
	 * 
	 * @param site_id
	 * @return
	 * @throws HibernateException
	 */
	public SiteBean site(int site_id) throws HibernateException {
		if (site_id <= 0)
			return null;
		return SiteDAO.getSiteByID(site_id);
	}

	/**
	 * ���ص�ǰ���ʵ��û���Ϣ
	 */
	public SessionUserObject get_current_user() {
		return UserLoginManager.getLoginUser(request,response,false);
	}

	/**
	 * ��������(_catalog_and_calendar.vm)
	 * 
	 * @param year
	 * @param month
	 * @return
	 */
	public int[][] calendar(int year, int month) {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.YEAR, year);
		cal.set(Calendar.MONTH, month - 1);
		cal.set(Calendar.DAY_OF_MONTH, 1);
		int firstDateInWeek = cal.get(Calendar.DAY_OF_WEEK) - 1;
		int dateOfMonth = getMonthDateCount(cal);
		int base = dateOfMonth + firstDateInWeek;
		int row = base / 7;
		row += ((base % 7) > 0) ? 1 : 0;
		int[][] cals = new int[row][7];
		int iCol = firstDateInWeek, iRow = 0;
		for (int i = 1; i <= dateOfMonth; i++) {
			cals[iRow][iCol] = i;
			if (iCol == 6) {
				iCol = 0;
				iRow++;
			} else
				iCol++;
		}
		return cals;
	}

	/**
	 * �õ�ָ���·ݵ�����
	 * 
	 * @param cal
	 * @return
	 */
	private static int getMonthDateCount(Calendar cal) {
		Calendar cal2 = (Calendar) cal.clone();
		cal2.add(Calendar.MONTH, 1);
		cal2.set(Calendar.DAY_OF_MONTH, 1);
		cal2.add(Calendar.DAY_OF_MONTH, -1);
		return cal2.get(Calendar.DAY_OF_MONTH);
	}

	/**
	 * (_catalog_and_calendar.vm)
	 * 
	 * @param field
	 * @return
	 */
	public int calendar(int field) {
		Calendar cal = Calendar.getInstance();
		String param;
		int defValue;
		switch (field) {
		case 1:
			param = "year";
			defValue = cal.get(Calendar.YEAR);
			break;
		case 2:
			param = "month";
			defValue = cal.get(Calendar.MONTH) + 1;
			break;
		case 3:
			param = "date";
			defValue = cal.get(Calendar.DATE);
			break;
		default:
			return -1;
		}
		return RequestUtils.getParam(request, param, defValue);
	}
	
	/**
	 * ����ʱ��������URL (diary.vm)
	 * @param year
	 * @param month
	 * @param date
	 * @return
	 */
	public String make_date_params(String param_name, int cat_id, int year, int month, int date){
		StringBuffer param = new StringBuffer();
		if(cat_id>0){
			param.append('&');
			param.append(param_name);
			param.append('=');
			param.append(cat_id);
		}
		if(year>0){
			param.append("&year=");
			param.append(year);
		}
		if(month>0){
			param.append("&month=");
			param.append(month);
		}
		if(date>0){
			param.append("&date=");
			param.append(date);
		}
		return param.toString();
	}
	
	/**
	 * �Խϳ����ı����ݽ����и�
	 * @param content
	 * @param page
	 * @param word_count
	 * @return
	 */
	public String split(String content, int page, int word_count){
		int fromIdx = ( page - 1 ) * word_count;
		int endIdx = fromIdx + word_count;
		if(fromIdx >= content.length())
			return "";
		if(endIdx > content.length())
			endIdx = content.length();
		return content.substring(fromIdx, endIdx);
	}	

	/** parameter getter/setter */
	public boolean isSaveRefer() {
		return saveRefer;
	}

	public void setSaveRefer(boolean saveRefer) {
		this.saveRefer = saveRefer;
	}

	/**
	 * �Զ�����һ��������վ�������ظ���վ�ı�� 
	 * @param username
	 * @return
	 * @throws Exception 
	 */
	public SiteBean auto_create_site() throws Exception{
		String username = "admin";
		//�����û�
		UserBean ubean = auto_create_user(username);
		//������վ
		SiteBean sbean = auto_create_site(ubean);
		//ִ�е�¼����
		UserLoginManager.loginUser(request, response, ubean, -1);
		return sbean;
	}

	/**
	 * �Զ�����dlog�û�
	 * @param username
	 * @return
	 */
	private UserBean auto_create_user(String username){
		UserBean ubean = new UserBean();
		ubean.setName(username);
		String nickname = null;
    	MessageResources res = StrutsUtils.getMessageResources(request, context, null);
    	if(res!=null)
    		nickname = res.getMessage("administrator");
    	if(StringUtils.isEmpty(nickname))
    		nickname = "Administrator";
		ubean.setNickname(nickname);
		ubean.setPassword("admin");		
		UserDAO.createUser(ubean);
		return ubean;
	}

	/**
	 * �Զ���ͨ���˿ռ�
	 * @param ubean
	 * @return
	 */
	private SiteBean auto_create_site(UserBean ubean){
		SiteBean sbean = new SiteBean();
		sbean.setCreateTime(new Date());
		sbean.setUniqueName(ubean.getName());
		sbean.setFriendlyName("DLOG of "+ubean.getNickname());
		sbean.setOwner(ubean);
		SiteDAO.createSite(sbean);
		return sbean;
	}
	
}
