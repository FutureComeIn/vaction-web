package com.yxw.bean;
/**
 * 2.游客表(编号，昵称，密码，性别，头像，个性签名，积分)
 * @author Administrator
 *
 */

public class User {
	private int uno;
	private String uname;
	private String upw;
	private String usex;
	private String utxPath;
	private String usignature;
	private int upoint;
	
	public User() {
		super();
	}
	
	public User(int uno, String uname, String upw, String usex, String utxPath,
			String usignature, int upoint) {
		super();
		this.uno = uno;
		this.uname = uname;
		this.upw = upw;
		this.usex = usex;
		this.utxPath = utxPath;
		this.usignature = usignature;
		this.upoint = upoint;
	}
	
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
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
		return "User [uname=" + uname + ", uno=" + uno + ", upoint=" + upoint
				+ ", upw=" + upw + ", usex=" + usex + ", usignature="
				+ usignature + ", utxPath=" + utxPath + "]";
	}
	
	
}
