package com.yxw.view;

public class MyNoteView {
	private int nno;//游记编号
	private int nuno;//游记作者编号
	private String ntitle;//游记标题
	private String ncontent;//游记内容
	private String nsendtime;//发布时间
	private String nsendfmPath;//封面图片路径
	private int nlikecount;//点击率
	private int ncollectcount;//收藏数
	private String  nsend;//是否已发表
	
	private String uname; //游记作者昵称
	private String usignature;//游记作者个性签名;
	private String utxPath;//游记作者头像;
	
	
	public MyNoteView() {
		super();
	}
	public MyNoteView(int nno, int nuno, String ntitle, String ncontent,
			String nsendtime, String nsendfmPath, int nlikecount,
			int ncollectcount, String nsend, String uname, String usignature,
			String utxPath) {
		super();
		this.nno = nno;
		this.nuno = nuno;
		this.ntitle = ntitle;
		this.ncontent = ncontent;
		this.nsendtime = nsendtime;
		this.nsendfmPath = nsendfmPath;
		this.nlikecount = nlikecount;
		this.ncollectcount = ncollectcount;
		this.nsend = nsend;
		this.uname = uname;
		this.usignature = usignature;
		this.utxPath = utxPath;
	}
	
	
	
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
	public String getNtitle() {
		return ntitle;
	}
	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUsignature() {
		return usignature;
	}
	public void setUsignature(String usignature) {
		this.usignature = usignature;
	}
	public String getUtxPath() {
		return utxPath;
	}
	public void setUtxPath(String utxPath) {
		this.utxPath = utxPath;
	}
	@Override
	public String toString() {
		return "MyNoteView [ncollectcount=" + ncollectcount + ", ncontent="
				+ ncontent + ", nlikecount=" + nlikecount + ", nno=" + nno
				+ ", nsend=" + nsend + ", nsendfmPath=" + nsendfmPath
				+ ", nsendtime=" + nsendtime + ", ntitle=" + ntitle + ", nuno="
				+ nuno + ", uname=" + uname + ", usignature=" + usignature
				+ ", utxPath=" + utxPath + "]";
	}
	
	
}
