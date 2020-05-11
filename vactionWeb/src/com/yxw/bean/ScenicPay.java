package com.yxw.bean;
/**
 * 15.支付表(编号，景区订单编号，支付金额,支付方式,支付状态)
 * @author Administrator
 *
 */
public class ScenicPay {
	private int pno;
	private int psosono;
	private double ppaymoney;
	private String ppaymethod;
	private String ptype;
	
	public ScenicPay() {
		super();
	}

	public ScenicPay(int pno, int psosono, double ppaymoney, String ppaymethod,
			String ptype) {
		super();
		this.pno = pno;
		this.psosono = psosono;
		this.ppaymoney = ppaymoney;
		this.ppaymethod = ppaymethod;
		this.ptype = ptype;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public int getPsosono() {
		return psosono;
	}

	public void setPsosono(int psosono) {
		this.psosono = psosono;
	}

	public double getPpaymoney() {
		return ppaymoney;
	}

	public void setPpaymoney(double ppaymoney) {
		this.ppaymoney = ppaymoney;
	}

	public String getPpaymethod() {
		return ppaymethod;
	}

	public void setPpaymethod(String ppaymethod) {
		this.ppaymethod = ppaymethod;
	}

	public String getPtype() {
		return ptype;
	}

	public void setPtype(String ptype) {
		this.ptype = ptype;
	}

	@Override
	public String toString() {
		return "ScenicPay [pno=" + pno + ", ppaymethod=" + ppaymethod
				+ ", ppaymoney=" + ppaymoney + ", psosono=" + psosono
				+ ", ptype=" + ptype + "]";
	}
	
}
