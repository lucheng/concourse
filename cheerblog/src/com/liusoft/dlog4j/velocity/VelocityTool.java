/*
 *  VelocityTool.java
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

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.MessageResources;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.tools.struts.StrutsUtils;
import org.apache.velocity.tools.view.context.ViewContext;
import org.apache.velocity.tools.view.tools.Configurable;
import org.apache.velocity.tools.view.tools.ViewTool;
import org.htmlparser.Node;
import org.htmlparser.NodeFilter;
import org.htmlparser.Parser;
import org.htmlparser.nodes.TextNode;
import org.htmlparser.util.NodeList;
import org.htmlparser.util.ParserException;

import com.liusoft.dlog4j.Globals;
import com.liusoft.dlog4j.util.DateUtils;
import com.liusoft.dlog4j.util.LunarCalendar;
import com.liusoft.dlog4j.util.RequestUtils;
import com.liusoft.dlog4j.util.StringUtils;

/**
 * Velocity������Ļ���
 * @author liudong
 */
public abstract class VelocityTool implements ViewTool, Configurable {

	private static Log log = LogFactory.getLog(VelocityTool.class);
	
	protected HttpServletRequest request;
	protected HttpServletResponse response;
	protected ServletContext context;
	protected VelocityContext velocity;

	protected Map params;
	
	/*
	 * Initialize toolbox
	 * @see org.apache.velocity.tools.view.tools.ViewTool#init(java.lang.Object)
	 */
	public void init(Object arg0) {
		//scope: request or session
		if(arg0 instanceof ViewContext){
			ViewContext viewContext = (ViewContext) arg0;
			request = viewContext.getRequest();
			response = viewContext.getResponse();
			context = viewContext.getServletContext();
			velocity = (VelocityContext)viewContext.getVelocityContext();
		}
		//scope: application
		else if(arg0 instanceof ServletContext){
			context = (ServletContext)arg0;
		}
	}
	
	/**
	 * Call by VelocityViewServlet
	 */
	public void configure(Map arg0) {
		this.params = arg0;	
		try {
			BeanUtils.populate(this, arg0);
		} catch (Exception e) {
			log.error("Populate parameters to "+getClass().getName()+" failed.", e);
		}
	}
	
	/**
	 * ����Cookie
	 * @param key
	 * @param value
	 * @param maxAge
	 */
	public void set_cookie(String key, String value, int maxAge){
		RequestUtils.setCookie(request, response, key, value, maxAge);
	}

	/**
	 * ����Cookie
	 * @param key
	 * @param value
	 * @param maxAge
	 */
	public void set_cookie(String key, int value, int maxAge){
		RequestUtils.setCookie(request, response, key, String.valueOf(value), maxAge);
	}
	
	public int get_cookie_as_int(String key){
		Cookie cookie = RequestUtils.getCookie(request, key);
		if(cookie == null)
			return -1;
		try{
			return Integer.parseInt(cookie.getValue());
		}catch(Exception e){}
		return -1;
	}
	
	/**
	 * ���쳣��Ϣת�����ַ���
	 * @param t
	 * @return
	 * @throws IOException 
	 */
	public String exception(Throwable t) throws IOException{
		if(t == null)
			return null;
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try{
			t.printStackTrace(new PrintStream(baos));
		}finally{
			baos.close();
		}
		return baos.toString();
	}
	
	/**
	 * ����ǰ�����ķ������쳣תΪ�ַ���
	 * @return
	 * @throws IOException
	 */
	public String exception() throws IOException{
		Throwable t = (Throwable)request.getAttribute(PageContext.EXCEPTION);
		if(t==null){
			//Tomcat�Ĵ�����ʽ
			t = (Throwable)request.getAttribute("javax.servlet.error.exception");
		}
		return exception(t);
	}

	/**
	 * ���ص�ǰʱ���
	 * @return
	 */
	public long current_timestamp(){
		return System.currentTimeMillis();
	}
	
	/**
	 * ���غ�ʱ
	 * @param start_time
	 * @return
	 */
	public long time_consume(long start_time){
		return System.currentTimeMillis() - start_time;
	}
	
	/**
	 * �жϵ�ǰ������Ƿ�֧��ĳ�ָ�ʽ����
	 * @param contentType
	 * @return
	 */
	public boolean support_content_type(String contentType){
		return RequestUtils.support(request, contentType);
	}

	/**
	 * ����Toolbox��ĳ�ʼ������
	 * @param key
	 * @return
	 */
	protected String get_velocity_param(String key){
		return (String)params.get(key);
	}

