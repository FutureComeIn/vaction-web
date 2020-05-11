package com.yxw.bean;
/**
 * 6.商品表(编号,名称,产地,价格,已成交量，购买可得积分数，商品主图,商品详情图,类别)
 * @author Administrator
 *
 */
public class Goods {
	private int gno;
	private String gname;
	private String gplace;
	private double gprice;
	private int gdealcount;
	private int gpoint;
	private String gheadphotopath;
	private String gdetailphotopath;
	private String gtype;
	
	public Goods() {
		super();
	}

	public Goods(int gno, String gname, String gheadphotopath,
			String gdetailphotopath, String gplace, double gprice,
			int gdealcount, int gpoint,String gtype) {
		super();
		this.gno = gno;
		this.gname = gname;
		this.gheadphotopath = gheadphotopath;
		this.gdetailphotopath = gdetailphotopath;
		this.gplace = gplace;
		this.gprice = gprice;
		this.gdealcount = gdealcount;
		this.gpoint = gpoint;
		this.gtype=gtype;
	}

	public int getGno() {
		return gno;
	}

	public void setGno(int gno) {
		this.gno = gno;
	}

	public String getGname() {
		return gname;
	}

	public void setGname(String gname) {
		this.gname = gname;
	}

	public String getGheadphotopath() {
		return gheadphotopath;
	}

	public void setGheadphotopath(String gheadphotopath) {
		this.gheadphotopath = gheadphotopath;
	}

	public String getGdetailphotopath() {
		return gdetailphotopath;
	}

	public void setGdetailphotopath(String gdetailphotopath) {
		this.gdetailphotopath = gdetailphotopath;
	}

	public String getGplace() {
		return gplace;
	}

	public void setGplace(String gplace) {
		this.gplace = gplace;
	}

	public double getGprice() {
		return gprice;
	}

	public void setGprice(double gprice) {
		this.gprice = gprice;
	}

	public int getGdealcount() {
		return gdealcount;
	}

	public void setGdealcount(int gdealcount) {
		this.gdealcount = gdealcount;
	}

	public int getGpoint() {
		return gpoint;
	}

	public void setGpoint(int gpoint) {
		this.gpoint = gpoint;
	}
	
	public String getGtype() {
		return gtype;
	}

	public void setGtype(String gtype) {
		this.gtype = gtype;
	}

	@Override
	public String toString() {
		return "Goods [gdealcount=" + gdealcount + ", gdetailphotopath="
				+ gdetailphotopath + ", gheadphotopath=" + gheadphotopath
				+ ", gname=" + gname + ", gno=" + gno + ", gplace=" + gplace
				+ ", gpoint=" + gpoint + ", gprice=" + gprice + "]";
	}
	
	
}
