package com.yxw.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import com.yxw.bean.Collection;
import com.yxw.bean.PageData;
import com.yxw.util.DBUtil;
import com.yxw.view.MyCollectionView;
import com.yxw.view.MyCommentView;

public class CollectionDao {
   //����ղ���Ϣ
	public void save(Collection collection){
		   String sql="insert into tv_collection values(seq_collection_cno.nextval,?,?,?)";
		   SimpleDateFormat sdf=new SimpleDateFormat("yyyy��MM��dd�� HH:mm:SS");
		   String time=sdf.format(new Date());
		   Object[] obj={collection.getCuno(),collection.getCnno(),time};
		   DBUtil.executeUpdate(sql, obj);
	   }
	//�����û���Ų�ѯ�ղ���Ϣ
	   public List<MyCollectionView> queryCollectionByNuno(int cuno){
			  String sql="select n.*,u.uname,c.* from tv_collection c inner join tv_note n on c.cnno=n.nno inner join tv_user u on c.cuno=u.uno where c.cuno=?";
			  Object[] obj={cuno};
			  return DBUtil.query(sql, MyCollectionView.class, obj);
		  }
	   //�����û���ŷ�ҳ��ѯ����
	   public List<MyCollectionView> queryCollectionByPage(int cuno,int page){
			  String sql_1="select n.*,u.uname,c.*,row_number() over(order by n.nno) recordno from tv_collection c inner join tv_note n  on c.cnno=n.nno inner join tv_user u on c.cuno=u.uno where c.cuno=?";
			  String sql="select * from ("+sql_1+") where recordno>"+(page-1)*PageData.pagesize+" and recordno<="+page*PageData.pagesize;
			  Object[] obj={cuno};
			  return DBUtil.query(sql, MyCollectionView.class, obj);
		  }
	   //ɾ���ղ���Ϣ
	   public int delete(int note){
			  String sql="delete tv_collection where cno=?";
			  return DBUtil.executeUpdate(sql, new Object[]{note});
		  }
	   
	   public int deleteByCnno(int cnno){
			  String sql="delete tv_collection where cnno=?";
			  return DBUtil.executeUpdate(sql, new Object[]{cnno});
		  }
}
