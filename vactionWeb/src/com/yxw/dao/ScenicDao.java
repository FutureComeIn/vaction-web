package com.yxw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.yxw.bean.Scenic;
import com.yxw.bean.ScenicData;
import com.yxw.bean.SearchScenic;
import com.yxw.util.DBUtil;

public class ScenicDao {
	/**
	 * 删除景区，先删除该景区图片表、该景区订单表、该景区的支付表(先根据该景区表得到订单编号)
	 * @param sno
	 * @return
	 */
	public boolean delete(int sno){
		boolean flag=false;
		int count=1;
		int count1=1;
		int count2=1;
		int count3=1;
		Connection con=DBUtil.getConn();
		try {
			con.setAutoCommit(false);
			//删景区图片表
			String sql_sphoto="delete from tv_scenicphoto where spsno=?";
			PreparedStatement pst=con.prepareStatement(sql_sphoto);
			pst.setInt(1,sno);
			count*=pst.executeUpdate();
			count1*=pst.executeUpdate();
			
			//查询景区支付表的订单标号
			String sql_sno="select sono from tv_scenicorder where sosno=?";
			pst=con.prepareStatement(sql_sno);
			pst.setInt(1,sno);
			ResultSet rs=pst.executeQuery();
			List<Integer> snolist=new ArrayList<Integer>();
			int n=0;
			while(rs.next()){
				System.out.println("景区订单编号:"+rs.getInt(1));
				snolist.add(rs.getInt(1));
			}
			count2=snolist.size();
			String sql_pay="delete from tv_pay where psosono=?";
			for(int i=0;i<snolist.size();i++){
				pst=con.prepareStatement(sql_pay);
				pst.setInt(1,snolist.get(i));
				count*=pst.executeUpdate();
			}
			
			//删景区订单表
			String sql_sorder="delete from tv_scenicorder where sosno=?";
			pst=con.prepareStatement(sql_sorder);
			pst.setInt(1, sno);
			count*=pst.executeUpdate();
			count3*=pst.executeUpdate();
			
			
			//删除景区表
			String sql_scenic="delete from tv_scenic where sno=?";
			pst=con.prepareStatement(sql_scenic);
			pst.setInt(1,sno);
			count*=pst.executeUpdate();
			if(count>0||(count1<1&&count2<1&&count3<1)){
				con.commit();
				flag=true;        //flag=true 写在这里十分关键，否则只删除前面一个sql
				pst.close();
				con.close();
			}
		} catch (SQLException e) {
			// TODO 
			e.printStackTrace();
		}
		return flag;
	}
	
	public ScenicData queryScenic(SearchScenic search,int currentPage){
		ScenicData sdata=new ScenicData();
		//未分页sql
		StringBuffer sql1=new StringBuffer("select s.*,row_number() over (order by sno) rno from tv_scenic s where 1=1");
		//拼接编号，名称
		if(search.getSno()!=0){
			sql1=sql1.append(" and s.sno=").append(search.getSno());
		}
		if(search.getSname()!=null&&!"".equals(search.getSname())){
			sql1=sql1.append(" and s.sname like '%").append(search.getSname()).append("%'");
		}
		//分页sql
		StringBuffer sql2=new StringBuffer("select *from(").append(sql1);
		sql2=sql2.append(") sc where sc.rno>=").append((currentPage-1)*3+1);
		sql2=sql2.append(" and sc.rno<=").append(currentPage*3);
		//System.out.println("分页sql:"+sql2);
		List<Scenic> slist=DBUtil.query(sql2.toString(), Scenic.class,null);
		sdata.setSlist(slist);
		
		//统计根据条件查询的结果行
		StringBuffer sql3=new StringBuffer("select count(*) from (").append(sql1).append(")");
		//System.out.println("sql3="+sql3);
		Connection con=DBUtil.getConn();
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql3.toString());
			if(rs.next()){
				int count=rs.getInt(1);
				//计算页数
				int pageNum=(count+3-1)/3;
				sdata.setPageNum(pageNum);
			}
			
		} catch (SQLException e) {
			// TODO 
			e.printStackTrace();
		}
		return sdata;
	}
	

	public List<Scenic> queryScenics(){
		String sql="select * from tv_scenic";
		return DBUtil.query(sql, Scenic.class,null);
		
	}
	public List<Scenic> queryScenicsBySno(int sno){
		String sql="select * from tv_scenic where sno=?";
		Object[] obj = {sno};
		return DBUtil.query(sql, Scenic.class, obj);
	}
	public int executeUpdateOrder(int psosono){
		
		String sql = "delete tv_pay where psosono =?";
		Object[] objects = {psosono};
		return DBUtil.executeUpdate(sql, objects);
	}

}
