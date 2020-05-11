package com.yxw.dao;

import java.util.List;

import com.yxw.bean.Goods;
import com.yxw.util.DBUtil;

public class GnoSearchdao {
	public Goods queryByGno(int gno){
		String sql="select *from tv_goods where gno=?";
		Object[] obj=new Object[]{gno};
		
		Goods good=DBUtil.query(sql,Goods.class, obj).get(0);
		return good;
	}
}
