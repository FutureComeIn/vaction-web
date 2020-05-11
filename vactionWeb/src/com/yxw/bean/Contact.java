package com.yxw.bean;

/**
 * 3.收获地址表(常用联系人表)(编号，游客编号,联系人名称，手机号，地址，邮编，是否默认)
 * @author Administrator
 *
 */
public class Contact {
	private int cno;
	private int cuno;
	private String cname;
	private String cmobile;
	private String caddress;
	private String cpostcard;
	private String cdefault;
	
	public Contact() {
		super();
	}

	public Contact(int cno, int cuno, String cname, String cmobile,
			String caddress, String cpostcard, String cdefault) {
		super();
		this.cno = cno;
		this.cuno = cuno;
		this.cname = cname;
		this.cmobile = cmobile;
		this.caddress = caddress;
		this.cpostcard = cpostcard;
		this.cdefault = cdefault;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getCuno() {
		return cuno;
	}

	public void setCuno(int cuno) {
		this.cuno = cuno;
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
		return "Contact [caddress=" + caddress + ", cdefault=" + cdefault
				+ ", cmobile=" + cmobile + ", cname=" + cname + ", cno=" + cno
				+ ", cpostcard=" + cpostcard + ", cuno=" + cuno + "]";
	}
	
	
}
