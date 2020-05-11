package com.yxw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.yxw.util.DBUtil;

public class UserDao {
	/**
	 * 统计用户数
	 * @return
	 */
	public int countUser(){
		int count=0;
		String sql="select count(*) from tv_user";
		Connection con=DBUtil.getConn();
		try {
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery(sql);
			if(rs.next()){
				count=rs.getInt(1);
			}
			DBUtil.closeAll(con, st, rs);
		} catch (SQLException e) {
			// TODO 
			e.printStackTrace();
		}
		return count;
	}
	/**
	 * 删除用户，先删除其联系人、该用户的景区订单、商品订单、写的游记(所以不操作删除用户了)
	 * @param uno
	 * @return
	 */
	public boolean deleteUser(int uno){
		boolean flag=false;
		int count=1;
		Connection con=DBUtil.getConn();
		try {
			con.setAutoCommit(false);
			
			String sql_contact="delete from tv_contact where cuno=?";
			PreparedStatement pst=con.prepareStatement(sql_contact);
			pst.setInt(1,uno);
			pst.close();
			
			String sql_user="delete from tv_user where uno=?";
			pst=con.prepareStatement(sql_user);
			pst.setInt(1,uno);
			count*=pst.executeUpdate();
			//pst.close();
			
			if(count>0){
				con.commit();
				flag=true;
				pst.close();
				con.close();
			}

		} catch (SQLException e) {
			// TODO 
			e.printStackTrace();
		}
		return flag;
	}
	
	/**
	 * 统计某用户有多少条收货地址
	 * @param uno
	 * @return
	 */
	public int count_contact(int uno){
		int count=0;
		Connection con=DBUtil.getConn();
		String sql="select count(*) from tv_contact where cuno=?";
		try {
			PreparedStatement pst=con.prepareStatement(sql);
			pst.setInt(1,uno);
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				count=rs.getInt(1);
			}
			DBUtil.closeAll(con, pst, null);
		} catch (SQLException e) {
			// TODO
			e.printStackTrace();
		}
		return count;
	}
	/**
	 * 添加地址时的 设置默认参数
	 * @param uno
	 */
	public void update_address(int uno){
		String sql_address="update tv_contact set cdefault='否' where cuno="+uno;
		Connection con=DBUtil.getConn();
		try {
			Statement st=con.createStatement();
			st.executeUpdate(sql_address);
		} catch (SQLException e) {
			// TODO 
			e.printStackTrace();
		}
	}

}
