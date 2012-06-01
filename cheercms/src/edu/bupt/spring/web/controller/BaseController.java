package edu.bupt.spring.web.controller;

import org.springframework.stereotype.Controller;

import edu.bupt.spring.pager.PageParam;


@Controller
public class BaseController {
	
	protected Integer[] ids;
	/*protected StringBuffer jpql = new StringBuffer("");
	protected List<Object> queryParams = new ArrayList<Object>();
	protected LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();*/
	
	protected PageParam pageparam;
	
	public Integer[] getIds() {
		return ids;
	}

	public void setIds(Integer[] ids) {
		this.ids = ids;
	}

	/*public StringBuffer getJpql() {
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
	}*/

	
}
