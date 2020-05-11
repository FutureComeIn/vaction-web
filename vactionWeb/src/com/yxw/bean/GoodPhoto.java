package com.yxw.bean;
/**
 * 7.…Ã∆∑Õº∆¨±Ì(±‡∫≈£¨…Ã∆∑±‡∫≈,Õº∆¨1£¨Õº∆¨2£¨Õº∆¨3,Õº∆¨4,Õº∆¨5)
 * @author Administrator
 *
 */

public class GoodPhoto {
	private int gpno;
	private int gpgno;
	private String gppath1;
	private String gppath2;
	private String gppath3;
	private String gppath4;
	private String gppath5;
	
	public GoodPhoto() {
		super();
	}

	public GoodPhoto(int gpno, int gpgno, String gppath1, String gppath2,
			String gppath3, String gppath4, String gppath5) {
		super();
		this.gpno = gpno;
		this.gpgno = gpgno;
		this.gppath1 = gppath1;
		this.gppath2 = gppath2;
		this.gppath3 = gppath3;
		this.gppath4 = gppath4;
		this.gppath5 = gppath5;
	}

	public int getGpno() {
		return gpno;
	}

	public void setGpno(int gpno) {
		this.gpno = gpno;
	}

	public int getGpgno() {
		return gpgno;
	}

	public void setGpgno(int gpgno) {
		this.gpgno = gpgno;
	}

	public String getGppath1() {
		return gppath1;
	}

	public void setGppath1(String gppath1) {
		this.gppath1 = gppath1;
	}

	public String getGppath2() {
		return gppath2;
	}

	public void setGppath2(String gppath2) {
		this.gppath2 = gppath2;
	}

	public String getGppath3() {
		return gppath3;
	}

	public void setGppath3(String gppath3) {
		this.gppath3 = gppath3;
	}

	public String getGppath4() {
		return gppath4;
	}

	public void setGppath4(String gppath4) {
		this.gppath4 = gppath4;
	}

	public String getGppath5() {
		return gppath5;
	}

	public void setGppath5(String gppath5) {
		this.gppath5 = gppath5;
	}

	@Override
	public String toString() {
		return "GoodPhoto [gpgno=" + gpgno + ", gpno=" + gpno + ", gppath1="
				+ gppath1 + ", gppath2=" + gppath2 + ", gppath3=" + gppath3
				+ ", gppath4=" + gppath4 + ", gppath5=" + gppath5 + "]";
	} 
	
	

}
