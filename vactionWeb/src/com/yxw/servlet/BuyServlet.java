package com.yxw.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Goods;
import com.yxw.bean.User;
import com.yxw.util.DBUtil;

public class BuyServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	Connection con=DBUtil.getConn();
    	PreparedStatement pt=null;
    	ResultSet rs=null;
    	Goods good =(Goods)request.getSession().getAttribute("good");
    	int num=Integer.parseInt(request.getParameter("scount"));
		int total=Integer.parseInt(request.getParameter("sprice"));
		total=total+5;
		request.getSession().setAttribute("num", num);
		request.getSession().setAttribute("total", total);
    	User user=(User)request.getSession().getAttribute("user");
    	String sql="insert into tv_goodorder values(seq_goodorder_gono.nextval,?,?,?)";
    	java.sql.Timestamp time=new java.sql.Timestamp(new java.util.Date().getTime());
    	request.getSession().setAttribute("time", time);
    	Object[] obj={user.getUno(),total,time};
    	String sql1="insert into tv_orderdetail values(seq_orderdetail_odno.nextval,?,?,?,?,?,null,1,'Î´¸¶¿î')";
    	int gono=0;
		String sql_2="select seq_goodorder_gono.nextval from dual";
		String sql2="select seq_goodorder_gono.currval-1 from dual";
		try {
			pt =con.prepareStatement(sql_2);
			rs =pt.executeQuery();
			
			pt =con.prepareStatement(sql2);
			rs =pt.executeQuery();
			if(rs.next()){
				gono=rs.getInt(1);
				System.out.println(gono);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getSession().setAttribute("gono", gono);
		Object[] obj1={gono,good.getGno(),num,good.getGprice(),total};
		int n=DBUtil.executeUpdate(sql1, obj1);
    	int m=DBUtil.executeUpdate(sql, obj);
    	response.sendRedirect(request.getContextPath()+"/qiantai/order/Buy.jsp?scount="+num+"&sprice="+total);
	}

}
