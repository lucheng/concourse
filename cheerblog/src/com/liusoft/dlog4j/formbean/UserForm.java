/*
 *  UserForm.java
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
package com.liusoft.dlog4j.formbean;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;

import com.liusoft.dlog4j.DLOGSecurityManager;
import com.liusoft.dlog4j.DLOGUserManager;
import com.liusoft.dlog4j.Globals;
import com.liusoft.dlog4j.base.ContactInfo;
import com.liusoft.dlog4j.beans.SiteBean;
import com.liusoft.dlog4j.beans.UserBean;
import com.liusoft.dlog4j.dao.SiteDAO;
import com.liusoft.dlog4j.util.StringUtils;

/**
 * ע���û���
 * @author liudong
 */
public class UserForm extends FormBean {

	private String name;		//�û���¼��
	private String password;	//��¼����
	private String password2;	//����ȷ��
	private String verifyCode;	//У����
	private int keepDays;		//��¼���ϵ���Чʱ��,��λ:��
	
	private String nickname;	//�û��ǳ�
	private int sex;//�Ա�
	private Date birth;//����
	private String sbirth; //19780609
	
	private String email;		//�����ʼ�
	private String homePage;	//������վ��ַ
	private String qq;			//QQ����(NEW:3.0�汾����)
	private String msn;			//MSN�ʺ�(NEW:3.0�汾����)
	private String mobile;		//�ֻ�����(NEW:3.0�汾����)
	private String province;
	private String city;
	
	private String resume;		//��������	
	
	private FormFile portrait;
	private int removePortrait; //�Ƿ����ͷ������

	public int getKeepDays() {
		return keepDays;
	}

	public void setKeepDays(int keepDays) {
		this.keepDays = keepDays;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getMsn() {
		return msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public int getSex() {
		return sex;
	}

	public void setSex(int sex) {
		this.sex = sex;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getVerifyCode() {
		return verifyCode;
	}

	public void setVerifyCode(String verifyCode) {
		this.verifyCode = verifyCode;
	}

	public FormFile getPortrait() {
		return portrait;
	}

	public void setPortrait(FormFile portrait) {
		this.portrait = portrait;
	}

	public int getRemovePortrait() {
		return removePortrait;
	}

	public void setRemovePortrait(int removePortrait) {
		this.removePortrait = removePortrait;
	}

	public String getSbirth() {
		return sbirth;
	}

	public void setSbirth(String sbirth) {
		this.sbirth = sbirth;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	/**
	 * ��formת��Ϊbean
	 * 
	 * @param request
	 * @param user
	 * @return
	 */
	public UserBean formToBean() {
		UserBean ubean = new UserBean();
		// ��ֵ
		ubean.setName(getName().trim());
		ubean.setNickname(super.autoFiltrate(getNickname().trim()));
		ubean.setBirth(getBirth());
		ubean.setKeepDays(getKeepDays());
		//ubean.setLastAddr(request.getRemoteAddr());
		ubean.setPassword(getPassword());	
		if (StringUtils.isNotEmpty(getResume()))
			ubean.setResume(super.autoFiltrate(getResume()));

		ContactInfo ci = new ContactInfo();
		if (StringUtils.isNotEmpty(getEmail()) && StringUtils.isEmail(getEmail()))
			ci.setEmail(getEmail());
		if (StringUtils.isNotEmpty(getHomePage()))
			ci.setHomePage(getHomePage());
		if (StringUtils.isNotEmpty(getMobile()))
			ci.setMobile(getMobile());
		if (StringUtils.isNotEmpty(getMsn()))
			ci.setMsn(getMsn());
		if (StringUtils.isNotEmpty(getQq()))
			ci.setQq(getQq());
		if (StringUtils.isNotEmpty(getProvince()))
			ci.setProvince(getProvince());
		if (StringUtils.isNotEmpty(getCity()))
			ci.setCity(getCity());
		//ci.setMobile(RequestUtils.getRequestMobile(request));
		ubean.setContactInfo(ci);

		ubean.setSex(getSex());

		SiteBean site = null;
		// ���վ���Ƿ���Ч
		if (getSid() > 0)
			site = SiteDAO.getSiteByID(getSid());
		ubean.setSite(site);

		return ubean;
	}

	/**
	 * ��֤�û�ע���
	 * 
	 * @param request
	 * @param msgs
	 * @param user
	 */
	public void validateUserForm(HttpServletRequest request,
			ActionMessages msgs, boolean reg) {
		if (reg && StringUtils.isEmpty(getName()))
			msgs.add("name", new ActionMessage("error.username_empty"));
		else if (reg && !StringUtils.isLegalUsername(getName()))
			msgs.add("name", new ActionMessage("error.illegal_username"));
		else if (StringUtils.isEmpty(getNickname()))
			msgs.add("nickname", new ActionMessage("error.nickname_empty"));
		else if (StringUtils.isEmpty(getPassword()))
			msgs.add("password", new ActionMessage("error.password_empty"));
		// ��֤�û��������ϵ��Ϣ����Ч��
		else if (StringUtils.isNotEmpty(getEmail())
				&& !StringUtils.isEmail(getEmail()))
			msgs.add("email", new ActionMessage("error.email_format"));
		else if (StringUtils.isNotEmpty(getQq())
				&& !StringUtils.isNumeric(getQq()))
			msgs.add("qq", new ActionMessage("error.qq_format"));
		else if (StringUtils.isNotEmpty(getMsn())
				&& !StringUtils.isEmail(getMsn()))
			msgs.add("msn", new ActionMessage("error.msn_format"));
		else if (StringUtils.isNotEmpty(getMobile())
				&& !StringUtils.isNumeric(getMobile()))
			msgs.add("mobile", new ActionMessage("error.mobile_format"));
		// У��ע����֤��
		else if (reg
				&& !StringUtils.equals(getVerifyCode(),
						getVerifyCode(request)))
			msgs.add("verifyCode", new ActionMessage("error.verified_failed"));
		else if (DLOGSecurityManager.IllegalGlossary.existIllegalWord(getNickname()))
			msgs.add("nickname", new ActionMessage("error.illegal_glossary"));
		// �ʺŲ������ظ�
		else if (reg && DLOGUserManager.getUserByName(getName().trim()) != null)
			msgs.add("name", new ActionMessage("error.username_exists", getName()));
		// �û��ǳ�Ҳ�������ظ�
		else if (reg && DLOGUserManager.getUserByNickname(getNickname().trim()) != null)
			msgs.add("nickname", new ActionMessage("error.nickname_exists", getNickname()));
	}

	/**
	 * ������֤��
	 * 
	 * @param req
	 * @return
	 */
	protected String getVerifyCode(HttpServletRequest req) {
		HttpSession ssn = req.getSession(false);
		if (ssn != null)
			return (String) ssn.getAttribute(Globals.RANDOM_LOGIN_KEY);
		return null;
	}

}
