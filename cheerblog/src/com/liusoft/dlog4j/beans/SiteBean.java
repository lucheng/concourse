/*
 *  SiteBean.java
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
 *  
 */
package com.liusoft.dlog4j.beans;

import java.util.Date;
import java.util.List;

import com.liusoft.dlog4j.SessionUserObject;
import com.liusoft.dlog4j.base.FunctionName;
import com.liusoft.dlog4j.base.FunctionStatus;
import com.liusoft.dlog4j.base.SiteStyleInfo;
import com.liusoft.dlog4j.base.SpaceCapacityInfo;
import com.liusoft.dlog4j.base._BeanBase;
import com.liusoft.dlog4j.dao.CatalogDAO;
import com.liusoft.dlog4j.util.StringUtils;

/**
 * վ�����
 * @author liudong
 */
public class SiteBean extends _BeanBase {

	public final static int ACCESS_MODE_PUBLIC = 0x00;		//��ȫ����
	public final static int ACCESS_MODE_SECRET_CODE = 0x01;	//ƾ�������
	public final static int ACCESS_MODE_FRIEND = 0x02;		//ֻ���ѿ��Է���
	public final static int ACCESS_MODE_PRIVATE = 0x03;		//ֻվ�����Է���
	public final static int ACCESS_MODE_LOGIN = 0x04;		//ֻ�е�¼�û����Է���
	
	public final static int SITE_TYPE_INDIVIDUAL = 0x01;	//������վ
	public final static int SITE_TYPE_CORPORATION= 0x02;	//��ҵ��վ
	public final static int SITE_TYPE_PRODUCTION = 0x03;	//��Ʒ��վ
	
	protected TypeBean catalog; //���
	/**
	 * ��վΨһ��ʶ��������Ӣ�ġ����ֻ����»��ߵ���ϣ�����javayou
	 */
	protected String uniqueName;
	
	/**
	 * �û������������ַURL��ַ������ http://www.javayou.com
	 * ����û�û��ָ����ֵ������վ��ַΪhttp://dlogcn.com/sites/{uniqueName} 
	 */
	protected String url;
	
	protected String friendlyName;
	protected String title;
	protected String detail;
	protected String icpNumber;		//ICP֤���
	protected SiteStyleInfo style;	//��վ��ʽ
	protected Date createTime;
	protected Date lastTime;
	protected Date expiredTime;		//��վʧЧʱ�䣬�����ʱ��Ϊ��������ʧЧ
	protected UserBean owner;		//��վ������
	protected int status;
	protected int flag;
	protected int type = SITE_TYPE_INDIVIDUAL;	//��վ����
	protected int level = 1;
	
	protected int accessMode = ACCESS_MODE_PUBLIC;
	protected String accessCode;
	
	protected Date lastExportTime;
	
	protected FunctionStatus functionStatus;
	protected FunctionName functionName;
	
	protected SpaceCapacityInfo capacity;
	
	protected List links;
	protected List catalogs;
	protected List albums;
	protected List forums;
	protected List musicBoxes;
	protected List musicsRecommend;
	protected List songs;

	/**
	 * �ж��û��Ƿ�Ϊվ��
	 * @param user
	 * @return
	 */
	public boolean isOwner(SessionUserObject user){
		if(user == null)
			return false;
		return (owner.getId() == user.getId() || isSuperior(user));
	}
	
	/**
	 * �ж��û��ǲ��ǳ�������Ա
	 * @param user
	 * @return
	 */
	public static boolean isSuperior(SessionUserObject user){
		return false;
	}
	
	public SiteBean(){}
	
	public SiteBean(int site_id){
		setId(site_id);
	}

	/**
	 * ���ظ���վ����ַ���÷����ж��û��Ƿ��趨url����
	 * ������򷵻�url�����򷵻���������վ���еķ�������
	 * @param baseURL
	 * @return
	 */
	public String siteURL(String baseURL){
		if(StringUtils.isEmpty(url))
			return baseURL + uniqueName;
		if(!url.startsWith("http://"))
			return "http://" + url;
		return url;
	}

	public CatalogBean catalog(int cat_id){
		try{
			for(int i=0;catalogs!=null&&i<catalogs.size();i++){
				CatalogBean cat = (CatalogBean)catalogs.get(i);
				if(cat.getId()==cat_id)
					return cat;
			}
		}catch(Exception e){
			return CatalogDAO.getCatalogByID(cat_id);
		}
		return null;
	}
	
	public AlbumBean album(int album_id){
		for(int i=0;albums!=null&&i<albums.size();i++){
			AlbumBean album = ((AlbumBean)albums.get(i)).album(album_id);
			if(album != null)
				return album;
		}
		return null;
	}

	public String getSiteTitle(){
		if(StringUtils.isNotEmpty(title))
			return title;
		return friendlyName;
	}
	
	public List getAlbums() {
		return albums;
	}

	public void setAlbums(List albums) {
		this.albums = albums;
	}

	public List getCatalogs() {
		return catalogs;
	}

	public void setCatalogs(List catalogs) {
		this.catalogs = catalogs;
	}

	public List getLinks() {
		return links;
	}

