package edu.bupt.spring.web.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Controller;

import edu.bupt.spring.pager.PageParam;


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
