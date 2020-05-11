package com.yxw.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.yxw.bean.Comment;
import com.yxw.bean.PageData;
import com.yxw.util.DBUtil;
import com.yxw.view.CommentView;
import com.yxw.view.MyCommentView;
import com.yxw.view.MyNoteView;

public class CommentDao {
	//发表评论
   public void save(Comment comment){
	   String sql="insert into tv_comment values(seq_comment_cno.nextval,?,?,?,?)";
	   SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm:SS");
	   String time=sdf.format(new Date());
	   Object[] obj={comment.getCuno(),comment.getCcontent(),time,comment.getCobjectno()};
	   DBUtil.executeUpdate(sql, obj);
   }
   //根据游记编号查询评论
   public List<CommentView> queryAll(int cobjectno){
	   String sql="select c.*,u.uname from tv_comment c inner join tv_user u on c.cuno=u.uno where cobjectno=?";
	   return DBUtil.query(sql, CommentView.class,cobjectno);
   }
   //根据用户编号查询评论
   public List<MyCommentView> queryCommentByNuno(int cuno){
		  String sql="select n.*,u.uname,c.* from tv_comment c inner join tv_note n  on c.cobjectno=n.nno inner join tv_user u on c.cuno=u.uno where c.cuno=?";
		  Object[] obj={cuno};
		  return DBUtil.query(sql, MyCommentView.class, obj);
	  }
   //根据用户编号分页查询评论
   public List<MyCommentView> queryCommentByPage(int cuno,int page){
		  String sql_1="select n.*,u.uname,c.*,row_number() over(order by n.nno) recordno from tv_comment c inner join tv_note n  on c.cobjectno=n.nno inner join tv_user u on c.cuno=u.uno where c.cuno=?";
		  String sql="select * from ("+sql_1+") where recordno>"+(page-1)*PageData.pagesize+" and recordno<="+page*PageData.pagesize;
		  Object[] obj={cuno};
		  return DBUtil.query(sql, MyCommentView.class, obj);
	  }
   //删除评论
   public int delete(int note){
		  String sql="delete tv_comment where cno=?";
		  return DBUtil.executeUpdate(sql, new Object[]{note});
	  }
   
   public int deleteByCobjectno(int cobjectno){
		  String sql="delete tv_comment where cobjectno=?";
		  return DBUtil.executeUpdate(sql, new Object[]{cobjectno});
	  }
   
}
