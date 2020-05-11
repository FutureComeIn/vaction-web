package com.yxw.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.util.DBUtil;
import com.yxw.view.Orderview;

public class JiesuanServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cno= Integer.parseInt(request.getSession().getAttribute("cno").toString());	
		String str=request.getSession().getAttribute("str").toString();
		String sql="update tv_orderdetail set odpaymethod=?,odcno=?,odtype='已付款' where odno=?";
		String sql1="update tv_goods set gdealcount=? where gno=?";

		List<Orderview> orderviewList=(List<Orderview>) request.getSession().getAttribute("orderviewList");
		for(Orderview ov:orderviewList){
			int odno=ov.getOdno();
			int gno=ov.getGno();
			int gdealcount=ov.getGdealcount()+ov.getScount();
			System.out.println(odno);
			Object[] obj={str,cno,odno};
			
			Object[] obj1={gdealcount,gno};
			DBUtil.executeUpdate(sql, obj);
			DBUtil.executeUpdate(sql1, obj1);
		}
		System.out.println("支付成功！");
		response.sendRedirect(request.getContextPath()+"/QianQueryAllGoodsServlet");
		
		
	}

}