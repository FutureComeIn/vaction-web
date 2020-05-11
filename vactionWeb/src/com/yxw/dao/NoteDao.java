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
		String sql="select n.*,u.utxPath,u.uname from tv_note n inner join tv_user u on n.nuno=u.uno where nsend='是'";
		return DBUtil.query(sql, NoteView.class);
	}
	
	/**
	 * 根据编号修改游记信息
	 * @param tnote
	 * @return
	 */
	public int updateXiugaiNote(TravelNote tnote){
		  String sql="update tv_note set nuno=?,ntitle=?,ncontent=?,nsendtime=?,nsendfmPath=?,nlikecount=?,ncollectcount=?,nsend=? where nno=?";
		  SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:SS");
	 	  String time=sdf.format(new Date());
		  Object[] obj={tnote.getNuno(),tnote.getNtitle(),tnote.getNcontent(),time,tnote.getNsendfmPath(),tnote.getNlikecount(),tnote.getNcollectcount(),tnote.getNsend(),tnote.getNno()};
		  return DBUtil.executeUpdate(sql, obj);
	  }
	
	/**
	 * 根据用户编号查询游记信息
	 * @param nno
	 * @return
	 */
	 public List<TravelNote> queryNoteByNoteId(int nno){
		  String sql_1="select * from tv_note where nno=?";
		  Object[] obj={nno};
		  return DBUtil.query(sql_1, TravelNote.class, obj);
	  }
	
	//分页查询游记信息
 public List<NoteView> queryAll(int page){
	 String sql_1="select n.*,u.utxPath,u.uname,row_number() over(order by n.nno desc) recordno  from tv_note n inner join tv_user u on n.nuno=u.uno where nsend='是'";
	 String sql="select * from ("+sql_1+") where recordno>"+(page-1)*PageData.pagesize+" and recordno<="+page*PageData.pagesize;
	 return DBUtil.query(sql, NoteView.class);
 }	
	//发表(添加)游记信息
  public void save(TravelNote tnote){
	  
	  
	  String sql="insert into tv_note values(seq_note_nno.nextval,?,?,?,?,0,0,'是',?)";
	  SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:SS");
 	 String time=sdf.format(new Date());
	  Object[] obj={tnote.getNuno(),tnote.getNcontent(),time,tnote.getNsendfmPath(),tnote.getNtitle()};
	  DBUtil.executeUpdate(sql, obj);
  }
  //根据游记编号查询游记内容
  public List<NoteView> queryContentByNoteId(int note){
	  String sql_1="select n.*,u.utxPath,u.uname from tv_note n inner join tv_user u on n.nuno=u.uno where nno=?";
	  String update_sql=
			"update tv_note set nlikecount=nlikecount+1 where nno=?";
	  Object[] obj={note};
	  DBUtil.executeUpdate(update_sql, obj);
	  return DBUtil.query(sql_1, NoteView.class, note);
  }
  //根据用户编号查询已发表的游记信息
  public List<MyNoteView> queryNoteByNuno(int nuno){
	  String sql="select n.*,u.uname,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where n.nsend='是' and n.nuno=?";
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  //根据用户编号分页查询已发表游记信息
  public List<MyNoteView> queryNoteByPage(int nuno,int page){
	  String sql_1="select n.*,u.uname,row_number() over(order by n.nno desc) recordno,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where  n.nsend='是' and n.nuno=?";
	  String sql="select * from ("+sql_1+") where recordno>"+(page-1)*PageData.pagesize+" and recordno<="+page*PageData.pagesize;
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  //保存游记信息到草稿
  public void saveToDraft(TravelNote tnote){
	  String sql="insert into tv_note values(seq_note_nno.nextval,?,?,?,?,0,0,'否',?)";
	  SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:SS");
 	 String time=sdf.format(new Date());
	  Object[] obj={tnote.getNuno(),tnote.getNcontent(),time,tnote.getNsendfmPath(),tnote.getNtitle()};
	  DBUtil.executeUpdate(sql, obj);
  }
  //根据游记编号删除游记信息
  public int delete(int note){
	  String sql="delete tv_note where nno=?";
	  return DBUtil.executeUpdate(sql, new Object[]{note});
  }
  //根据用户编号查询草稿箱中的游记信息
  public List<MyNoteView> queryNoteOfDraft(int nuno){
	  String sql="select n.*,u.uname,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where n.nsend='否' and n.nuno=?";
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  //根据用户编号查询草稿箱中的游记信息
  public List<MyNoteView> queryNoteOfDraftByPage(int nuno,int page){
	  String sql_1="select n.*,u.uname,row_number() over(order by n.nno desc) recordno,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where  n.nsend='否' and n.nuno=?";
	  String sql="select * from ("+sql_1+") where recordno>"+(page-1)*PageData.pagesize+" and recordno<="+page*PageData.pagesize;
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  //根据游记编号将草稿箱中的游记发表
  public int update(int note){
	  String sql="update tv_note set nsend='是' where nno=?";
	  return DBUtil.executeUpdate(sql, new Object[]{note});
  }
  //根据游记编号更新游记表的收藏信息
  public int updateCollection(int note){
	  String sql="update tv_note set ncollectcount=ncollectcount+1 where nno=?";
	  return DBUtil.executeUpdate(sql, new Object[]{note});
  }
  //用户发表一篇游记积分加100
  public int updateUpoint(int nuno){
	  String sql="update tv_user set upoint=upoint+100 where uno=?";
	  return DBUtil.executeUpdate(sql, new Object[]{nuno});
  }
  //查询其他人发表的游记
  public List<MyNoteView> queryNoteByOthers(int nuno){
	  String sql="select n.*,u.uname,u.usignature,u.utxPath from tv_note n inner join tv_user u on n.nuno=u.uno where n.nsend='是' and n.nuno!=?";
	  Object[] obj={nuno};
	  return DBUtil.query(sql, MyNoteView.class, obj);
  }
  
}
