package com.yxw.view;

public class ScenicOrderPay {
	//景区订单
	private int sono;
	private int sosno;
	private int socount;
	private double soprice;
	private String sodate;
	//景区
	private String sname;
	private String sheadpath;
	//支付
	private double ppaymoney;
	private String ptype;

	public ScenicOrderPay() {
		super();
	}


	public ScenicOrderPay(int sono, int sosno, int socount, double soprice,
			String sodate, String sname, String sheadpath, double ppaymoney,
			String ptype) {
		super();
		this.sono = sono;
		this.sosno = sosno;
		this.socount = socount;
		this.soprice = soprice;
		this.sodate = sodate;
		this.sname = sname;
		this.sheadpath = sheadpath;
		this.ppaymoney = ppaymoney;
		this.ptype = ptype;
	}


	public int getSosno() {
		return sosno;
	}


	public void setSosno(int sosno) {
		this.sosno = sosno;
	}


	public double getPpaymoney() {
		return ppaymoney;
	}

	public void setPpaymoney(double ppaymoney) {
		this.ppaymoney = ppaymoney;
	}

	public int getSono() {
		return sono;
	}

	public void setSono(int sono) {
		this.sono = sono;
	}

	public int getSocount() {
		return socount;
	}

	public void setSocount(int socount) {
		this.socount = socount;
	}

	public double getSoprice() {
		return soprice;
	}

	public void setSoprice(double soprice) {
		this.soprice = soprice;
	}

	public String getSodate() {
		return sodate;
	}

	public void setSodate(String sodate) {
		this.sodate = sodate;
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

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}


	@Override
	public String toString() {
		return "ScenicOrderPay [ppaymoney=" + ppaymoney + ", ptype=" + ptype
				+ ", sheadpath=" + sheadpath + ", sname=" + sname
				+ ", socount=" + socount + ", sodate=" + sodate + ", sono="
				+ sono + ", soprice=" + soprice + ", sosno=" + sosno + "]";
	}
	}
