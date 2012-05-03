package com.zly.test.entity;

import java.util.List;




public class PageControl {
	
	private int curPage ; //当前是第几页 
	
	private int maxPage ; //一共有多少页 
	
	private Long maxRowCount ; //一共有多少行 
	
	private int rowsPerPage = 8 ; //每页有多少行 

	private List<?> data;//每页的User
	
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public List<?> getData() {
		return data;
	}

	public void setData(List<?> data) {
		this.data = data;
	}

	public Long getMaxRowCount() {
		return maxRowCount;
	}

	public void setMaxRowCount(Long amaxRowCountxRowCount) {
		this.maxRowCount = amaxRowCountxRowCount;
	}

	public int getRowsPerPage() {
		return rowsPerPage;
	}

	public void setRowsPerPage(int rowsPerPage) {
		this.rowsPerPage = rowsPerPage;
	}
	
	public void countMaxPage() {   //根据总行数计算总页数  
	    if (this.maxRowCount % this.rowsPerPage ==0){
	       this.maxPage = (int) (this.maxRowCount/this.rowsPerPage);
	    }else{
	       this.maxPage = (int) (this.maxRowCount/this.rowsPerPage + 1);        
	    }
	}
	
}
