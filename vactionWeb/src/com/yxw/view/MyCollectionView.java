package com.yxw.view;
//我的收藏视图
public class MyCollectionView {
	private int cno;
	private int cuno;
	private int cnno;
	private String cdate;
	
    private String uname;//游记作者
	
	private String ntitle;//游记标题
	

	private String ncontent;//游记内容
	
	private String nsendfmPath;
	

	public String getNsendfmPath() {
		return nsendfmPath;
	}

	public void setNsendfmPath(String nsendfmPath) {
		this.nsendfmPath = nsendfmPath;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
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

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}
}
