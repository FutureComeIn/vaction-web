package com.yxw.htservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.dao.GoodsDao;

public class DeleteGoodsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num = new GoodsDao().deleteGoodsByGno(
				Integer.parseInt(request.getParameter("gno")));
		System.out.println("num="+num);
		if(num>0){
			request.setAttribute("message","É¾³ý³É¹¦£¡");
		}else{
			request.setAttribute("message","É¾³ýÊ§°Ü£¡");
		}
		request.setAttribute("path","queryAllGoodsServlet");
		request.getRequestDispatcher("common/success.jsp").forward(request,response);
	}

}
