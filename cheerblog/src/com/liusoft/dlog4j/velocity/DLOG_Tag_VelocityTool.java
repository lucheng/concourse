/*
 *  DLOG_Tag_VelocityTool.java
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

import java.util.ArrayList;
import java.util.List;

import com.liusoft.dlog4j.DLOG_CacheManager;
import com.liusoft.dlog4j.beans.SiteBean;
import com.liusoft.dlog4j.dao.TagDAO;
import com.liusoft.dlog4j.util.StringUtils;

/**
 * ��ǩ���ܵ�Toolbox�࣬���ӣ�
 * $TAG_tool.list_hot_tags()
 * TODO: ����һ�ֺ��ʵĻ������
 * @author Winter Lau
 */
public class DLOG_Tag_VelocityTool{

	private final static String CACHE_KEY_HOT_TAGS = "DLOG4J_hot_tags";
	/**
	 * ��ȡ��ҳ�����ű�ǩ
	 * @param site
	 * @param count
	 * @return
	 */
	public List list_hot_tags(SiteBean site, int count){
		String nSite = "stat_info_"+((site!=null)?site.getId():0);
		ArrayList tags = (ArrayList)DLOG_CacheManager.getObjectCached(CACHE_KEY_HOT_TAGS, nSite);
		if(tags==null){
			tags = (ArrayList)TagDAO.listHotTags(site, count);
			DLOG_CacheManager.putObjectCached(CACHE_KEY_HOT_TAGS, nSite, tags);
		}
		return tags;
	}
	
	/**
	 * ��ȡ��ǩ����
	 * @param site
	 * @return
	 */
	public int tag_count(SiteBean site){
		return TagDAO.getTagCount(site);
	}
	
	/**
	 * �����ų̶������ǩ
	 * @param site
	 * @param page
	 * @param count
	 * @return
	 */
	public List list_tags(SiteBean site, int page, int count){
		int fromIdx = (page - 1) * count;		
		return TagDAO.listTags(site, fromIdx, count);
	}

	/**
	 * ��ȡָ��ĳ����ǩ���ռ���
	 * @param site
	 * @param tagname
	 * @return
	 */
	public int diary_count_of_tag(SiteBean site, String tagname){
		if(StringUtils.isEmpty(tagname))
			return -1;
		return TagDAO.getDiaryCountForTag(site, tagname);
	}

	/**
	 * ��ȡָ��ĳ����ǩ����Ƭ��
	 * @param site
	 * @param tagname
	 * @return
	 */
	public int photo_count_of_tag(SiteBean site, String tagname){
		if(StringUtils.isEmpty(tagname))
			return -1;
		return TagDAO.getPhotoCountForTag(site, tagname);
	}

	/**
	 * ��ȡָ��ĳ����ǩ��������
	 * @param site
	 * @param tagname
	 * @return
	 */
	public int topic_count_of_tag(SiteBean site, String tagname){
		if(StringUtils.isEmpty(tagname))
			return -1;
		return TagDAO.getTopicCountForTag(site, tagname);
	}

	/**
	 * �г�ĳ����ǩ����ע�������ռ�
	 * @param site
	 * @param tagname
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List diarys_of_tag(SiteBean site, String tagname, int page, int pageSize){
		if(StringUtils.isEmpty(tagname))
			return null;
		if(pageSize<0 || pageSize>200)
			pageSize = 50;
		int fromIdx = (page-1)*pageSize;
		if(fromIdx < 0)
			fromIdx = 0;
		if(site==null)
			return TagDAO.listDiaryForTag(tagname, fromIdx, pageSize);
		else
			return TagDAO.listDiaryForTag(site, tagname, fromIdx, pageSize);
	}
	
	/**
	 * �г�ĳ����ǩ����ע��������Ƭ
	 * @param site
	 * @param tagname
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List photos_of_tag(SiteBean site, String tagname, int page, int pageSize){
		if(StringUtils.isEmpty(tagname))
			return null;
		if(pageSize<0 || pageSize>200)
			pageSize = 50;
		int fromIdx = (page-1)*pageSize;
		if(fromIdx < 0)
			fromIdx = 0;
		if(site==null)
			return TagDAO.listPhotosForTag(tagname, fromIdx, pageSize);
		else
			return TagDAO.listPhotosForTag(site, tagname, fromIdx, pageSize);
	}
	/**
	 * �г�ĳ����ǩ����ע����������
	 * @param site
	 * @param tagname
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public List topics_of_tag(SiteBean site, String tagname, int page, int pageSize){
		if(StringUtils.isEmpty(tagname))
			return null;
		if(pageSize<0 || pageSize>200)
			pageSize = 50;
		int fromIdx = (page-1)*pageSize;
		if(fromIdx < 0)
			fromIdx = 0;
		if(site==null)
			return TagDAO.listTopicsForTag(tagname, fromIdx, pageSize);
		else
			return TagDAO.listTopicsForTag(site, tagname, fromIdx, pageSize);
	}
}
