package com.yxw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.org.apache.commons.digester.rss.RSSDigester;
import com.yxw.bean.ScenicOrder;
import com.yxw.util.DBUtil;
import com.yxw.view.ScenicOrderPay;

public class ScenicOrderDao {

	public List<ScenicOrder> queryScenicOrders(){
		String sql= "select * from tv_scenicorder";
		return DBUtil.query(sql, ScenicOrder.class ,null);
	}
	
	public int executeUpdate(int souno,int sosno,int socount,int soprice,String socontactname,String socontactmobile,String sodate){
		
		String sql="insert into tv_scenicorder values(seq_scenicorder_sono.nextval,?,?,?,?,?,?,?)";
		Object[] obj = {souno,sosno,socount,soprice,socontactname,socontactmobile,sodate};
		return DBUtil.executeUpdate(sql, obj);
	}
	
	public List<ScenicOrder> selectCurentOrders(){
		String sql = "select * from tv_scenicorder order by sono desc";
		return DBUtil.query(sql, ScenicOrder.class, null);
	}
	
	public List<ScenicOrderPay> queryAllScenicOrder(int uno){
		String sql = "select ts.sname,ts.sheadpath,tso.sono,tso.sosno,tso.socount,tso.soprice,tso.sodate,tp.ppaymoney,tp.ptype from tv_scenic ts,tv_scenicorder tso,tv_pay tp,tv_user tu"; 
		sql+=" where ts.sno=tso.sosno and tso.sono=tp.psosono and tso.souno=tu.uno and tu.uno=?";
		Object[] obj={uno};
		return DBUtil.query(sql, ScenicOrderPay.class, obj);
	}
	
	public List<ScenicOrderPay> queryNoPayScenicOrder(int uno){
		
		String sql = "select ts.sname,ts.sheadpath,tso.sono,tso.sosno,tso.socount,tso.soprice,tso.sodate,tp.ppaymoney,tp.ptype from tv_scenic ts,tv_scenicorder tso,tv_pay tp,tv_user tu";
		sql+=" where ts.sno=tso.sosno and tso.sono=tp.psosono and tso.souno=tu.uno and tp.ptype='Î´¸¶¿î' and tu.uno=?";
		Object[] obj={uno};
		return DBUtil.query(sql, ScenicOrderPay.class, obj);
	}
	
	public List<ScenicOrder> selectScenicOrder(int sono){
		
		String sql = "select * from tv_scenicorder where sono=?";
		Object[] objects = {sono};
		return DBUtil.query(sql, ScenicOrder.class, objects);
	}
	
	public int executeUpdateOrder(int sono){
		
		String sql = "delete tv_scenicorder where sono =?";
		Object[] objects = {sono};
		return DBUtil.executeUpdate(sql, objects);
	}
}
