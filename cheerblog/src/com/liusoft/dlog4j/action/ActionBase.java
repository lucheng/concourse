/*
 *  ActionBase.java
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
package com.liusoft.dlog4j.action;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.tags.ImageTag;
import org.htmlparser.tags.ScriptTag;
import org.htmlparser.tags.StyleTag;
import org.htmlparser.util.NodeList;

import com.liusoft.dlog4j.CapacityExceedException;
import com.liusoft.dlog4j.DLOGSecurityManager;
import com.liusoft.dlog4j.Globals;
import com.liusoft.dlog4j.SessionUserObject;
import com.liusoft.dlog4j.UserLoginManager;
import com.liusoft.dlog4j.beans.SiteBean;
import com.liusoft.dlog4j.beans.UserBean;
import com.liusoft.dlog4j.dao.FCKUploadFileDAO;
import com.liusoft.dlog4j.dao.SiteDAO;
import com.liusoft.dlog4j.dao.UserDAO;
import com.liusoft.dlog4j.formbean.FormBean;
import com.liusoft.dlog4j.util.RequestUtils;
import com.liusoft.dlog4j.util.StringUtils;

/**
 * ��Struts��Action�������չ��ʵ��doXxxxx�Ĺ���<br/> eventSubmit_Xxxxx -> doXxxxx
 * 
 * @author liudong
 */
public abstract class ActionBase extends ActionExtend {

	private final static Log log = LogFactory.getLog(ActionBase.class);
	
	final static String ISO8859_1 = "8859_1";
	
	final static String KEY_SITE = "admin_action_site";
	final static String KEY_USER = "admin_action_user";
	
	protected final static String WML_IDENTITY = "WML";

	public final static int MAX_REPLY_LENGTH = 2000;	//���Ļظ����ݳ���
	public final static int MAX_TOPIC_LENGTH = 4000;	//��������ݳ���
	public final static int MAX_PHOTO_DESC_LENGTH = 4000;//������Ƭ˵������
	public final static int MAX_MUSIC_LENGTH = 1000;	//���ĸ�ʳ���
	public final static int MAX_MESSAGE_LENGTH = 2000;	//���Ķ���Ϣ����

	public final static int MAX_GB_COUNT_LENGTH = 2000;//�������Գ���
	public final static int MAX_GB_REPLY_LENGTH = 1000;//�������Իظ�����

	/**
	 * ����ı���Ϣ�������
	 * @param res
	 * @param msg
	 * @throws IOException
	 */
	protected static void outputPlainMsg(HttpServletResponse res, String msg) throws IOException{
		res.setContentType("text/plain;charset=UTF-8");
		res.getWriter().print(msg);
	}
	
	/**
	 * ���˵�html�еĽű���Ϣ
	 * @param html
	 * @return
	 */
	protected static String filterScriptAndStyle(String html){
		if(StringUtils.isEmpty(html))
			return html;
		try{
			StringBuffer text = new StringBuffer();
			Parser parser = new Parser();
			parser.setEncoding("8859_1");
			parser.setInputHTML(html);
			//�������еĽڵ�
			NodeList nodes = parser.extractAllNodesThatMatch(scriptFilter);			
			for(int i=0;i<nodes.size();i++){
				Node node = nodes.elementAt(i);
				if(node instanceof TextNode)
					text.append(node.getText());
				else{
					text.append('<');
					text.append(node.getText());
					text.append('>');
				}
			}
			return text.toString();
		}catch(Exception e){
			log.error("Filter script exception ", e);
		}
		return html;
	}
	
	public static void main(String[] args){
		String html = "<p>��������(<a href=\"http://www.javayou.com\">Java������</a>)ɶʱ�����ŷ�����һ������</p><img src=\"http://www.dlog.cn/logo/dlog.vm\"/>";
		System.out.println(filterScriptAndStyle(html));
	}

	/**
	 * �������˳��ı��еĽű�����ʽ��Ϣ
	 * ���л�����һЩ�Ƿ���ͼƬ����
	 */
	private final static NodeFilter scriptFilter = new NodeFilter() {
		public boolean accept(Node node) {
			if(node instanceof ImageTag){
				ImageTag itag = (ImageTag)node;
				String url = itag.getImageURL();
				if(url!=null){
					url = url.toLowerCase();
					return url.endsWith(".jpg") || url.endsWith(".gif")
							|| url.endsWith(".png") || url.endsWith(".bmp");
				}
			}
			if(node instanceof StyleTag)
				return false;
			if(node instanceof ScriptTag)
				return false;
			if(node.getParent()!=null)
				return accept(node.getParent());
			return true;
		}
	};
	
