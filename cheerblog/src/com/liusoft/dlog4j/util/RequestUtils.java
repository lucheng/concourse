/*
 *  RequestUtils.java
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
package com.liusoft.dlog4j.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.text.MessageFormat;
import java.util.Enumeration;
import java.util.Iterator;
import java.util.Properties;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.liusoft.dlog4j.Globals;

/**
 * ����Request�Ĺ�����
 * @author Winter Lau
 */
public class RequestUtils extends org.apache.struts.util.RequestUtils{

	final static Log log = LogFactory.getLog(RequestUtils.class);
	
	private static Properties header_map;
	private static String default_mobile; 
	static{
		InputStream in = RequestUtils.class.getResourceAsStream("/com/liusoft/dlog4j/util/mobile_match.properties");
		header_map = new Properties();
		try{
			header_map.load(in);
			default_mobile = header_map.getProperty("empty");
		}catch(IOException e){
			log.error("�����ֻ�����ƥ������ļ�/mobile_match.confʧ��",e);
		}
	}

	public static boolean isMultipart(HttpServletRequest req) {
		return ((req.getContentType() != null) && (req.getContentType()
				.toLowerCase().startsWith("multipart")));
	}

	/**
	 * ��ȡFCKUpload���������ɵĻỰID
	 * @return
	 */
	public static String getDlogSessionId(HttpServletRequest req){
		//���ȴ�Cookie�л�ȡssn_idֵ
		String ssn_id = null;
		Cookie cok = RequestUtils.getCookie(req, Globals.SESSION_ID_KEY_IN_COOKIE);
		if(cok != null){
			ssn_id = cok.getValue();
		}
		if(StringUtils.isEmpty(ssn_id)){
			//���Cookie�ò�����ӷ������ĻỰ�ж�ȡ
			HttpSession ssn = req.getSession(false);
			if (ssn != null)
				ssn_id = ssn.getId();
		}
		return ssn_id;
	}
	
	/**
	 * ���FCKUpload���������ɵ�Cookie
	 * @param req
	 * @param res
	 */
	public static void clearDlogSessionId(HttpServletRequest req, HttpServletResponse res){
		Cookie cok = RequestUtils.getCookie(req, Globals.SESSION_ID_KEY_IN_COOKIE);
		if(cok != null){
			cok.setMaxAge(0);
			res.addCookie(cok);
		}
	}
	
	/**
	 * ��ȡCOOKIE
	 * 
	 * @param name
	 */
	public static Cookie getCookie(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();
		if(cookies == null)
			return null;
		for (int i = 0; i < cookies.length; i++) {
			if (name.equals(cookies[i].getName())) {
				return cookies[i];
			}
		}
		return null;
	}

	/**
	 * ����COOKIE
	 * 
	 * @param name
	 * @param value
	 * @param maxAge
	 */
	public static void setCookie(HttpServletRequest request, HttpServletResponse response, String name,
			String value, int maxAge) {
		Cookie cookie = new Cookie(name, value);
		cookie.setMaxAge(maxAge);
		String serverName = request.getServerName();
		String domain = getDomainOfServerName(serverName);
		if(domain!=null && domain.indexOf('.')!=-1){
			cookie.setDomain('.' + domain);
		}
		cookie.setPath("/");
		response.addCookie(cookie);
	}
	
	/**
	 * ��ȡ�û�����URL�еĸ�����
	 * ����: www.dlog.cn -> dlog.cn
	 * @param req
	 * @return
	 */
	public static String getDomainOfServerName(String host){
		if(StringUtils.isIPAddr(host))
			return null;
		String[] names = StringUtils.split(host, '.');
		int len = names.length;
		if(len>=2)
			return names[len-2]+'.'+names[len-1];
		return host;
	}
	
	public static void main(String[] args){
		String host = "127.0.0.1";
		System.out.println("DOMAIN: " + getDomainOfServerName(host));		
		host = "dlog.cn";
		System.out.println("DOMAIN: " + getDomainOfServerName(host));		
		host = "abc.mail.dlog.cn";
		System.out.println("DOMAIN: " + getDomainOfServerName(host));		
	}

