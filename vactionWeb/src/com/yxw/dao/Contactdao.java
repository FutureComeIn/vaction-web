package com.yxw.dao;

import java.util.List;

import com.yxw.bean.Contact;
import com.yxw.util.DBUtil;

public class Contactdao {
	public List<Contact> queryByCuno(int cuno){
		String sql="select *from tv_contact where cuno="+cuno;
		List<Contact> contactList=DBUtil.query(sql, Contact.class,null);
		return contactList;
		
		
	}
}
