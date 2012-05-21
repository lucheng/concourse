/*
 *  SiteAction.java
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
 */
package com.liusoft.dlog4j;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.commons.lang.StringUtils;

/**
 * DLOG�ڰ�ȫ�����һЩ������ 
 * ���дʻ��/WEB-INF/conf/illegal_glossary.dat
 * 
 * @author Winter Lau
 */
public class DLOGSecurityManager {

	/**
	 * ��ʼ��
	 * @param sc
	 * @throws IOException
	 * 
	 * @see com.liusoft.dlog4j.servlet.DLOG_ActionServlet#init()
	 */
	public static void init(ServletContext sc) throws IOException {
		IllegalGlossary.init(sc);
	}
	
	public static void destroy(){
		IllegalGlossary.destroy();
	}
	
	/**
	 * �����ֻ�
	 * @author Winter Lau
	 */
	public static class IllegalGlossary {

		private final static String file_glossary = "/WEB-INF/conf/illegal_glossary.dat";
		
		private static List glossary = null;
		
		public static void init(ServletContext sc) throws IOException {
			glossary = new ArrayList(1000);
			if(sc!=null)
				loadIllegalGlossary(sc);
		}

		public static void destroy(){
			if(glossary!=null)
				glossary.clear();
		}
		
		/**
		 * �������дʻ��
		 * @param sc
		 * @throws IOException 
		 */
		private synchronized static void loadIllegalGlossary(ServletContext sc) throws IOException {
			InputStream in = sc.getResourceAsStream(file_glossary);
			BufferedReader reader = null;
			try{
				reader = new BufferedReader(new InputStreamReader(in));
				do{
					String line = reader.readLine();
					if(line==null)
						break;
					glossary.add(line.trim());
				}while(true);
			}finally{
				in.close();
			}
		}

		/**
		 * �Զ������дʻ���XXX�滻
		 * 
		 * @param content
		 * @return
		 */
		public static String autoGlossaryFiltrate(String content) {
			if(StringUtils.isEmpty(content))
				return content;
			for (int i = 0; i < glossary.size(); i++) {
				String word = (String)glossary.get(i);
				content = StringUtils.replace(content, word, StringUtils
						.repeat("X", word.length()));
			}
			return content;
		}
		
		/**
		 * �ж��Ƿ���ڷǷ�����
		 * @param content
		 * @return
		 */
		public static boolean existIllegalWord(String content){
			if(StringUtils.isEmpty(content))
				return false;
			for (int i = 0; i < glossary.size(); i++) {
				String word = (String) glossary.get(i);
				if(content.indexOf(word)>=0)
					return true;
			}
			return false;
		}
		
		/**
		 * ɾ�������д��ڵĹؼ���
		 * @param content
		 * @return
		 */
		public static String deleteIllegalWord(String content){
			if(StringUtils.isEmpty(content))
				return content;
			for (int i = 0; i < glossary.size(); i++) {
				String word = (String) glossary.get(i);
				content = StringUtils.remove(content, word);
			}
			return content;
		}
		
	}

	public static void main(String[] args) throws IOException{
		init(null);
		String text = "�л����񹲺͹�������ϯë�󶫣����ǽ���ë��ϯ";
		System.out.println(IllegalGlossary.autoGlossaryFiltrate(text));
	}
}
