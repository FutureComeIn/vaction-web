package com.yxw.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.yxw.bean.PageData;
import com.yxw.bean.TravelNote;
import com.yxw.util.DBUtil;
import com.yxw.view.MyNoteView;
import com.yxw.view.NoteView;

public class NoteDao {
	public List<NoteView> query(){
		String sql="select n.*,u.utxPath,u.uname from tv_note n inner join tv_user u on n.nuno=u.uno where nsend='��'";
		return DBUtil.query(sql, NoteView.class);
	}
	
	/**
	 * ���ݱ���޸��μ���Ϣ
	 * @param tnote
	 * @return
	 */
	public int updateXiugaiNote(TravelNote tnote){
		  String sql="update tv_note set nuno=?,ntitle=?,ncontent=?,nsendtime=?,nsendfmPath=?,nlikecount=?,ncollectcount=?,nsend=? where nno=?";
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy��MM��dd�� HH:mm:SS");
	 	  String time=sdf.format(new Date());
		  Object[] obj={tnote.getNuno(),tnote.getNtitle(),tnote.getNcontent(),time,tnote.getNsendfmPath(),tnote.getNlikecount(),tnote.getNcollectcount(),tnote.getNsend(),tnote.getNno()};
		  return DBUtil.executeUpdate(sql, obj);
	  }
	
	/**
	 * �����û���Ų�ѯ�μ���Ϣ
	 * @param nno
	 * @return
	 */
	 public List<TravelNote> queryNoteByNoteId(int nno){
		  String sql_1="select * from tv_note where nno=?";
		  Object[] obj={nno};
		  return DBUtil.query(sql_1, TravelNote.class, obj);
	  }
	
	//��ҳ��ѯ�μ���Ϣ
 public List<NoteView> queryAll(int page){
	 String sql_1="select n.*,u.utxPath,u.uname,row_number() over(order by n.nno desc) recordno  from tv_note n inner join tv_user u on n.nuno=u.uno where nsend='��'";
	 String sql="select * from ("+sql_1+") where recordno>"+(page-1)*PageData.pagesize+" and recordno<="+page*PageData.pagesize;
	 return DBUtil.query(sql, NoteView.class);
 }	
	//����(���)�μ���Ϣ
  public void save(TravelNote tnote){
	  
	  
	  String sql="insert into tv_note values(seq_note_nno.nextval,?,?,?,?,0,0,'��',?)";
	  SimpleDateFormat sdf=new SimpleDateFormat("yyyy��MM��dd�� HH:mm:SS");
 	 String time=sdf.format(new Date());
	  Object[] obj={tnote.getNuno(),tnote.getNcontent(),time,tnote.getNsendfmPath(),tnote.getNtitle()};
	  DBUtil.executeUpdate(sql, obj);
  }
  //�����μǱ�Ų�ѯ�μ�����
  public List<NoteView> queryContentByNoteId(int note){
	  String sql_1="select n.*,u.utxPath,u.uname from tv_note n inner join tv_user u on n.nuno=u.uno where nno=?";
	  String update_sql=
			"update tv_note set nlikecount=nlikecount+1 where nno=?";
	  Object[] obj={note};
	  DBUtil.executeUpdate(update_sql, obj);
	  return DBUtil.query(sql_1, NoteView.class, note);
  }
  //�����û���Ų�ѯ�ѷ�����μ���Ϣ
  public List<MyNoteView> queryNoteByNuno(int nuno){
	  String sql="select n.*,u.uname,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where n.nsend='��' and n.nuno=?";
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  //�����û���ŷ�ҳ��ѯ�ѷ����μ���Ϣ
  public List<MyNoteView> queryNoteByPage(int nuno,int page){
	  String sql_1="select n.*,u.uname,row_number() over(order by n.nno desc) recordno,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where  n.nsend='��' and n.nuno=?";
	  String sql="select * from ("+sql_1+") where recordno>"+(page-1)*PageData.pagesize+" and recordno<="+page*PageData.pagesize;
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  //�����μ���Ϣ���ݸ�
  public void saveToDraft(TravelNote tnote){
	  String sql="insert into tv_note values(seq_note_nno.nextval,?,?,?,?,0,0,'��',?)";
	  SimpleDateFormat sdf=new SimpleDateFormat("yyyy��MM��dd�� HH:mm:SS");
 	 String time=sdf.format(new Date());
	  Object[] obj={tnote.getNuno(),tnote.getNcontent(),time,tnote.getNsendfmPath(),tnote.getNtitle()};
	  DBUtil.executeUpdate(sql, obj);
  }
  //�����μǱ��ɾ���μ���Ϣ
  public int delete(int note){
	  String sql="delete tv_note where nno=?";
	  return DBUtil.executeUpdate(sql, new Object[]{note});
  }
  //�����û���Ų�ѯ�ݸ����е��μ���Ϣ
  public List<MyNoteView> queryNoteOfDraft(int nuno){
	  String sql="select n.*,u.uname,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where n.nsend='��' and n.nuno=?";
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  //�����û���Ų�ѯ�ݸ����е��μ���Ϣ
  public List<MyNoteView> queryNoteOfDraftByPage(int nuno,int page){
	  String sql_1="select n.*,u.uname,row_number() over(order by n.nno desc) recordno,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where  n.nsend='��' and n.nuno=?";
	  String sql="select * from ("+sql_1+") where recordno>"+(page-1)*PageData.pagesize+" and recordno<="+page*PageData.pagesize;
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  //�����μǱ�Ž��ݸ����е��μǷ���
  public int update(int note){
	  String sql="update tv_note set nsend='��' where nno=?";
	  return DBUtil.executeUpdate(sql, new Object[]{note});
  }
  //�����μǱ�Ÿ����μǱ���ղ���Ϣ
  public int updateCollection(int note){
	  String sql="update tv_note set ncollectcount=ncollectcount+1 where nno=?";
	  return DBUtil.executeUpdate(sql, new Object[]{note});
  }
  //�û�����һƪ�μǻ��ּ�100
  public int updateUpoint(int nuno){
	  String sql="update tv_user set upoint=upoint+100 where uno=?";
	  return DBUtil.executeUpdate(sql, new Object[]{nuno});
  }
  //��ѯ�����˷�����μ�
  public List<MyNoteView> queryNoteByOthers(int nuno){
	  String sql="select n.*,u.uname,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where n.nsend='��' and n.nuno!=?";
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  
}
