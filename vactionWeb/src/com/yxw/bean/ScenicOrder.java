package com.yxw.bean;
/**
 * 14.景区门票订单表(编号，买家编号，景区编号，数量，单价,联系人姓名，联系人手机,预定时间)
 * @author Administrator
 *
 */
public class ScenicOrder {
	private int sono;
	private int souno;
	private int sosno;
	private int socount;
	private double soprice;
	private String socontactname;
	private String socontactmobile;
	private String sodate;
	
	public ScenicOrder() {
		super();
	}

	public ScenicOrder(int sono, int souno, int sosno, int socount,
			double soprice, String socontactname, String socontactmobile,
			String sodate) {
		super();
		this.sono = sono;
		this.souno = souno;
		this.sosno = sosno;
		this.socount = socount;
		this.soprice = soprice;
		this.socontactname = socontactname;
		this.socontactmobile = socontactmobile;
		this.sodate = sodate;
	}

	public int getSono() {
		return sono;
	}

	public void setSono(int sono) {
		this.sono = sono;
	}

	public int getSouno() {
		return souno;
	}

	public void setSouno(int souno) {
		this.souno = souno;
	}

	public int getSosno() {
		return sosno;
	}

	public void setSosno(int sosno) {
		this.sosno = sosno;
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

	public String getSocontactname() {
		return socontactname;
	}

	public void setSocontactname(String socontactname) {
		this.socontactname = socontactname;
	}

	public String getSocontactmobile() {
		return socontactmobile;
	}

	public void setSocontactmobile(String socontactmobile) {
		this.socontactmobile = socontactmobile;
	}

	public String getSodate() {
		return sodate;
	}

	public void setSodate(String sodate) {
		this.sodate = sodate;
	}

	@Override
	public String toString() {
		return "ScenicOrder [socontactmobile=" + socontactmobile
				+ ", socontactname=" + socontactname + ", socount=" + socount
				+ ", sodate=" + sodate + ", sono=" + sono + ", soprice="
				+ soprice + ", sosno=" + sosno + ", souno=" + souno + "]";
	}
	

}
