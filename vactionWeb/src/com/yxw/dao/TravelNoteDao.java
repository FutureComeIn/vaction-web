package com.yxw.dao;

import java.util.List;

import com.yxw.bean.TravelNote;
import com.yxw.util.DBUtil;

/**
 * 游记数据访问类
 * @author 暗藏疯
 *
 */
public class TravelNoteDao {
	
	/**
	 * 查询所有的游记信息
	 * @return
	 */
	public List<TravelNote> queryAllTravelNote(){
		String sql = "select * from tv_note";
		return DBUtil.query(sql, TravelNote.class, null);
	}
	
	/**
	 * 根据游记编号查询游记信息
	 * @param nno
	 * @return
	 */
	public List<TravelNote> queryTravelNoteByNno(int nno){
		String sql = "select * from tv_note where nno=?";
		Object[] obj = new Object[]{nno};
		return DBUtil.query(sql, TravelNote.class, obj);
	}
	
	/**
	 * 根据编号删除游记信息
	 * @param nno
	 * @return
	 */
	public int deleteTravelNoteByNno(int nno){
		String sql = "delete from tv_note where nno=?";
		Object[] pars = new Object[]{nno};
		return DBUtil.executeUpdate(sql, pars);
	}
}
