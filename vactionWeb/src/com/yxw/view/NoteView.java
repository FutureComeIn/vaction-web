package com.yxw.view;
//�μ���ʾ��Ϣ��ͼ��
public class NoteView {
	private int nno;//�μǱ��
	private int nuno;//�μ����߱��
	private String ntitle;//�μǱ���
	private String ncontent;//�μ�����
	private String nsendtime;//����ʱ��
	private String nsendfmPath;//����ͼƬ·��
	private int nlikecount;//�����
	private int ncollectcount;//�ղ���
	private String  nsend;//�Ƿ��ѷ���
	
	private String uname; //�μ������ǳ�
	private String utxPath;//�μ�����ͷ��
	
	


	public String getUtxPath() {
		return utxPath;
	}

	public void setUtxPath(String utxPath) {
		this.utxPath = utxPath;
	}

	public NoteView(){
		super();
	}

	public NoteView(int nno, int nuno, String ntitle, String ncontent,
			String nsendtime, String nsendfmPath, int nlikecount,
			int ncollectcount, String nsend, String uname,String utxPath) {
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
		this.utxPath=utxPath;
		
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
	
	
}
