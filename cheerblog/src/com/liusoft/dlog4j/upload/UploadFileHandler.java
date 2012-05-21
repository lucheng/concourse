/*
 *  UploadFileHandler.java
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

import java.io.File;

import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.liusoft.dlog4j.base.FckUploadFileBeanBase;

/**
 * �ϴ�����ļ�����ӿ�
 * @author Winter Lau
 */
public interface UploadFileHandler {
	
	/**
	 * ��ʼ���ļ�����ӿ�
	 * @param config
	 */
	public void init(ServletConfig config);
	
	/**
	 * �����ϴ�����ļ������ظ��ļ���Ӧ��URL��ַ
	 * �����������ͼƬ�Ĵ洢·��,����
	 * req.setAttribute("file.path", newFile);
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public String save(HttpServletRequest req, HttpServletResponse res, File file) throws Exception;
	
	/**
	 * ɾ��һ���ϴ��ļ�����Ϣ
	 * @param fbean
	 * @return
	 * @throws Exception
	 */
	public boolean remove(FckUploadFileBeanBase fbean) throws Exception;
	
	/**
	 * �˳�
	 */
	public void destroy();

}
