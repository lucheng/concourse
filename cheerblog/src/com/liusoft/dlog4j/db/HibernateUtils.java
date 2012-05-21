/*
 *  HibernateUtils.java
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
package com.liusoft.dlog4j.db;

import java.net.URL;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.Session;

import com.liusoft.util.db.Hibernate;

/**
 * DLOG4J�����Hibernate�Ĳ����ӿڵķ�װ
 * @author liudong
 */
public class HibernateUtils {
	
	private final static Log log = LogFactory.getLog(HibernateUtils.class);

	private final static String HIBERNATE_CFG = "/hibernate.cfg.xml";
	private static Hibernate hibernate;
	
	static{
		try{
			URL xml = HibernateUtils.class.getResource(HIBERNATE_CFG);
			hibernate = Hibernate.init(xml.getPath());
		}catch(Exception e){
			log.fatal("Hibernate Initialize failed.", e);
		}
	}
	
	/**
	 * Initialize the hibernate environment
	 * @param context
	 * @throws MalformedURLException 
	 */
	public synchronized final static void init(){
		//Nothing to do
	}

	/**
	 * �ͷ�����Hibernateռ�õ���Դ 
	 * @see com.liusoft.dlog4j.servlet.DLOG_ActionServlet#destroy()
	 */
	public synchronized final static void destroy(){
		if(hibernate != null)
			hibernate.destroy();
	}

	public final static Session getSession() {
		if(hibernate != null)
			return hibernate.getSession();
		return null;
	}

	public final static void beginTransaction() {
		if(hibernate != null)
			hibernate.beginTransaction();
	}

	public final static void closeSession() {
		if(hibernate != null)
			hibernate.closeSession();
	}

	public final static void commit() {
		if(hibernate != null)
			hibernate.commit();
	}

	public final static void rollback() {
		if(hibernate != null)
			hibernate.rollback();
	}
    
}
