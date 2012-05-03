package com.hs.web;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.hs.po.UserInfo;
import com.hs.service.IUserInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class ShowUsersAction extends ActionSupport{
	
	private IUserInfoService userinfoService;
	

	public void setUserinfoService(IUserInfoService userinfoService) {
		this.userinfoService = userinfoService;
	}


	@Override
	public String execute() throws Exception {
		List<UserInfo> list = userinfoService.searchUser();
		ServletActionContext.getRequest().setAttribute("list", list);
		return super.execute();
	}
}
