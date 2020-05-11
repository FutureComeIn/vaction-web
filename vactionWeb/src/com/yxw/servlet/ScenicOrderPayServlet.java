package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.User;
import com.yxw.dao.ScenicOrderDao;
import com.yxw.dao.ScenicPayDao;

public class ScenicOrderPayServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		int num = Integer.parseInt(request.getParameter("num"));
		String ppaymethod = request.getParameter("ppaymethod").trim();
		ppaymethod = new String(ppaymethod.getBytes("ISO-8859-1"),"utf-8");
		//System.out.println(ppaymethod);
		String ptype = request.getParameter("ptype").trim();
		ptype = new String(ptype.getBytes("ISO-8859-1"),"utf-8");
		//System.out.println(ptype);
		int psosono = Integer.parseInt(request.getParameter("psosono"));
		ScenicPayDao scenicPayDao = new ScenicPayDao();
		scenicPayDao.executeUpdatePay(ppaymethod, ptype, psosono);
		
		//¡¢º¥≤È—Ø
		ScenicOrderDao scenicOrderDao = new ScenicOrderDao();
		User user=(User)request.getSession().getAttribute("user");
		int uno=user.getUno();
		request.setAttribute("scenicQueryOrder", scenicOrderDao.queryAllScenicOrder(uno));
		request.setAttribute("num", 1);
		
		
		if(num==2){
			response.sendRedirect("index.jsp");
		}else if(num==1){
			request.getRequestDispatcher("/qiantai/order/scenic_order.jsp").forward(request, response);
		}
	}

}