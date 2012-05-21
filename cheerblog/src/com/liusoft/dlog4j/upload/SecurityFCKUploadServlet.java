/*
 *  FCKEditor_UploadServlet.java
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
package com.liusoft.dlog4j.upload;

import java.io.IOException;
import java.util.Date;
import java.util.Hashtable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liusoft.dlog4j.Globals;
import com.liusoft.dlog4j.SessionUserObject;
import com.liusoft.dlog4j.UserLoginManager;
import com.liusoft.dlog4j.beans.FckUploadFileBean;
import com.liusoft.dlog4j.beans.UserBean;
import com.liusoft.dlog4j.dao.FCKUploadFileDAO;
import com.liusoft.dlog4j.util.RequestUtils;
import com.liusoft.dlog4j.util.StringUtils;

/**
 * ��FCKEditor���ϴ�����Ȩ�޵��ж�
 * 
 * @author Winter Lau
 */
public class SecurityFCKUploadServlet extends FCKEditor_UploadServlet {

	private final static Log log = LogFactory.getLog(SecurityFCKUploadServlet.class);
	
	/**
	 * �����ļ��ϴ�����
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		//�жϵ�ǰ�������Ƿ��Ѿ���¼������д�ռǵ�Ȩ��(�ڶ����޷���֤)
		SessionUserObject loginUser = UserLoginManager.getLoginUser(req, res, true);		
		if(loginUser!=null){			
			super.doPost(req, res);
			Integer errno = (Integer)req.getAttribute("errno");
			if(errno!=null && errno.intValue()==0){
				//д���ϴ���Ϣ����
				FckUploadFileBean fbean = new FckUploadFileBean();
				try{				
					Long fileSize = (Long)req.getAttribute("file.size");
					Integer fileType = (Integer)req.getAttribute("file.type");
					String savePath = (String)req.getAttribute("file.path");
					String uriPath = (String)req.getAttribute("file.uri");
					if(fileSize!=null)
						fbean.setFileSize(fileSize.intValue());
					if(fileType!=null)
						fbean.setFileType(fileType.intValue());
					fbean.setSavePath(savePath);
					fbean.setUri(uriPath);
					HttpSession ssn = req.getSession(true);
					//SESSION_IDͬʱ������Cookie�з�ֹ
					RequestUtils.setCookie(req, res, Globals.SESSION_ID_KEY_IN_COOKIE, ssn.getId(),-1);
					fbean.setSessionId(ssn.getId());
					fbean.setUser(new UserBean(loginUser.getId()));
					fbean.setUploadTime(new Date());
					FCKUploadFileDAO.createUploadFileItem(fbean);
				}catch(Exception e){
					log.error("Writting upload file info failed.", e);
				}
			}
			return;
		}
		res.sendError(HttpServletResponse.SC_FORBIDDEN);
	}

	/**
	 * ֧�ִ�WAP�ϴ�ͼƬ
	 */
	protected void makeOutput(HttpServletRequest req, HttpServletResponse res,
			Hashtable params, String msg) throws IOException {
		String toPage = (String)params.get("toPage");
		if(StringUtils.isEmpty(toPage)){
			super.makeOutput(req, res, params, msg);
		}
		else{
			res.sendRedirect(req.getContextPath() + toPage);
		}
	}

}
