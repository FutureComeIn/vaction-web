package com.yxw.dao;

import java.util.List;

import com.yxw.bean.GoodPhoto;
import com.yxw.bean.Goods;
import com.yxw.util.DBUtil;

/**
 * ��ƷͼƬ������
 * @author ���ط�
 *
 */
public class GoodPhotoDao {

	
	
	public int updateGoodPhoto(GoodPhoto gp) {
		String sql = "update tv_goodphoto set gppath1=?,gppath2=?,gppath3=?,gppath4=?,gppath5=? where gpno=?";
		Object[] pars = new Object[]{gp.getGppath1(),gp.getGppath2(),gp.getGppath3(),gp.getGppath4(),gp.getGppath5(),gp.getGpno()};
		return DBUtil.executeUpdate(sql, pars);
	}
	
	/**
	 * ������Ʒ��Ų�ѯ��ƷͼƬ��Ϣ
	 * @param gpgno
	 * @return
	 */
	public List<GoodPhoto> queryGoodPhotoByPgno(int gpgno) {
		String sql = "select * from tv_goodphoto where gpgno=?";
		return DBUtil.query(sql, GoodPhoto.class, new Object[]{gpgno});
	}
}
