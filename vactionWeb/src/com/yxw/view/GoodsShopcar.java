package com.yxw.view;

public class GoodsShopcar {
	//goods±í
	//private int gno;
	private String gname;
	private String gtype;
	private String gplace;
	private double gprice;
	private int gdealcount;
	private int gpoint;
	private String gheadphotopath;
	private String gdetailphotopath;
	//ShopCar±í
	private int sno;
	private int suno;
	private int sgno;
	private int scount;
	private double sprice;
	//User ±í
	//private int uno;
	private String uname;
	private String upw;
	private String usex;
	private String utxPath;
	private String usignature;
	private int upoint;
	
	
	
	public GoodsShopcar() {
		super();
	}
	public GoodsShopcar(String gname, String gtype, String gplace,
			double gprice, int gdealcount, int gpoint, String gheadphotopath,
			String gdetailphotopath, int sno, int suno, int sgno,
			int scount, double sprice, String uname, String upw, String usex,
			String utxPath, String usignature, int upoint) {
		super();
		this.gname = gname;
		this.gtype = gtype;
		this.gplace = gplace;
		this.gprice = gprice;
		this.gdealcount = gdealcount;
		this.gpoint = gpoint;
		this.gheadphotopath = gheadphotopath;
		this.gdetailphotopath = gdetailphotopath;
		this.sno = sno;
		this.suno = suno;
		this.sgno = sgno;
		this.scount = scount;
		this.sprice = sprice;
		this.uname = uname;
		this.upw = upw;
		this.usex = usex;
		this.utxPath = utxPath;
		this.usignature = usignature;
		this.upoint = upoint;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public String getGtype() {
		return gtype;
	}
	public void setGtype(String gtype) {
		this.gtype = gtype;
	}
	public String getGplace() {
		return gplace;
	}
	public void setGplace(String gplace) {
		this.gplace = gplace;
	}
	public double getGprice() {
		return gprice;
	}
	public void setGprice(double gprice) {
		this.gprice = gprice;
	}
	public int getGdealcount() {
		return gdealcount;
	}
	public void setGdealcount(int gdealcount) {
		this.gdealcount = gdealcount;
	}
	public int getGpoint() {
		return gpoint;
	}
	public void setGpoint(int gpoint) {
		this.gpoint = gpoint;
	}
	public String getGheadphotopath() {
		return gheadphotopath;
	}
	public void setGheadphotopath(String gheadphotopath) {
		this.gheadphotopath = gheadphotopath;
	}
	public String getGdetailphotopath() {
		return gdetailphotopath;
	}
	public void setGdetailphotopath(String gdetailphotopath) {
		this.gdetailphotopath = gdetailphotopath;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpw() {
		return upw;
	}
	public void setUpw(String upw) {
		this.upw = upw;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getUtxPath() {
		return utxPath;
	}
	public void setUtxPath(String utxPath) {
		this.utxPath = utxPath;
	}
	public String getUsignature() {
		return usignature;
	}
	public void setUsignature(String usignature) {
		this.usignature = usignature;
	}
	public int getUpoint() {
		return upoint;
	}
	public void setUpoint(int upoint) {
		this.upoint = upoint;
	}
	@Override
	public String toString() {
		return "GoodsShopcar [gdealcount=" + gdealcount + ", gdetailphotopath="
				+ gdetailphotopath + ", gheadphotopath=" + gheadphotopath
				+ ", gname=" + gname + ", gplace=" + gplace + ", gpoint="
				+ gpoint + ", gprice=" + gprice + ", gtype=" + gtype
				+ ", scount=" + scount + ", sgno=" + sgno + ", sno=" + sno
				+ ", sprice=" + sprice + ", suno=" + suno + ", uname=" + uname
				+ ", upoint=" + upoint + ", upw=" + upw + ", usex=" + usex
				+ ", usignature=" + usignature + ", utxPath=" + utxPath + "]";
	}
	
	
	
	
}
