package com.yxw.bean;
/**
 * 11.景区表(编号，名称，景区头像，背景图片，文字介绍，咨询电话，开放时间，详细地址，价格)
 * @author Administrator
 *
 */
public class Scenic {
	private int sno;
	private String sname;
	private String sheadpath;
	private String sbgpath;
	private String scontent;
	private String smobile;
	private String sopendate;
	private String saddress;
	private double sprice;

	
	public Scenic() {
		super();
	}
	
	public Scenic(int sno, String sname, String sheadpath, String sbgpath,
			String scontent, String smobile, String sopendate, String saddress,
			double sprice) {
		super();
		this.sno = sno;
		this.sname = sname;
		this.sheadpath = sheadpath;
		this.sbgpath = sbgpath;
		this.scontent = scontent;
		this.smobile = smobile;
		this.sopendate = sopendate;
		this.saddress = saddress;
		this.sprice = sprice;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getSheadpath() {
		return sheadpath;
	}

	public void setSheadpath(String sheadpath) {
		this.sheadpath = sheadpath;
	}

	public String getSbgpath() {
		return sbgpath;
	}

	public void setSbgpath(String sbgpath) {
		this.sbgpath = sbgpath;
	}

	public String getScontent() {
		return scontent;
	}

	public void setScontent(String scontent) {
		this.scontent = scontent;
	}

	public String getSmobile() {
		return smobile;
	}

	public void setSmobile(String smobile) {
		this.smobile = smobile;
	}

	public String getSopendate() {
		return sopendate;
	}

	public void setSopendate(String sopendate) {
		this.sopendate = sopendate;
	}

	public String getSaddress() {
		return saddress;
	}

	public void setSaddress(String saddress) {
		this.saddress = saddress;
	}

	public double getSprice() {
		return sprice;
	}

	public void setSprice(double sprice) {
		this.sprice = sprice;
	}

	@Override
	public String toString() {
		return "Scenic [saddress=" + saddress + ", sbgpath=" + sbgpath
				+ ", scontent=" + scontent + ", sheadpath=" + sheadpath
				+ ", smobile=" + smobile + ", sname=" + sname + ", sno=" + sno
				+ ", sopendate=" + sopendate + ", sprice=" + sprice + "]";
	}
	
}
