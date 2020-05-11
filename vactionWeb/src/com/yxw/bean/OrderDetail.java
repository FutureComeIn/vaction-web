package com.yxw.bean;
/**
 * 9.订单明细表(编号，订单编号，物品编号，数量，单价，支付金额，支付方式，收货地址编号，支付状态)
 * @author Administrator
 *
 */
public class OrderDetail {
	private int odno;
	private int odgono;
	private int odgno;
	private int odcount;
	private double odprice;
	private double odpayprice;
	private String odpaymethod;
	private int odcno;
	private String odtype;
	
	public OrderDetail() {
		super();
	}

	public OrderDetail(int odno, int odgono, int odgno, int odcount,
			double odprice, double odpayprice, String odpaymethod, int odcno,String odtype) {
		super();
		this.odno = odno;
		this.odgono = odgono;
		this.odgno = odgno;
		this.odcount = odcount;
		this.odprice = odprice;
		this.odpayprice = odpayprice;
		this.odpaymethod = odpaymethod;
		this.odcno = odcno;
		this.odtype=odtype;
	}

	public int getOdno() {
		return odno;
	}

	public void setOdno(int odno) {
		this.odno = odno;
	}

	public int getOdgono() {
		return odgono;
	}

	public void setOdgono(int odgono) {
		this.odgono = odgono;
	}

	public int getOdgno() {
		return odgno;
	}

	public void setOdgno(int odgno) {
		this.odgno = odgno;
	}

	public int getOdcount() {
		return odcount;
	}

	public void setOdcount(int odcount) {
		this.odcount = odcount;
	}

	public double getOdprice() {
		return odprice;
	}

	public void setOdprice(double odprice) {
		this.odprice = odprice;
	}

	public double getOdpayprice() {
		return odpayprice;
	}

	public void setOdpayprice(double odpayprice) {
		this.odpayprice = odpayprice;
	}

	public String getOdpaymethod() {
		return odpaymethod;
	}

	public void setOdpaymethod(String odpaymethod) {
		this.odpaymethod = odpaymethod;
	}

	public int getOdcno() {
		return odcno;
	}

	public void setOdcno(int odcno) {
		this.odcno = odcno;
	}
	public String getOdtype() {
		return odtype;
	}

	public void setOdtype(String odtype) {
		this.odtype = odtype;
	}

	@Override
	public String toString() {
		return "OrderDetail [odcno=" + odcno + ", odcount=" + odcount
				+ ", odgno=" + odgno + ", odgono=" + odgono + ", odno=" + odno
				+ ", odpaymethod=" + odpaymethod + ", odpayprice=" + odpayprice
				+ ", odprice=" + odprice + "]";
	}
	
	

}
