package com.yxw.dao;

import java.util.List;

import com.yxw.bean.TravelNote;
import com.yxw.util.DBUtil;

/**
 * �μ����ݷ�����
 * @author ���ط�
 *
 */
public class TravelNoteDao {
	
	/**
	 * ��ѯ���е��μ���Ϣ
	 * @return
	 */
	public List<TravelNote> queryAllTravelNote(){
		String sql = "select * from tv_note";
		return DBUtil.query(sql, TravelNote.class, null);
	}
	
	/**
	 * �����μǱ�Ų�ѯ�μ���Ϣ
	 * @param nno
	 * @return
	 */
	public List<TravelNote> queryTravelNoteByNno(int nno){
		String sql = "select * from tv_note where nno=?";
		Object[] obj = new Object[]{nno};
		return DBUtil.query(sql, TravelNote.class, obj);
	}
	
	/**
	 * ���ݱ��ɾ���μ���Ϣ
	 * @param nno
	 * @return
	 */
	public int deleteTravelNoteByNno(int nno){
		String sql = "delete from tv_note where nno=?";
		Object[] pars = new Object[]{nno};
		return DBUtil.executeUpdate(sql, pars);
	}
}
