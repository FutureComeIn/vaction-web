package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.User;
import com.yxw.dao.ScenicOrderDao;

public class ScenicOrderTypeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String i = request.getParameter("i");
		ScenicOrderDao scenicOrderDao = new ScenicOrderDao();
		
		User user=(User)request.getSession().getAttribute("user");
		int uno=user.getUno();
		
		if(i.equals("abc")){
			
			//System.out.println(scenicOrderDao.queryAllScenicOrder().size());
			request.setAttribute("scenicQueryOrder", scenicOrderDao.queryAllScenicOrder(uno));
			request.setAttribute("num", 1);
			request.getRequestDispatcher("/qiantai/order/scenic_order.jsp").forward(request, response);
		}
		if(i.equals("def")){
			//System.out.println(scenicOrderDao.queryNoPayScenicOrder().size());
			request.setAttribute("scenicQueryOrder", scenicOrderDao.queryNoPayScenicOrder(uno));
			request.setAttribute("num", 2);
			request.getRequestDispatcher("/qiantai/order/scenic_order.jsp").forward(request, response);
			
		}
		
	}

}