package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.dao.ScenicDao;
import com.yxw.dao.ScenicOrderDao;

public class PayScenicOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int sono = Integer.parseInt(request.getParameter("sono"));
		int sosno= Integer.parseInt(request.getParameter("sosno"));
		ScenicDao scenicDao = new ScenicDao();
		ScenicOrderDao scenicOrderDao = new ScenicOrderDao();
//		System.out.println(scenicDao.queryScenicsBySno(sosno));
//		System.out.println(scenicOrderDao	.selectScenicOrder(sono));
		request.setAttribute("Senic3Data", scenicDao.queryScenicsBySno(sosno).get(0));
		request.setAttribute("Comfirm_order_scenic", scenicOrderDao.selectScenicOrder(sono).get(0));
		request.getRequestDispatcher("/qiantai/order/confirm_order_scenic.jsp?num=1").forward(request, response);
	}

}