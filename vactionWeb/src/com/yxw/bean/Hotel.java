package com.yxw.bean;
/**
 * 13.酒店表(编号，名称，酒店头像,文字介绍，价格，地址,周边景区编号，与景区的距离)
 * @author Administrator
 *
 */
public class Hotel {
	private int hno;
	private String hname;
	private String hheadpath;
	private String hcontent;
	private double hprice;
	private String haddress;
	private int hsno;
	private double hdistance;
	
	public Hotel() {
		super();
	}

	public Hotel(int hno, String hname, String hheadpath, String hcontent,
			double hprice, String haddress, int hsno, double hdistance) {
		super();
		this.hno = hno;
		this.hname = hname;
		this.hheadpath = hheadpath;
		this.hcontent = hcontent;
		this.hprice = hprice;
		this.haddress = haddress;
		this.hsno = hsno;
		this.hdistance = hdistance;
	}

	public int getHno() {
		return hno;
	}

	public void setHno(int hno) {
		this.hno = hno;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHheadpath() {
		return hheadpath;
	}

	public void setHheadpath(String hheadpath) {
		this.hheadpath = hheadpath;
	}

	public String getHcontent() {
		return hcontent;
	}

	public void setHcontent(String hcontent) {
		this.hcontent = hcontent;
	}

	public double getHprice() {
		return hprice;
	}

	public void setHprice(double hprice) {
		this.hprice = hprice;
	}

	public String getHaddress() {
		return haddress;
	}

	public void setHaddress(String haddress) {
		this.haddress = haddress;
	}

	public int getHsno() {
		return hsno;
	}

	public void setHsno(int hsno) {
		this.hsno = hsno;
	}

	public double getHdistance() {
		return hdistance;
	}

	public void setHdistance(double hdistance) {
		this.hdistance = hdistance;
	}

	@Override
	public String toString() {
		return "Hotel [haddress=" + haddress + ", hcontent=" + hcontent
				+ ", hdistance=" + hdistance + ", hheadpath=" + hheadpath
				+ ", hname=" + hname + ", hno=" + hno + ", hprice=" + hprice
				+ ", hsno=" + hsno + "]";
	}
	

}