    /**
     * �ض���һ��ҳ��
     * @param url
     * @throws IOException
     */
    public void redirect(String url) throws IOException{
    	response.sendRedirect(url);
    }
    
    /**
     * ת��HTML�ɴ��ı���������ʾ�������ۻ������ռ�����ҳ��Ԥ����Ϣ
     * @param html
     * @return
     * @throws UnsupportedEncodingException
     * @throws ParserException 
     */
	public String plain_text(String html) throws UnsupportedEncodingException, ParserException{
		if(html==null) return null;
		StringBuffer text = new StringBuffer();
		Parser parser = new Parser();
		parser.setInputHTML(html);
		parser.setEncoding(Globals.ENC_8859_1);
		//�������еĽڵ�
		NodeList nodes;
		try {
			nodes = parser.extractAllNodesThatMatch(nfilter);
		} catch (ParserException e) {
			return html;
		}
		for(int i=0;i<nodes.size();i++){
			TextNode node = (TextNode)nodes.elementAt(i);
			text.append(node.getText());
		}
		return StringUtils.remove(text.toString(),"&nbsp;");
	}

	/**
	 * ������ȡHTML�еĴ��ı���Ϣ�����˵����е�HTML��ǩ
	 */
    private final static NodeFilter nfilter = new NodeFilter() {
		public boolean accept(Node node) {
			//IMPORTANT: ֻ��ʾTextNode������
			return (node instanceof TextNode);
		}
    };
    
	public String current_template(){
		return velocity.getCurrentTemplateName();
	}
	
	/**
	 * ȡ��ĳ��ҳ��ģ��ľ���·��
	 * @param page
	 * @return
	 */
	public String absolute_path(String page){
		if(page.startsWith("/"))
			return page;
		String cur_t = current_template();
		String path = cur_t.substring(0, cur_t.lastIndexOf("/"));
		return path + '/' + page;
	}
	
	/**
	 * �ж�ĳ�������Ƿ�Ϊ����
	 * @param year
	 * @param month
	 * @param date
	 * @return
	 */
	public boolean is_today(int year, int month, int date){
		Calendar today = Calendar.getInstance();
		today.set(Calendar.YEAR, year);
		today.set(Calendar.MONTH, month - 1);
		today.set(Calendar.DATE, date);
		return is_today(today.getTime());
	}
	
	/**
	 * �ж�ĳ�������Ƿ�Ϊ����
	 * @param date
	 * @return
	 */
	public boolean is_today(Date date){
		if(date==null)
			return false;
		return DateUtils.isSameDay(new Date(System.currentTimeMillis()), date);
	}
	
	/**
	 * ��ȡHTTPͷ
	 * @param name
	 * @return
	 */
	public String http_header(String name){
		return RequestUtils.getHeader(request, name);
	}
	
	/**
	 * �ַ������ܽض�
	 * @param str
	 * @param maxWidth
	 * @return
	 */
	public String abbreviate(String str, int maxWidth){
		if(str==null) return null;
		return StringUtils.abbreviate(str,maxWidth);
	}
	
	public void debug(Object obj) {
		System.out.println(obj);
	}

	/**
	 * ��ȡ��ǰ�������Դ��
	 * 
	 * @return
	 */
	public String get_request_file() {
		String url = request.getRequestURL().toString();
		int idx = url.lastIndexOf('/');
		return url.substring(idx + 1);
	}

	/**
	 * ��ȡ��ǰ�����URL��ַ
	 * 
	 * @return
	 */
	public String get_request_url() {
		return RequestUtils.getRequestURL(request);
	}

	/**
	 * �ж��Ƿ���һ���Ϸ����ʼ���ַ
	 * 
	 * @param email
	 * @return
	 */
	public boolean is_email(String email) {
		return StringUtils.isEmail(email);
	}
	
	public boolean is_post(){
		return "post".equalsIgnoreCase(request.getMethod());
	}
	
	public boolean is_get(){
		return "get".equalsIgnoreCase(request.getMethod());
	}

	/**
	 * ��ʾ���������
	 * @return
	 */
	public String today(){
		Locale locale = request.getLocale();
		String fmt = null;
		if(locale!=null && "zh".equalsIgnoreCase(locale.getLanguage()))
			fmt = "yyyy��M��d�� EEEEE";
		else
			fmt = "yyyy/MM/dd EEEEE";
		return new SimpleDateFormat(fmt, locale).format(Calendar.getInstance(locale).getTime());
	}

