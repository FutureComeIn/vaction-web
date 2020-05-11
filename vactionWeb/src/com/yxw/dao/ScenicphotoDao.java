package com.yxw.dao;

import java.util.List;

import com.yxw.bean.ScenicPhoto;
import com.yxw.util.DBUtil;

public class ScenicphotoDao {
	
	public List<ScenicPhoto> queryScenicPhotos(int spsno){
		String sql="select * from tv_scenicphoto where spsno=?";
		Object[] obj = {spsno};
		return DBUtil.query(sql, ScenicPhoto.class, obj);
	}
}
