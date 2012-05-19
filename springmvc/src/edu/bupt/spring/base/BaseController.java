package edu.bupt.spring.base;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.stereotype.Controller;


@Controller
public class BaseController {
	
	protected Integer[] ids;
	protected StringBuffer jpql = new StringBuffer("");
	protected List<Object> params = new ArrayList<Object>();
	protected Integer page = new Integer(1);
	protected LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
	
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

	public void setJpql(StringBuffer jpql) {
		this.jpql = jpql;
	}

	public List<Object> getParams() {
		return params;
	}

	public void setParams(List<Object> params) {
		this.params = params;
	}
	
}
