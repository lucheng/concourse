package com.zly.test.action;

import java.util.List;

import com.zly.indexManager.IndexSearchUtil;
import com.zly.test.entity.PageControl;
import com.zly.test.entity.SearchResultBean;

public class SearchAction extends BaseAction {

	
	private static final long serialVersionUID = -2387037924517370511L;
	//查询索引实体类
	private IndexSearchUtil indexSearcher;
	//对应搜索字段是标题还是内容
	private String searchWhich;
	//对应用户输入的搜索内容
	private String searchParam;
	//对应分页跳转到的页面
	private String jumpPage;
	
	public String getJumpPage() {
		return jumpPage;
	}

	public void setJumpPage(String jumpPage) {
		this.jumpPage = jumpPage;
	}

	public String getSearchWhich() {
		return searchWhich;
	}

	public void setSearchWhich(String searchWhich) {
		this.searchWhich = searchWhich;
	}

	public String getSearchParam() {
		return searchParam;
	}

	public void setSearchParam(String searchParam) {
		this.searchParam = searchParam;
	}

	public String search() throws Exception {
		//如果为空，说明第一次进入分页
		if(jumpPage == null) {
			jumpPage = "1";
		}
		//从request范围内取得pageControl对象
		PageControl pageControl  = (PageControl) this.getRequest().getAttribute("pageControl");
		//如果为空，则是第一次分页，创建分页对象，并且设置总的记录条数，以便设置最大页数 
		if(pageControl == null) {
			pageControl = new PageControl();
			pageControl.setMaxRowCount((long)indexSearcher.getResultCount(searchWhich, searchParam));
			pageControl.countMaxPage();
		}
		//设置当前页
		pageControl.setCurPage(Integer.parseInt(jumpPage));
		//计算firstResult
		int firstResult = (pageControl.getCurPage() - 1) * pageControl.getRowsPerPage() + 1;
		//计算从当前条数算还有多少条记录
		long left = pageControl.getMaxRowCount() - firstResult;
		int maxResult = -1;
		//如果剩余的记录数不如每页显示数，就设置maxResult为剩余条数
		if(left < pageControl.getRowsPerPage()) {
			maxResult = Integer.valueOf(left + "");
		//如果剩余记录数大于每页显示页数，就设置maxResult为每页条数
		}else {
			maxResult = pageControl.getRowsPerPage(); 
		}
		//取得查询结果集
		List<SearchResultBean> userList = indexSearcher.getSearchResult(searchWhich, searchParam, firstResult, maxResult);
		//设置为pageControl
		pageControl.setData(userList);
		//将pageControl设置到request范围，以便在jsp现实结果
		this.getRequest().setAttribute("pageControl", pageControl);
		//将searchWhich和searchParam设置到request范围，以便添加到分页jsp的form里面的hidden表单域，以便下次分页时，能够将值提交过来
		this.getRequest().setAttribute("searchWhich", searchWhich);
		this.getRequest().setAttribute("searchParam", searchParam);
		//跳转到分页视图
		return SUCCESS;
		
	}

	public IndexSearchUtil getIndexSearcher() {
		return indexSearcher;
	}

	public void setIndexSearcher(IndexSearchUtil indexSearcher) {
		this.indexSearcher = indexSearcher;
	}
	
}
