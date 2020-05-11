package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Goods;
import com.yxw.util.DBUtil;

public class DanjiesuanServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	int gono= Integer.parseInt(request.getSession().getAttribute("gono").toString());
    	int num= Integer.parseInt(request.getSession().getAttribute("num").toString());
    	int total= Integer.parseInt(request.getSession().getAttribute("total").toString());
		int cno= Integer.parseInt(request.getSession().getAttribute("cno").toString());	
		String str=request.getSession().getAttribute("str").toString();
		String sql="update tv_orderdetail set odpaymethod=?,odcno=?,odtype='已付款' where odgono=?";
		String sql1="update tv_goods set gdealcount=? where gno=?";
		Object[] obj={str,cno,gono};
		DBUtil.executeUpdate(sql, obj);
		Goods good =(Goods)request.getSession().getAttribute("good");
		int gdealcount=good.getGdealcount()+num;
		Object[] obj1={gdealcount,good.getGno()};
		DBUtil.executeUpdate(sql1, obj1);
		System.out.println("支付成功！");
		response.sendRedirect(request.getContextPath()+"/QianQueryAllGoodsServlet");

	}

}
