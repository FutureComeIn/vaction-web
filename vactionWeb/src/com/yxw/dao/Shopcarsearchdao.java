package com.yxw.dao;

import com.yxw.bean.ShopCar;
import com.yxw.util.DBUtil;

public class Shopcarsearchdao {
	public ShopCar queryBySno(int sno){
		String sql="select *from tv_shopcar where sno="+sno;
		ShopCar shopcar=DBUtil.query(sql, ShopCar.class,null).get(0);
		return shopcar;
	}
	
}
