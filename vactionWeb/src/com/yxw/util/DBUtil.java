
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
	//加载驱动
	static{
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO
			e.printStackTrace();
		}
	}
	//连接数据库
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
	//关闭连接
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
	//通用增删改
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
	
	//通用查询
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
				//利用无参的构造方法创造对象
				T t=cls.newInstance();
				//利用set方法赋值
				Field[] field=cls.getDeclaredFields();//获取该类所有属性对象
				for(int i=0;i<field.length;i++){
					String fieldName=field[i].getName();//得到属性名
					//拼接得到该属性的set方法名
					String methodName="set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
					//通过方法名和属性的类型获得set方法对象
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
					method.invoke(t,value); //真正将属性值赋给这个类（t）了 
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
	
	
	//测试一下  两个方法方法名相同，但属性不同 是正确的
	public void get(int a){
		
	}
	public void get(String a){
		
	}
	
	
	public static void main(String[] args) {
		System.out.println(DBUtil.getConn());
	}


}
