package edu.bupt.spring.pager;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class PageParam {
	
	protected StringBuffer jpql = new StringBuffer("");
	protected List<Object> queryParams = new ArrayList<Object>();
	protected LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
	
	protected Integer pageNumber = new Integer(1);
	protected int pageSize = 10;
	protected String orderBy = "createDate";
	protected String order = "asc";
	
	protected String searchBy = "";
	protected String keyword = "";
	
	public PageParam(HttpServletRequest request){
		
		String searchBy = (String)request.getParameter("searchBy");
		String keyword = (String)request.getParameter("keyword");
		
		String pageNumber = (String)request.getParameter("pageNumber");
		String pageSize = (String)request.getParameter("pageSize");
		
		String orderBy = (String)request.getParameter("orderBy");
		String order = (String)request.getParameter("order");
		
		if(searchBy != null){
			this.searchBy = searchBy;
		}
		
		if(keyword != null){
			this.keyword = keyword;
		}
		
		if(pageNumber != null){
			this.pageNumber = Integer.parseInt(pageNumber);
		}
		
		if(pageSize != null){
			this.pageSize = Integer.parseInt(pageSize);
		}
		
		System.out.println("orderBy:" + orderBy);
		System.out.println("order:" + order);
		
		if(orderBy != null){
			this.orderBy = orderBy;
		}
		
		if(order != null){
			this.order = order;
		}
		
		orderby.put(this.orderBy, this.order);
	}
	
	public String getOrderBy() {
		return orderBy;
	}

	public void setOrderBy(String orderBy) {
		this.orderBy = orderBy;
	}

	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	public String getSearchBy() {
		return searchBy;
	}

	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}

	public StringBuffer getJpql() {
		return jpql;
	}

	public void setJpql(StringBuffer jpql) {
		this.jpql = jpql;
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
	
	public int getPageNumber() {
		
		if(this.pageNumber == null || this.pageNumber <= 1){
			this.pageNumber = 1;
		}
		return this.pageNumber;
	}

	public void setPageNumber(Integer page) {

		if(this.pageNumber == null || this.pageNumber <= 1){
			this.pageNumber = 1;
		} else {
			this.pageNumber = page;
		}
	}

}
