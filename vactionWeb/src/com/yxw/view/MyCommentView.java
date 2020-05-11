package com.yxw.view;

public class MyCommentView {
	private int cno;//评论编号
	private int cuno;//评论者编号
	private String ccontent;//评论内容
	private String cdate;//评论时间
	private int cobjectno;//游记编号
	
	private String uname;//游记作者
	private String ntitle;//游记标题
	
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
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public int getCobjectno() {
		return cobjectno;
	}
	public void setCobjectno(int cobjectno) {
		this.cobjectno = cobjectno;
	}
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	
	
}
