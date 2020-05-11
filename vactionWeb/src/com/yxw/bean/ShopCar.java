package com.yxw.bean;
/**
 * 10.购物车表(编号，买家编号，物品编号，数量，总价) --物品编号：商品表编号
 * @author Administrator
 *
 */
public class ShopCar {
	private int sno;
	private int suno;
	private int sgno;
	private int scount;
	private double sprice;
	
	public ShopCar() {
		super();
	}

	public ShopCar(int sno, int suno, int sgno, int scount, double sprice) {
		super();
		this.sno = sno;
		this.suno = suno;
		this.sgno = sgno;
		this.scount = scount;
		this.sprice = sprice;
	}

	public int getSno() {
		return sno;
	}

	public void setSno(int sno) {
		this.sno = sno;
	}

	public int getSuno() {
		return suno;
	}

	public void setSuno(int suno) {
		this.suno = suno;
	}

	public int getSgno() {
		return sgno;
	}

	public void setSgno(int sgno) {
		this.sgno = sgno;
	}

	public int getScount() {
		return scount;
	}

	public void setScount(int scount) {
		this.scount = scount;
	}

	public double getSprice() {
		return sprice;
	}

	public void setSprice(double sprice) {
		this.sprice = sprice;
	}

	@Override
	public String toString() {
		return "ShopCar [scount=" + scount + ", sgno=" + sgno + ", sno=" + sno
				+ ", sprice=" + sprice + ", suno=" + suno + "]";
	}
	

}
