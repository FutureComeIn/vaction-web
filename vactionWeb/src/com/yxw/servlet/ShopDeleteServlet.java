package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.dao.Shopcardeletedao;

public class ShopDeleteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			int sno=Integer.parseInt(request.getParameter("sno"));
			new Shopcardeletedao().DelShopcarByid(sno);
			response.sendRedirect(request.getContextPath()+"/qiantai/order/shop_car.jsp");
	}

}
