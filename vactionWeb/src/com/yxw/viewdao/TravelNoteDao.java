package com.yxw.viewdao;

import java.util.List;

import com.yxw.util.DBUtil;
import com.yxw.view.TravelNote;

/**
 * �μ���ͼ���ݷ�����
 * @author ���ط�
 *
 */
public class TravelNoteDao {
	
	/**
	 * ��ѯ���е��μ���Ϣ
	 * @return
	 */
	public List<TravelNote> queryAllTravelNote(){
		String sql = "select n.*,u.uname from tv_note  n join tv_user u on n.nuno=u.uno";
		return DBUtil.query(sql, TravelNote.class, null);
	}
	
	/**
	 * �����μǱ�Ų�ѯ�μ���Ϣ
	 * @param nno
	 * @return
	 */
	public List<TravelNote> queryTravelNoteByNno(int nno){
		String sql = "select n.*,u.uname from tv_note  n join tv_user u on n.nuno=u.uno where nno=?";
		Object[] obj = new Object[]{nno};
		return DBUtil.query(sql, TravelNote.class, obj);
	}
}
