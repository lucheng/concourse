/*
 * ��Ȩ����: Ħ����Ϣ�Ƽ����޹�˾ 2005
 * ��Ŀ��DLOG4J_V3
 * ���ڰ���com.liusoft.dlog4j.beans
 * �ļ�����FunctionName.java
 * ����ʱ�䣺2005-12-9
 * �����ߣ�Winter Lau
 */
package com.liusoft.dlog4j.base;

import java.io.Serializable;

/**
 * ��վ�Զ��幦����
 * @author Winter Lau
 */
public class FunctionName implements Serializable {
	
	protected String diary;
	protected String photo;
	protected String music;
	protected String forum;
	protected String guestbook;
	
	public String getDiary() {
		return diary;
	}
	public void setDiary(String diary) {
		this.diary = diary;
	}
	public String getGuestbook() {
		return guestbook;
	}
	public void setGuestbook(String guestbook) {
		this.guestbook = guestbook;
	}
	public String getMusic() {
		return music;
	}
	public void setMusic(String music) {
		this.music = music;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getForum() {
		return forum;
	}
	public void setForum(String forum) {
		this.forum = forum;
	}

}