	public void setLinks(List links) {
		this.links = links;
	}

	public Date getLastTime() {
		return lastTime;
	}

	public void setLastTime(Date lastTime) {
		this.lastTime = lastTime;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public String getFriendlyName() {
		return friendlyName;
	}

	public void setFriendlyName(String friendlyName) {
		this.friendlyName = friendlyName;
	}

	public String getIcpNumber() {
		return icpNumber;
	}

	public void setIcpNumber(String icpNumber) {
		this.icpNumber = icpNumber;
	}

	public UserBean getOwner() {
		return owner;
	}
	
	public void setOwner(UserBean owner) {
		this.owner = owner;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUniqueName() {
		return uniqueName;
	}

	public void setUniqueName(String uniqueName) {
		this.uniqueName = uniqueName;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public List getForums() {
		return forums;
	}

	public void setForums(List forums) {
		this.forums = forums;
	}

	public int getType() {
		return type;
	}

	public void setType(int type) {
		this.type = type;
	}

	public Date getExpiredTime() {
		return expiredTime;
	}

	public void setExpiredTime(Date expiredTime) {
		this.expiredTime = expiredTime;
	}

	public SiteStyleInfo getStyle() {
		if(style==null)
			style = new SiteStyleInfo();
		return style;
	}

	public void setStyle(SiteStyleInfo style) {
		this.style = style;
	}

	public FunctionStatus getFunctionStatus() {
		if(functionStatus==null)
			functionStatus = new FunctionStatus();
		return functionStatus;
	}

	public void setFunctionStatus(FunctionStatus functionStatus) {
		this.functionStatus = functionStatus;
	}

	public List getMusicBoxes() {
		return musicBoxes;
	}

	public void setMusicBoxes(List musicBoxes) {
		this.musicBoxes = musicBoxes;
	}

	public List getMusicsRecommend() {
		return musicsRecommend;
	}

	public void setMusicsRecommend(List musicsRecommend) {
		this.musicsRecommend = musicsRecommend;
	}

	public FunctionName getFunctionName() {
		if(functionName==null)
			functionName = new FunctionName();
		return functionName;
	}

	public void setFunctionName(FunctionName functionName) {
		this.functionName = functionName;
	}

	public List getSongs() {
		return songs;
	}
	
	public List songs(int count){
		int toIdx = Math.min(count, songs.size());
		return songs.subList(0, toIdx);
	}

	public void setSongs(List songs) {
		this.songs = songs;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public Date getLastExportTime() {
		return lastExportTime;
	}

	public void setLastExportTime(Date lastExportTime) {
		this.lastExportTime = lastExportTime;
	}
	
	public boolean isFlagSet(int iFlag){
		return (this.flag & iFlag) == iFlag;
	}

	public String getAccessCode() {
		return accessCode;
	}

	public void setAccessCode(String accessCode) {
		this.accessCode = accessCode;
	}

	public int getAccessMode() {
		return accessMode;
	}

	public void setAccessMode(int accessMode) {
		this.accessMode = accessMode;
	}

	public SpaceCapacityInfo getCapacity() {
		if(capacity==null)
			capacity = new SpaceCapacityInfo();
		return capacity;
	}

	public void setCapacity(SpaceCapacityInfo capacity) {
		this.capacity = capacity;
	}

	public TypeBean getCatalog() {
		return catalog;
	}

	public void setCatalog(TypeBean catalog) {
		this.catalog = catalog;
	}

	public String getDiary() {
		return getFunctionName().getDiary();
	}

	public void setDiary(String diary) {
		getFunctionName().setDiary(diary);
	}

	public String getGuestbook() {
		return getFunctionName().getGuestbook();
	}

	public void setGuestbook(String guestbook) {
		getFunctionName().setGuestbook(guestbook);
	}

	public String getMusic() {
		return getFunctionName().getMusic();
	}

	public void setMusic(String music) {
		getFunctionName().setMusic(music);
	}

	public String getPhoto() {
		return getFunctionName().getPhoto();
	}

	public void setPhoto(String photo) {
		getFunctionName().setPhoto(photo);
	}

	public String getForum() {
		return getFunctionName().getForum();
	}

	public void setForum(String forum) {
		getFunctionName().setForum(forum);
	}

	/**
	 * ��վ��һЩ��־
	 * 
	 * @author Winter Lau
	 */
	public static interface Flag {
		
		int ILLEGAL_GLOSSARY_IGNORE = 0x8000; //���ռǡ���᲻���������ֿ���
		int COLUMNIST = 0x4000;
		int FLAG_2 = 0x2000;
		int FLAG_3 = 0x1000;
		int FLAG_4 = 0x0800;
		int FLAG_5 = 0x0400;
		int FLAG_6 = 0x0200;
		int FLAG_7 = 0x0100;
		int FLAG_8 = 0x0080;
		int FLAG_9 = 0x0040;
		int FLAG_10 = 0x0020;
		int FLAG_11 = 0x0010;
		int FLAG_12 = 0x0008;
		int FLAG_13 = 0x0004;
		int FLAG_14 = 0x0002;
		int FLAG_15 = 0x0001;
	}

}