	/**
	 * �ж��û��Ƿ���ĳ��վ�ĺ�����
	 * @param site
	 * @param user_id
	 * @return
	 */
	protected static boolean isUserInBlackList(SiteBean site, SessionUserObject user){
		if(site.isOwner(user))
			return false;
		return UserDAO.isUserInBlackList(site.getOwner().getId(), user.getId());
	}
	
	/**
	 * ��ȡ��Ч��site
	 * @param site_id
	 * @return
	 */
	protected static SiteBean getSiteByID(int site_id){
		SiteBean site = SiteDAO.getSiteByID(site_id);
		if (site == null || site.getStatus() < SiteBean.STATUS_NORMAL)
			return null;
		return site;
	}
	
	/**
	 * �ӱ༭���ϴ���Ϣ���м�����������¹������ļ���Ϣ
	 * @param userid
	 * @param ref_id
	 * @param ref_type
	 * @return
	 * @throws CapacityExceedException 
	 */
	protected static int pickupUploadFileItems(HttpServletRequest req,
			HttpServletResponse res, int userid, SiteBean site, int ref_id,
			int ref_type) throws CapacityExceedException 
	{
		//���ȴ�Cookie�л�ȡssn_idֵ
		String ssn_id = RequestUtils.getDlogSessionId(req);
		
		if(StringUtils.isEmpty(ssn_id))
			return -1;
		
		int pr = FCKUploadFileDAO.pickupOrphanFiles(userid, ssn_id, site,
				ref_id, ref_type);
		
		RequestUtils.clearDlogSessionId(req, res);
		
		return pr;
	}
	
	/**
	 * �ж�һ����վ�Ƿ������������ֹ��˹���
	 * @param site
	 * @return
	 */
	protected static boolean isIllegalGlossaryIgnore(SiteBean site){
		return site!=null && site.isFlagSet(SiteBean.Flag.ILLEGAL_GLOSSARY_IGNORE);
	}

	/**
	 * �Զ��ж��Ƿ�����ݽ��������ֹ���
	 * @param site
	 * @param content
	 * @return
	 */
	protected static String autoFiltrate(SiteBean site, String content) {
		if(StringUtils.isEmpty(content))
			return null;
		if (isIllegalGlossaryIgnore(site))
			return content;
		else
			return DLOGSecurityManager.IllegalGlossary
					.autoGlossaryFiltrate(content);
	}
	
	/**
	 * �ж��ı����Ƿ����������
	 * @param text
	 * @return
	 */
	protected static boolean existIllegalWord(String text){
		return DLOGSecurityManager.IllegalGlossary.existIllegalWord(text);
	}
	
	/**
	 * ��֤�ͻ��˰�ȫʶ����
	 * @param req
	 * @param form
	 * @throws IllegalAccessException
	 */
	protected static void validateClientId(HttpServletRequest req, FormBean form)
			throws IllegalAccessException {
		if (!UserLoginManager.validateClientId(req, form.get__ClientId()))
			throw new IllegalAccessException();
	}
	
	/**
	 * ��ȡ��ǰ���ڷ��ʵ���վ�������ǵ��ù�validateSiteOwner����ͨ���÷�����ȡ����վ��Ϣ
	 * @param req
	 * @return
	 */
	protected static SiteBean getSiteBean(HttpServletRequest req){
		SiteBean site = (SiteBean)req.getAttribute(KEY_SITE);
		if(site == null){
			try{
				int site_id = Integer.parseInt(req.getParameter(Globals.PARAM_SID));
				site = SiteDAO.getSiteByID(site_id);
				if(site!=null)
					req.setAttribute(KEY_SITE, site);
			}catch(Exception e){}
		}
		return site;
	}

	/**
	 * ��ȡ��ǰ��¼�û�,�����ǵ��ù�validateSiteOwner����ͨ���÷�����ȡ����¼�û���Ϣ
	 * @param req
	 * @return
	 */
	protected static UserBean getLoginUserAfterValidateSiteOwner(HttpServletRequest req) {
		return (UserBean)req.getAttribute(KEY_USER);
	}
	
	/**
	 * ��֤�Ƿ�Ϊվ��
	 * @param req
	 * @param res
	 * @param form
	 * @return
	 */
	protected static ActionMessages validateSiteOwner(HttpServletRequest req,
			HttpServletResponse res, FormBean form) {
		ActionMessages msgs = new ActionMessages();
		do{
			if (form.getSid() < 1) {
				msgs.add("site", new ActionMessage("error.site_not_available"));
				break;
			}
			SiteBean site = getSiteByID(form.getSid());
			if (site == null) {
				msgs.add("site", new ActionMessage("error.site_not_available"));
				break;
			}
			UserBean loginUser = getLoginUser(req, res);
			if (loginUser == null) {
				msgs.add("user", new ActionMessage("error.user_not_login"));
				break;
			}
			if (loginUser.getStatus() != UserBean.STATUS_NORMAL) {
				msgs.add("user", new ActionMessage("error.user_not_available"));
				break;
			}
			if (!site.isOwner(loginUser)) {
				msgs.add("user", new ActionMessage("error.access_deny"));
				break;
			}
			req.setAttribute(KEY_SITE, site);
			req.setAttribute(KEY_USER, loginUser);
			break;
		}while(true);
		return msgs;
	}
	
