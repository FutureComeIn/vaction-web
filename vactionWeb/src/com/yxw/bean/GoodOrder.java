package com.yxw.bean;

/**
 * 8.商品订单表(编号，买家编号，总价，购买日期)
 * @author Administrator
 *
 */
public class GoodOrder {
	private int gono;
	private int gouno;
	private double goprice;
	private String godate;
	
	public GoodOrder() {
		super();
	}

	public GoodOrder(int gono, int gouno, double goprice, String godate) {
		super();
		this.gono = gono;
		this.gouno = gouno;
		this.goprice = goprice;
		this.godate = godate;
	}

	public int getGono() {
		return gono;
	}

	public void setGono(int gono) {
		this.gono = gono;
	}

	public int getGouno() {
		return gouno;
	}

	public void setGouno(int gouno) {
		this.gouno = gouno;
	}

	public double getGoprice() {
		return goprice;
	}

	public void setGoprice(double goprice) {
		this.goprice = goprice;
	}

	public String getGodate() {
		return godate;
	}

	public void setGodate(String godate) {
		this.godate = godate;
	}

	@Override
	public String toString() {
		return "GoodOrder [godate=" + godate + ", gono=" + gono + ", goprice="
				+ goprice + ", gouno=" + gouno + "]";
	}
	
	
	
}
