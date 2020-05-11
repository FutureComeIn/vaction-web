package com.yxw.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.yxw.bean.GoodPhoto;
import com.yxw.bean.Goods;
import com.yxw.util.DBUtil;

/**
 * 商品数据访问类
 * 
 * @author 暗藏疯
 * 
 */
public class GoodsDao {

	/**
	 * 修改商品信息以及商品图片信息
	 * @param sql
	 * @param pars
	 * @return
	 */
	public int updateGoods(Goods g,GoodPhoto gp) {
		int num=0;
		
		String sql = "update tv_goods set gname=?,gplace=?,gprice=?,gpoint=?,gheadphotopath=?,gdetailphotopath=?,gtype=? where gno=?";
		Object[] pars = new Object[] { g.getGname(), g.getGplace(), g.getGprice(),
				g.getGpoint(), g.getGheadphotopath(),
				g.getGdetailphotopath(),g.getGtype(),g.getGno() };
		num+=DBUtil.executeUpdate(sql, pars);
		num+=new GoodPhotoDao().updateGoodPhoto(gp);
		return num;
	}

	/**
	 * 根据商品编号查询商品信息
	 * 
	 * @param gno
	 * @return
	 */
	public List<Goods> queryGoodsByNno(int gno) {
		String sql = "select * from tv_goods where gno=?";
		Object[] obj = new Object[] { gno };
		return DBUtil.query(sql, Goods.class, obj);
	}

	/**
	 * 添加商品信息和商品图片信息
	 * 
	 * @param goods
	 * @param gp
	 * @return
	 */
	public void addGoods(Goods goods, GoodPhoto gp) {

		Connection con = DBUtil.getConn();
		PreparedStatement pt = null;
		ResultSet rs = null;
		try {
			con.setAutoCommit(false);
			int num = 0;

			// 插入商品信息
			//编号,名称,产地,价格,已成交量，购买可得积分数，商品主图，商品详情图,商品类别
			StringBuffer sql = new StringBuffer();
			sql.append("insert into tv_goods").append(
					" values(seq_goods_gno.nextval,?,?,?,?,?,?,?,?)");
			Object[] pars = new Object[] { goods.getGname(), goods.getGplace(),
					goods.getGprice(), 0, goods.getGpoint(),
					goods.getGheadphotopath(), goods.getGdetailphotopath(),
					goods.getGtype()};
			pt = con.prepareStatement(sql.toString());
			for (int i = 0; i < pars.length; i++) {
				pt.setObject(i + 1, pars[i]);
			}
			num += pt.executeUpdate();
			
			// 获取刚插入的商品信息的编号
			int gno=0;
			String sql2 = "select seq_goods_gno.currval from dual";
			pt = con.prepareStatement(sql2);
			rs = pt.executeQuery();
			if (rs.next()) {
				gno = rs.getInt(1);
			}
			
			// 插入商品图片信息
			String sql3 = "insert into tv_goodphoto values(seq_goodphoto_gpno.nextval,?,?,?,?,?,?)";
			Object[] pars2 = new Object[] {gno,gp.getGppath1(),
					gp.getGppath2(), gp.getGppath3(), gp.getGppath4(),
					gp.getGppath5() };
			pt = con.prepareStatement(sql3);
			for (int k = 0; k < pars2.length; k++) {
				pt.setObject(k + 1, pars2[k]);
			}
			num += pt.executeUpdate();
			if(num==2){
				con.commit();
			}
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
			}
		}
		
		DBUtil.closeAll(con, pt, rs);
	}

	/**
	 * 查询所有的商品信息
	 * 
	 * @return
	 */
	public List<Goods> queryAllGoods() {
		String sql = "select * from tv_goods order by gno";
		return DBUtil.query(sql, Goods.class, null);
	}

	/**
	 * 根据编号删除商品信息和商品图片信息
	 * 
	 * @param gno
	 * @return
	 */
	public int deleteGoodsByGno(int gno) {
		Connection con = DBUtil.getConn();
		PreparedStatement pt = null;
		ResultSet rs = null;
		int num = 0;
		try {
			con.setAutoCommit(false);
			
			// 删除商品图片信息
			String sql1 = "delete from tv_goodphoto where gpgno="+gno;
			pt = con.prepareStatement(sql1);
			num += pt.executeUpdate();
			
			// 删除商品信息
			String sql2 = "delete from tv_goods where gno="+gno;
			pt = con.prepareStatement(sql2.toString());
			num += pt.executeUpdate();
			
			if(num==2){
				con.commit();
			}
		} catch (SQLException e) {
			try {
				con.rollback();
			} catch (SQLException e1) {
			}
		}
		
		DBUtil.closeAll(con, pt, rs);
		return num;
		
	}
}
