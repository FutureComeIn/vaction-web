package com.yxw.bean;

/**
 * 1.管理员表(编号,登录名，密码，手机号)
 * @author Administrator
 *
 */
public class Admin {
	private int ano;
	private String aname;
	private String apsw;
	private String amobile;
	
	public Admin() {
		super();
	}

	public Admin(int ano, String aname, String apsw, String amobile) {
		super();
		this.ano = ano;
		this.aname = aname;
		this.apsw = apsw;
		this.amobile = amobile;
	}

	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getApsw() {
		return apsw;
	}

	public void setApsw(String apsw) {
		this.apsw = apsw;
	}

	public String getAmobile() {
		return amobile;
	}

	public void setAmobile(String amobile) {
		this.amobile = amobile;
	}

	@Override
	public String toString() {
		return "Admin [amobile=" + amobile + ", aname=" + aname + ", ano="
				+ ano + ", apsw=" + apsw + "]";
	}
	
	
	

}
