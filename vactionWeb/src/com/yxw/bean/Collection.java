package com.yxw.bean;

/**
 * 5.收藏表(编号，游客编号，游记编号，收藏时间)
 * @author Administrator
 *
 */
public class Collection {
	private int cno;
	private int cuno;
	private int cnno;
	private String cdate;
	
	public Collection() {
		super();
	}

	public Collection(int cno, int cuno, int cnno, String cdate) {
		super();
		this.cno = cno;
		this.cuno = cuno;
		this.cnno = cnno;
		this.cdate = cdate;
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

	public int getCnno() {
		return cnno;
	}

	public void setCnno(int cnno) {
		this.cnno = cnno;
	}

	public String getCdate() {
		return cdate;
	}

	public void setCdate(String cdate) {
		this.cdate = cdate;
	}

	@Override
	public String toString() {
		return "Collection [cdate=" + cdate + ", cnno=" + cnno + ", cno=" + cno
				+ ", cuno=" + cuno + "]";
	}
	
	
}
