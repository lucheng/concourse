package edu.bupt.spring.web.controller;

import org.springframework.stereotype.Controller;


@Controller
public class BaseController {
	
	protected Integer page = new Integer(1);
	protected Integer[] ids;
	
	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}

}
