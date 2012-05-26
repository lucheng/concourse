package edu.bupt.spring.base;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Controller;


@Controller
public class BaseController {
	
	protected Integer[] ids;
	protected StringBuffer jpql = new StringBuffer("");
	protected List<Object> queryParams = new ArrayList<Object>();
	protected Integer page = new Integer(1);
	protected LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
	
	protected SearchParam searchParam = new SearchParam();
	
	public SearchParam getSearchParam() {
		return searchParam;
	}

	public void setSearchParam(SearchParam searchParam) {
		this.searchParam = searchParam;
	}

	public class SearchParam {
		
		public SearchParam(){
			this.pageSize = 10;
			this.searchBy = "";
			this.keyword = "";
		}
		
		private int pageSize;
		private String searchBy;
		private String keyword;
		
		public int getPageSize() {
			return pageSize;
		}
		public void setPageSize(int pageSize) {
			this.pageSize = pageSize;
		}
		public String getSearchBy() {
			return searchBy;
		}
		public void setSearchBy(String searchBy) {
			this.searchBy = searchBy;
		}
		public String getKeyword() {
			return keyword;
		}
		public void setKeyword(String keyword) {
			this.keyword = keyword;
		}
		
	}
	
	public int getPage() {
		
		if(this.page == null || this.page <= 1){
			this.page = 1;
		}
		return this.page;
	}

	public void setPage(Integer page) {

		if(this.page == null || this.page <= 1){
			this.page = 1;
		} else {
			this.page = page;
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
