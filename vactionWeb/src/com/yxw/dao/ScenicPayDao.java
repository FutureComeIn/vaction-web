package com.yxw.dao;

import com.yxw.util.DBUtil;

public class ScenicPayDao {
	
	public int executeUpdate(int psosono,int ppaymoney,String ppaymethod,String ptype){
		
		String sql = "insert into tv_pay values(seq_pay_pno.nextval,?,?,?,?)";
		Object[] obj = {psosono,ppaymoney,ppaymethod,ptype};
		return DBUtil.executeUpdate(sql, obj);
	}
	
	public int executeUpdatePay(String ppaymethod,String ptype,int psosono){
		
		String sql = "update tv_pay set ppaymethod=?,ptype=? where psosono=?";
		Object[] obj = {ppaymethod,ptype,psosono};
		return DBUtil.executeUpdate(sql, obj);
	}
}
