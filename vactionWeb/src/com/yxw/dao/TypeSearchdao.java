package com.yxw.dao;


import java.util.List;

import com.yxw.bean.Goods;
import com.yxw.util.DBUtil;

public class TypeSearchdao {
	public List<Goods> queryByType(String gtype){
		String sql="select *from tv_goods where gtype=?";
		Object[] obj=new Object[]{gtype};
		
		List<Goods> goodsList=(List<Goods>)DBUtil.query(sql, Goods.class,obj);
		System.out.println(goodsList.size());
		return goodsList;
	}

}
