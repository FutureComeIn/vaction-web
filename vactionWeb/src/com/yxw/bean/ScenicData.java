package com.yxw.bean;

import java.util.List;

public class ScenicData {
	private int pageNum;
	private List<Scenic> slist;
	
	
	public ScenicData() {
		super();
	}
	public ScenicData(int pageNum, List<Scenic> slist) {
		super();
		this.pageNum = pageNum;
		this.slist = slist;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	public List<Scenic> getSlist() {
		return slist;
	}
	public void setSlist(List<Scenic> slist) {
		this.slist = slist;
	}
	@Override
	public String toString() {
		return "ScenicData [pageNum=" + pageNum + ", slist=" + slist + "]";
	}
	
	
}