	/**
	 * �����������ʾ���ݵ�ģ��
	 * @return
	 * @throws IOException
	 */
	protected String getReplyNotifyTemplate() throws IOException{
		return getTemplate("/WEB-INF/conf/reply_notify.html");
	}
	
	/**
	 * ��ȡ����������ʾ����ģ��
	 * @return
	 * @throws IOException
	 */
	protected String getPasswordTipTemplate() throws IOException{
		return getTemplate("/WEB-INF/conf/password_tip.html");
		
	}

	/**
	 * ������ݵ�ģ��
	 * @return
	 * @throws IOException
	 */
	protected String getTemplate(String tmp) throws IOException{
		ServletContext sc = getServlet().getServletContext();
		InputStream in = sc.getResourceAsStream(tmp);
		StringBuffer template = new StringBuffer(512);
		BufferedReader reader = null;
		try{
			reader = new BufferedReader(new InputStreamReader(in));
			do{
				String line = reader.readLine();
				if(line==null)
					break;
				template.append(line);
				template.append("\r\n");
			}while(true);
		}finally{
			in.close();
		}
		return template.toString();
	}
	
	/**
	 * ��ʾ�ı���ʾ��Ϣ������ָ����url��ַ
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @param msg
	 * @param url
	 * @return
	 * @throws IOException 
	 */
	protected static ActionForward msgbox(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, String msg, String url) throws IOException{
		if(StringUtils.isEmpty(url))
			return msgbox(mapping,form,request,response,msg);
		
		if(StringUtils.isNotEmpty(msg))
			request.setAttribute("msg", msg);
		if(StringUtils.isNotEmpty(url))
			request.setAttribute("page", url);
		
		return mapping.findForward("msgbox");
	}
	
	/**
	 * ���ؼ��ı��������
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @param msg
	 * @return
	 * @throws IOException 
	 */
	protected static ActionForward msgbox(ActionMapping mapping,
			ActionForm form, HttpServletRequest request,
			HttpServletResponse response, String msg) throws IOException
	{
		response.setContentType("text/plain;charset=UTF-8");
		response.getWriter().print(msg);
		return null;
	}
	
	/**
	 * ��ȡ��ǰ��¼�û�������
	 * 
	 * @param request
	 * @return
	 */
	protected static UserBean getLoginUser(HttpServletRequest request,
			HttpServletResponse response) {
		return (UserBean)getLoginUser(request,response,true);
	}

	/**
	 * ��ȡ��ǰ��¼�û�������
	 * 
	 * @param request
	 * @return
	 */
	protected static SessionUserObject getLoginUser(HttpServletRequest request,
			HttpServletResponse response, boolean persistence) {
		SessionUserObject user = UserLoginManager.getLoginUser(request, response, true);
		try {
			if(user != null && persistence)
				return UserDAO.getUserByID(user.getId());
		} catch (Exception e) {
			log.error("getLoginUser failed.", e);
		}
		return user;
	}

	protected static ActionForward makeForward(ActionForward forward, int site_id) {
		return makeForward(forward, site_id, null);
	}

	protected static ActionForward makeForward(ActionForward forward, int site_id,
			String extend) {
		StringBuffer uri = new StringBuffer(forward.getPath());
		if (uri.indexOf("?") >= 0)
			uri.append("&sid=");
		else
			uri.append("?sid=");
		uri.append(site_id);
		if (StringUtils.isNotEmpty(extend)) {
			uri.append("&");
			uri.append(extend);
		}
		try {
			return new ActionForward(uri.toString(), true);
		} finally {
			uri = null;
		}
	}

	protected static ActionForward makeForward(ActionForward forward, int site_id,
			String param, int param_value) {
		StringBuffer ext = new StringBuffer();
		ext.append(param);
		ext.append('=');
		ext.append(param_value);
		return makeForward(forward, site_id, ext.toString());
	}

	protected static ActionForward makeForward(ActionForward forward, String p_name,
			String p_value) {
		StringBuffer uri = new StringBuffer(forward.getPath());
		if (uri.indexOf("?") >= 0)
			uri.append('&');
		else
			uri.append('?');
		uri.append(p_name);
		uri.append('=');
		uri.append(p_value);
		return new ActionForward(uri.toString(), true);
	}
	
}
