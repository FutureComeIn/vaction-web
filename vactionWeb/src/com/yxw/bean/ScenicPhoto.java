package com.yxw.bean;

public class ScenicPhoto {
	private int spno;
	private int spsno;
	private String spphoto1;
	private String spphoto2;
	private String spphoto3;
	private String spphoto4;
	private String spphoto5;
	
	public ScenicPhoto() {
		super();
	}

	public ScenicPhoto(int spno, int spsno, String spphoto1, String spphoto2,
			String spphoto3, String spphoto4, String spphoto5) {
		super();
		this.spno = spno;
		this.spsno = spsno;
		this.spphoto1 = spphoto1;
		this.spphoto2 = spphoto2;
		this.spphoto3 = spphoto3;
		this.spphoto4 = spphoto4;
		this.spphoto5 = spphoto5;
	}

	public int getSpno() {
		return spno;
	}

	public void setSpno(int spno) {
		this.spno = spno;
	}

	public int getSpsno() {
		return spsno;
	}

	public void setSpsno(int spsno) {
		this.spsno = spsno;
	}

	public String getSpphoto1() {
		return spphoto1;
	}

	public void setSpphoto1(String spphoto1) {
		this.spphoto1 = spphoto1;
	}

	public String getSpphoto2() {
		return spphoto2;
	}

	public void setSpphoto2(String spphoto2) {
		this.spphoto2 = spphoto2;
	}

	public String getSpphoto3() {
		return spphoto3;
	}

	public void setSpphoto3(String spphoto3) {
		this.spphoto3 = spphoto3;
	}

	public String getSpphoto4() {
		return spphoto4;
	}

	public void setSpphoto4(String spphoto4) {
		this.spphoto4 = spphoto4;
	}

	public String getSpphoto5() {
		return spphoto5;
	}

	public void setSpphoto5(String spphoto5) {
		this.spphoto5 = spphoto5;
	}

	@Override
	public String toString() {
		return "ScenicPhoto [spno=" + spno + ", spphoto1=" + spphoto1
				+ ", spphoto2=" + spphoto2 + ", spphoto3=" + spphoto3
				+ ", spphoto4=" + spphoto4 + ", spphoto5=" + spphoto5
				+ ", spsno=" + spsno + "]";
	}
	

}