	/**
	 * ��URL��ַ�н�����URLǰ׺������
	 * http://wap.mo168.com:8081/index.jsp -> http://wap.mo168.com:8081
	 * @param req
	 * @return
	 */
	public static String getUrlPrefix(HttpServletRequest req){
		StringBuffer url = new StringBuffer(req.getScheme());
		url.append("://");
		url.append(req.getServerName());
		int port = req.getServerPort();
		if(port!=80){
			url.append(":");
			url.append(port);
		}
		return url.toString();
	}
	
	/**
	 * ��ȡ���ʵ�URLȫ·��
	 * @param req
	 * @return
	 */
	public static String getRequestURL(HttpServletRequest req){
		StringBuffer url = new StringBuffer(req.getRequestURI());
		String param = req.getQueryString();
		if(param!=null){
			url.append('?');
			url.append(param);
		}
		String path = url.toString();
		return path.substring(req.getContextPath().length());
	}

	
	/**
	 * ��ӡ���е�ͷ��Ϣ
	 * @param out
	 * @param req
	 */
	public static void dumpHeaders(PrintStream out, HttpServletRequest req){
		Enumeration names = req.getHeaderNames();
		while(names.hasMoreElements()){
			String name = (String)names.nextElement();
			out.println(name+"="+req.getHeader(name));
		}
	}
	/**
	 * �������н����ֻ�����
	 * @param req
	 * @return
	 */
	public static String getRequestMobile(HttpServletRequest req){
		String mobile = default_mobile;
		Iterator keys = header_map.keySet().iterator();
		while(keys.hasNext()){
			String header = (String)keys.next();
			String value = getHeader(req,header);
			if(value!=null){
				String pattern = (String)header_map.get(header);
				MessageFormat mf = new MessageFormat(pattern);
				try{
					Object[] vs = mf.parse(value);
					mobile = (String)vs[0];
					if(mobile.startsWith("86"))
						mobile = mobile.substring(2);
					break;
				}catch(Exception e){
					log.warn("����headerʧ��",e);
					dumpHeaders(req, System.err);
					continue;
				}
			}
		}
		return mobile;
	}
	
	/**
	 * ��ȡheader��Ϣ�����ִ�Сд�޹�
	 * @param req
	 * @param name
	 * @return
	 */
	public static String getHeader(HttpServletRequest req, String name){
		String value = req.getHeader(name);
		if(value!=null)
			return value;
		Enumeration names = req.getHeaderNames();
		while(names.hasMoreElements()){
			String n = (String)names.nextElement();
			if(n.equalsIgnoreCase(name)){
				return req.getHeader(n);
			}
		}
		return null;
	}
	
	/**
	 * ��ӡ����ͷ��Ϣ
	 * @param req
	 * @param out
	 */
	public static void dumpHeaders(HttpServletRequest req, PrintStream out){
		Enumeration hds = req.getHeaderNames();
		out.println("=============== HEADERS ===============");
		while(hds.hasMoreElements()){
			String name = (String)hds.nextElement();
			out.println(name+"="+req.getHeader(name));
		}
	}

	/**
	 * �ж��ֻ��Ƿ�֧��ĳ�����͵ĸ�ʽ
	 * @param req
	 * @param contentType
	 * @return
	 */
	public static boolean support(HttpServletRequest req, String contentType){
		String accept = getHeader(req, "accept");
		if(accept!=null){
			accept = accept.toLowerCase();
			return accept.indexOf(contentType.toLowerCase())!=-1;
		}
		return false;
	}
	
	/**
	 * �ж�������Ƿ���Mozilla����
	 * @param req
	 * @return
	 */
	public static boolean isMozillaCompatible(HttpServletRequest req){
		String user_agent = req.getHeader("user-agent");
		return user_agent==null || user_agent.indexOf("Mozilla")!=-1;
	}

	/**
	 * ��ȡ������ύ�����β���
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static int getParam(HttpServletRequest req, String param, int defaultValue){
		try{
			String value = req.getParameter(param);
			int idx = value.indexOf('#');
			if(idx!=-1)
				value = value.substring(0,idx);
			return Integer.parseInt(value);
		}catch(Exception e){}
		return defaultValue;
	}
	/**
	 * ��ȡ������ύ���ַ�������
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public static String getParam(HttpServletRequest req, String param, String defaultValue){
		String value = req.getParameter(param);
		return (StringUtils.isEmpty(value))?defaultValue:value;
	}

}
