package edu.bupt.spring.web.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;


@Controller
public class BaseController {
	
	protected Integer[] ids;
	protected StringBuffer jpql = new StringBuffer("");
	protected List<Object> queryParams = new ArrayList<Object>();
	protected Integer pageNumber = new Integer(1);
	protected LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
	
	protected int pageSize = 10;
	protected String searchBy = "";
	protected String keyword;
	
	public void fromPager(HttpServletRequest request){
		
		String pageNumber = (String)request.getParameter("pageNumber");
		String pageSize = (String)request.getParameter("pageSize");
		
		String orderBy = (String)request.getParameter("orderBy");
		String order = (String)request.getParameter("order");
		
		if(pageNumber != null){
			this.pageNumber = Integer.parseInt(pageNumber);
		}
		
		if(pageSize != null){
			this.pageSize = Integer.parseInt(pageSize);
		}
		
		System.out.println("orderBy:" + orderBy);
		System.out.println("order:" + order);
		
		if(orderBy != null && order != null){
			orderby.clear();
			orderby.put(orderBy, order);
		}
		
		request.setAttribute("pageNumber", this.pageNumber);
		request.setAttribute("pageSize", this.pageSize);
		
	}
	
	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public String getKeyword() {
		return keyword;
	}


	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public int getPage() {
		
		if(this.pageNumber == null || this.pageNumber <= 1){
			this.pageNumber = 1;
		}
		return this.pageNumber;
	}

	public void setPage(Integer page) {

		if(this.pageNumber == null || this.pageNumber <= 1){
			this.pageNumber = 1;
		} else {
			this.pageNumber = page;
		}
	}

	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}

	public StringBuffer getJpql() {
		return jpql;
	}

	public List<Object> getQueryParams() {
		return queryParams;
	}

	public void setQueryParams(List<Object> queryParams) {
		this.queryParams = queryParams;
	}

	public LinkedHashMap<String, String> getOrderby() {
		return orderby;
	}

	public void setOrderby(LinkedHashMap<String, String> orderby) {
		this.orderby = orderby;
	}

	public void setJpql(StringBuffer jpql) {
		this.jpql = jpql;
	}

	
}
