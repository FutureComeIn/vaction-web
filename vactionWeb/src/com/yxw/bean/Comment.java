package com.yxw.bean;
/**
 * 16.评论表(编号，评论者编号，内容，评论时间，游记编号) 
 * @author Administrator
 *
 */
public class Comment {
	private int cno;
	private int cuno;
	private String ccontent;
	private String cdate;
	private int cobjectno;
	
	public Comment() {
		super();
	}

	public Comment(int cno, int cuno, String ccontent, String cdate,
			int cobjectno) {
		super();
		this.cno = cno;
		this.cuno = cuno;
		this.ccontent = ccontent;
		this.cdate = cdate;
		this.cobjectno = cobjectno;
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

	@Override
	public String toString() {
		return "Comment [ccontent=" + ccontent + ", cdate=" + cdate + ", cno="
				+ cno + ", cobjectno=" + cobjectno + ", cuno=" + cuno + "]";
	}
	

}
