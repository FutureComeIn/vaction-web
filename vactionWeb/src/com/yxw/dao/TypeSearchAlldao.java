package com.yxw.dao;

import java.util.List;

import com.yxw.bean.Goods;
import com.yxw.util.DBUtil;

public class TypeSearchAlldao {
	public List<Goods> queryByType(){
		String sql="select * from tv_goods";		
		List<Goods> goodsList=DBUtil.query(sql, Goods.class,null);
		System.out.println(goodsList.size());
		return goodsList;
	}
}
