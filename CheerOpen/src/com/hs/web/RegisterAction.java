package com.hs.web;

import org.apache.struts2.ServletActionContext;

import com.hs.po.UserInfo;
import com.hs.service.IUserInfoService;
import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
	
	private IUserInfoService userinfoService;
	

	public void setUserinfoService(IUserInfoService userinfoService) {
		this.userinfoService = userinfoService;
	}
	
	private String name;
	private int age;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	@Override
	public String execute() throws Exception {
		System.out.println("����ҵ�������û���ע��");
		System.out.println("name " + name + "\n age " + age);
		
		ServletActionContext.getRequest().setAttribute("name" , name);
		UserInfo userInfo = new UserInfo(name, age);
		userinfoService.addUser(userInfo);
		return super.execute();
	}

}