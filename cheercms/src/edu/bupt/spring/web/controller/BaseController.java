package edu.bupt.spring.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import edu.bupt.spring.pager.PageParam;
import edu.bupt.spring.web.Editor.IntegerEditor;


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

	@InitBinder
    protected void initBinder(HttpServletRequest req, ServletRequestDataBinder binder) throws Exception {
    	binder.registerCustomEditor(Integer.class, "parent.id", new IntegerEditor());
    }
	
}
