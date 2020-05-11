package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.User;
import com.yxw.dao.ScenicDao;
import com.yxw.dao.ScenicOrderDao;

public class DeleteSOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int sono = Integer.parseInt(request.getParameter("sono"));
		ScenicDao scenicDao = new ScenicDao();
		scenicDao.executeUpdateOrder(sono);
		ScenicOrderDao scenicOrderDao = new ScenicOrderDao();
		scenicOrderDao.executeUpdateOrder(sono);
		
		//¡¢º¥≤È—Ø
		User user=(User)request.getSession().getAttribute("user");
		int uno=user.getUno();
		request.setAttribute("scenicQueryOrder", scenicOrderDao.queryAllScenicOrder(uno));
		request.setAttribute("num", 1);
		
		
		request.getRequestDispatcher("/qiantai/order/scenic_order.jsp").forward(request,response);
	}

}
