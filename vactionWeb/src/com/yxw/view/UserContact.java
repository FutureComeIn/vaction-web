package com.yxw.view;
/**
 * 2.游客表(编号，昵称，密码，性别，头像，个性签名，积分)
 * 3.收获地址表(常用联系人表)(编号，游客编号,联系人名称，手机号，地址，邮编，是否默认)
 * @author Administrator
 *
 */
public class UserContact {
	private int uno;
	//private String uname;
	private String upw;
	private String usex;
	private String utxPath;
	private String usignature;
	private int upoint;
	
	private int cno;
	//private int cuno;
	private String cname;
	private String cmobile;
	private String caddress;
	private String cpostcard;
	private String cdefault;
	
	public UserContact() {
		super();
	}

	public UserContact(int uno, String upw, String usex, String utxPath,
			String usignature, int upoint, int cno, String cname,
			String cmobile, String caddress, String cpostcard, String cdefault) {
		super();
		this.uno = uno;
		this.upw = upw;
		this.usex = usex;
		this.utxPath = utxPath;
		this.usignature = usignature;
		this.upoint = upoint;
		this.cno = cno;
		this.cname = cname;
		this.cmobile = cmobile;
		this.caddress = caddress;
		this.cpostcard = cpostcard;
		this.cdefault = cdefault;
	}

	public int getUno() {
		return uno;
	}

	public void setUno(int uno) {
		this.uno = uno;
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

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCmobile() {
		return cmobile;
	}

	public void setCmobile(String cmobile) {
		this.cmobile = cmobile;
	}

	public String getCaddress() {
		return caddress;
	}

	public void setCaddress(String caddress) {
		this.caddress = caddress;
	}

	public String getCpostcard() {
		return cpostcard;
	}

	public void setCpostcard(String cpostcard) {
		this.cpostcard = cpostcard;
	}

	public String getCdefault() {
		return cdefault;
	}

	public void setCdefault(String cdefault) {
		this.cdefault = cdefault;
	}

	@Override
	public String toString() {
		return "UserContact [caddress=" + caddress + ", cdefault=" + cdefault
				+ ", cmobile=" + cmobile + ", cname=" + cname + ", cno=" + cno
				+ ", cpostcard=" + cpostcard + ", uno=" + uno + ", upoint="
				+ upoint + ", upw=" + upw + ", usex=" + usex + ", usignature="
				+ usignature + ", utxPath=" + utxPath + "]";
	}
	
	
	
	
}
