package com.yxw.viewdao;

import java.util.List;

import com.yxw.util.DBUtil;
import com.yxw.view.TravelNote;

/**
 * 游记视图数据访问类
 * @author 暗藏疯
 *
 */
public class TravelNoteDao {
	
	/**
	 * 查询所有的游记信息
	 * @return
	 */
	public List<TravelNote> queryAllTravelNote(){
		String sql = "select n.*,u.uname from tv_note  n join tv_user u on n.nuno=u.uno";
		return DBUtil.query(sql, TravelNote.class, null);
	}
	
	/**
	 * 根据游记编号查询游记信息
	 * @param nno
	 * @return
	 */
	public List<TravelNote> queryTravelNoteByNno(int nno){
		String sql = "select n.*,u.uname from tv_note  n join tv_user u on n.nuno=u.uno where nno=?";
		Object[] obj = new Object[]{nno};
		return DBUtil.query(sql, TravelNote.class, obj);
	}
}
