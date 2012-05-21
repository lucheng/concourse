/*
 *  DLOG_ActionServlet.java
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
package com.liusoft.dlog4j.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.converters.SqlDateConverter;

import org.apache.commons.beanutils.converters.SqlTimestampConverter;
import org.apache.struts.action.ActionServlet;

import com.liusoft.dlog4j.DLOGSecurityManager;
import com.liusoft.dlog4j.DLOGUserManager;
import com.liusoft.dlog4j.DLOG_CacheManager;
import com.liusoft.dlog4j.Globals;
import com.liusoft.dlog4j.util.RequestUtils;

/**
 * ��Struts������չ��ʵ��Hibernate�ĳ�ʼ���Լ�����������Զ�����
 * @author liudong
 */
public class DLOG_ActionServlet extends ActionServlet {

	private String encoding;

	static {
		ConvertUtils.register(new SqlDateConverter(null), java.sql.Date.class);
		ConvertUtils.register(new SqlTimestampConverter(null), java.sql.Timestamp.class);
	}

	/**
	 * Globals.WEBAPP_PATH����ֵ��ʹ��access���ݿ���˵�ǳ���Ҫ���漰һ�����·��������
	 */
	public void init() throws ServletException {
		ServletContext context = getServletContext();
		if (Globals.WEBAPP_PATH == null)
			Globals.WEBAPP_PATH = context.getRealPath("");
		//��ʼ��ϵͳ��ȫ����
		try {
			DLOGSecurityManager.init(context);
		} catch (IOException e) {
			throw new ServletException(e);
		}
		//��ʼ���û����Ϲ���ӿ�
		try {
			DLOGUserManager.init(context);
		} catch (Exception e) {
			throw new ServletException(e);
		}
		//ִ��Struts�ĳ�ʼ������
		super.init();
		
		encoding = getInitParameter("encoding");
		if(encoding==null)
			encoding = Globals.ENC_UTF_8;
	}

	/**
	 * ʵ�ֶԱ�����Զ�ת�봦��
	 * @param req
	 * @param res
	 * @throws ServletException
	 * @throws IOException
	 * @see org.apache.struts.action.ActionServlet#process(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	protected void process(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		HttpServletRequest request;
		if (RequestUtils.isMultipart(req)) {
			//�ļ����ı��봦��
			request = req;
			request.setCharacterEncoding(encoding);
		} else {
			//�Զ����봦��
			String enc = req.getCharacterEncoding();
			if (req instanceof RequestProxy)
				request = req;
			else if (encoding.equalsIgnoreCase(enc))
				request = req;
			else
				request = new RequestProxy(req, encoding);
		}
		super.process(request, res);
	}

	public void destroy() {
		//�ͷŻ��������
		DLOG_CacheManager.shutdown();
		DLOGSecurityManager.destroy();
		DLOGUserManager.destroy();
		//�ͷ�Struts
		super.destroy();
	}

}
