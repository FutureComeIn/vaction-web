package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.util.DBUtil;

public class OrderDelServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			int gono=Integer.parseInt(request.getParameter("gono"));
			System.out.println(gono);
			Object[] obj1={gono};
			String sql2="delete from tv_orderdetail where odgono=?";
			DBUtil.executeUpdate(sql2, obj1);
			
			String sql3="delete from tv_goodorder where gono=?";
			
			DBUtil.executeUpdate(sql3,obj1);
			response.sendRedirect(request.getContextPath()+"/qiantai/order/project_order.jsp	");
	}

}
