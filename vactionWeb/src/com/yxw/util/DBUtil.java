
package com.yxw.util;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;



public class DBUtil {
	//��������
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO
			e.printStackTrace();
		}
	}
	//�������ݿ�
	public static Connection getConn(){
		Connection con=null;
		try {
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl",
												"vaction",
												"123456");
		} catch (SQLException e) {
			// TODO 
			e.printStackTrace();
		}
		return con;
	}
	//�ر�����
	public static void closeAll(Connection con,Statement st,ResultSet rs){
	
			try {	
				if(con!=null){
					con.close();
				}
				if(st!=null){
					st.close();
				}
				if(rs!=null){
					rs.close();
				}
			} catch (SQLException e) {
				// TODO
				e.printStackTrace();
			}
		
	}
	//ͨ����ɾ��
	public static int executeUpdate(String sql,Object[] pars){
		int count=0;
		Connection con=getConn();
		PreparedStatement pst=null;
		try {
			pst=con.prepareStatement(sql);
			if(pars!=null){
				for(int i=0;i<pars.length;i++){
					pst.setObject(i+1,pars[i]);
				}
				count=pst.executeUpdate();
			}
		} catch (SQLException e) {
			// TODO
			e.printStackTrace();
		}finally{
			closeAll(con,pst,null);
		}
		return count;
	}
	
	//ͨ�ò�ѯ
	public static <T> List<T> query(String sql,Class<T> cls,Object...parsObj){
		List<T> list=new ArrayList<T>();
		Connection con=getConn();
		PreparedStatement pst=null;
		ResultSet rs=null;
		try {
			pst=con.prepareStatement(sql);
			if(parsObj!=null){
				  for(int i=0;i<parsObj.length;i++){
					   pst.setObject(i+1, parsObj[i]); 
				   }
			}
			rs=pst.executeQuery();
			while(rs.next()){
				//�����޲εĹ��췽���������
				T t=cls.newInstance();
				//����set������ֵ
				Field[] field=cls.getDeclaredFields();//��ȡ�����������Զ���
				for(int i=0;i<field.length;i++){
					String fieldName=field[i].getName();//�õ�������
					//ƴ�ӵõ������Ե�set������
					String methodName="set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
					//ͨ�������������Ե����ͻ��set��������
					Method method=cls.getDeclaredMethod(methodName,field[i].getType());
					
					Object value=null;
					
					if(field[i].getType().equals(int.class)){
						value=rs.getInt(fieldName);
					}
					if(field[i].getType().equals(String.class)){
						value=rs.getString(fieldName);
					}
					if(field[i].getType().equals(double.class)){
						value=rs.getDouble(fieldName);
					}
					if(field[i].getType().equals(Date.class)){
						value=rs.getDate(fieldName);
					}
					method.invoke(t,value); //����������ֵ��������ࣨt���� 
				}
				list.add(t);
			}
			//System.out.println(list);
		} catch (Exception e) {
			// TODO 
			e.printStackTrace();
		}finally{
			closeAll(con,pst,rs);
		}
		return list;
		
	}
	
	
	//����һ��  ����������������ͬ�������Բ�ͬ ����ȷ��
	public void get(int a){
		
	}
	public void get(String a){
		
	}
	
	
	public static void main(String[] args) {
		System.out.println(DBUtil.getConn());
	}


}
