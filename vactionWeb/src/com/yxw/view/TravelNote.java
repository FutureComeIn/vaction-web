package com.yxw.view;
/**
 * 游记表与游客表的视图类
 * @author 暗藏疯
 *
 */
public class TravelNote {
	private int nno;
	private int nuno;
	private String ncontent;
	private String nsendtime;
	private String nsendfmPath;
	private int nlikecount;
	private int ncollectcount;
	private String  nsend;
	private String ntitle;
	private String uname;
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public int getNuno() {
		return nuno;
	}
	public void setNuno(int nuno) {
		this.nuno = nuno;
	}
	public String getNcontent() {
		return ncontent;
	}
	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}
	public String getNsendtime() {
		return nsendtime;
	}
	public void setNsendtime(String nsendtime) {
		this.nsendtime = nsendtime;
	}
	public String getNsendfmPath() {
		return nsendfmPath;
	}
	public void setNsendfmPath(String nsendfmPath) {
		this.nsendfmPath = nsendfmPath;
	}
	public int getNlikecount() {
		return nlikecount;
	}
	public void setNlikecount(int nlikecount) {
		this.nlikecount = nlikecount;
	}
	public int getNcollectcount() {
		return ncollectcount;
	}
	public void setNcollectcount(int ncollectcount) {
		this.ncollectcount = ncollectcount;
	}
	public String getNsend() {
		return nsend;
	}
	public void setNsend(String nsend) {
		this.nsend = nsend;
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
	public TravelNote(int nno, int nuno, String ncontent, String nsendtime,
			String nsendfmPath, int nlikecount, int ncollectcount,
			String nsend, String ntitle, String uname) {
		super();
		this.nno = nno;
		this.nuno = nuno;
		this.ncontent = ncontent;
		this.nsendtime = nsendtime;
		this.nsendfmPath = nsendfmPath;
		this.nlikecount = nlikecount;
		this.ncollectcount = ncollectcount;
		this.nsend = nsend;
		this.ntitle = ntitle;
		this.uname = uname;
	}
	public TravelNote() {
		super();
	}
	@Override
	public String toString() {
		return "TravelNote [ncollectcount=" + ncollectcount + ", ncontent="
				+ ncontent + ", nlikecount=" + nlikecount + ", nno=" + nno
				+ ", nsend=" + nsend + ", nsendfmPath=" + nsendfmPath
				+ ", nsendtime=" + nsendtime + ", ntitle=" + ntitle + ", nuno="
				+ nuno + ", uname=" + uname + "]";
	}
	
	
	
}
