package com.yxw.dao;

import com.yxw.bean.ShopCar;
import com.yxw.util.DBUtil;

public class Shopcardeletedao {
	public boolean DelShopcarByid(int sno){
		String sql="delete from tv_shopcar where sno=?";
		Object[] obj= new Object[]{sno};
		DBUtil.executeUpdate(sql, obj);
		return true;
	}
	
		
}
