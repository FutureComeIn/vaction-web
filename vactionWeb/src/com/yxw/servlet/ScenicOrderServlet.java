package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.User;
import com.yxw.dao.ScenicOrderDao;

public class ScenicOrderServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		User user=(User)request.getSession().getAttribute("user");
		int uno=user.getUno();
		
		request.setCharacterEncoding("utf-8");
		ScenicOrderDao scenicOrderDao = new ScenicOrderDao();
		//System.out.println(scenicOrderDao.queryAllScenicOrder());
		request.setAttribute("scenicQueryOrder", scenicOrderDao.queryAllScenicOrder(uno));
		request.setAttribute("num", 1);
		//request.setAttribute("scenicQueryOrder", );
		request.getRequestDispatcher("/qiantai/order/scenic_order.jsp").forward(request, response);
	}

}
