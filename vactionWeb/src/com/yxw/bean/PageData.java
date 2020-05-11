package com.yxw.bean;

import java.util.List;



public class PageData {
	 private List<TravelNote> data;
	 private  int totalPage;
	 public static final int pagesize=4;
	public List<TravelNote> getData() {
		return data;
	}
	public void setData(List<TravelNote> data) {
		this.data = data;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public static int getPagesize() {
		return pagesize;
	}
	 
	 
}