	/**
	 * �õ�����Ľ���(������ǰ�������ں�)
	 * ���ͬʱ�������������Ͷ���,�����
	 * @return
	 */
	public String festival(){
		long[] ds = LunarCalendar.today();
		NumberFormat nf = NumberFormat.getInstance();
		nf.setMaximumFractionDigits(0);
		nf.setMinimumIntegerDigits(2);
		String nongli = nf.format(ds[1]) + nf.format(ds[2]);
		Calendar cal = Calendar.getInstance();
		String yangli = nf.format(cal.get(Calendar.MONTH)+1)+nf.format(cal.get(Calendar.DATE));
		//System.out.printf("nongli=%s,yangli=%s\r\n",nongli,yangli);
		String f_nl = getMessage(request, "festival", 'Y'+nongli);
		String f_yl = getMessage(request, "festival", yangli);
		if(f_nl!=null && f_yl!=null)
			return f_yl + "," + f_nl;
		if(f_nl!=null)
			return f_nl;
		if(f_yl!=null)
			return f_yl;
		return null;
	}
	

	/**
	 * ��ȡ��Դ�ж������Ϣ
	 * @param req
	 * @param bundle
	 * @param key
	 * @return
	 */
    protected String getMessage(HttpServletRequest req, String bundle, String key) {
    	if(key==null)
    		return null;
    	MessageResources res = StrutsUtils.getMessageResources(req, context, bundle);
    	if(res==null)
    		return null;
    	return res.getMessage(key);
    }

	/**
	 * ��ʽ����ǰ�µ�һ�������
	 * 
	 * @param formatter
	 * @return
	 */
	public String format_now_month(String formatter) {
		SimpleDateFormat sdf = new SimpleDateFormat(formatter, Locale.ENGLISH);
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DATE, 1);
		return sdf.format(cal.getTime());
	}

	/**
	 * ��ȡwebӦ�õ�������·��
	 * 
	 * @return
	 */
	public String root() {
		return request.getContextPath();
	}

	/**
	 * ��ȡ������ύ�����β���
	 * 
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public int param(String param, int defaultValue) {
		return RequestUtils.getParam(request, param, defaultValue);
	}

	/**
	 * ��ȡ������ύ���ַ�������
	 * 
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public String param(String param, String defaultValue) {
		return RequestUtils.getParam(request, param, defaultValue);
	}
	
	public String param(String param){
		return request.getParameter(param);
	}

	/**
	 * ��ȡ������ύ�����β���
	 * 
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public int get_attr(String param, int defaultValue) {
		try {
			return Integer.parseInt((String) request.getAttribute(param));
		} catch (Exception e) {
		}
		return defaultValue;
	}

	/**
	 * ��ȡ������ύ���ַ�������
	 * 
	 * @param param
	 * @param defaultValue
	 * @return
	 */
	public Object get_attr(String param, Object defaultValue) {
		Object value = request.getAttribute(param);
		return (value == null) ? defaultValue : value;
	}

	public boolean is_empty(String str) {
		return str == null || str.trim().length() == 0;
	}

	public boolean not_empty(String str) {
		return !is_empty(str);
	}

	/**
	 * ��URL�н�����������ַ
	 * 
	 * @param url
	 * @return
	 */
	public String host(String url) {
		try {
			url = new java.net.URL(url).getHost();
		} catch (Exception e) {}
		return url;
	}

	/**
	 * HTML������ݸ�ʽת��
	 * 
	 * @param content
	 * @return
	 * @see org.apache.velocity.tools.generic.EscapeTool#html(java.lang.Object)
	 */
	public String format_html(String content) {
		return StringUtils.formatContent(content);
	}

	/**
	 * �ı��滻(login.vm)
	 * 
	 * @param src
	 * @param srcText
	 * @param desText
	 * @return
	 */
	public String replace(String src, String srcText, String desText) {
		return StringUtils.replace(src, srcText, desText);
	}

	public void dump() {
		RequestUtils.dumpHeaders(request, System.out);
	}

	/**
	 * ���ݼ�¼����ÿҳ��ʵ������ȷ��ҳ��
	 * @param recordCount
	 * @param perPage
	 * @return
	 */
	public int page_count(int recordCount, int perPage) {
		int pc = (int)Math.ceil(recordCount / (double)perPage);
		if(pc==0)
			pc = 1;
		return pc;
	}

	/**
	 * ��ȡ��ǰ���ڷ��ʵ��û����ֻ�����
	 * 
	 * @return
	 */
	public String mobile() {
		return RequestUtils.getRequestMobile(request);
	}

	/**
	 * ��������Ĵ�С
	 * @param objs
	 * @return
	 */
	public int sizeof(Object[] objs){
		return (objs!=null)?objs.length:0;
	}
	
}
