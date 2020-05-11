package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.dao.ScenicDao;
import com.yxw.dao.ScenicOrderDao;
import com.yxw.dao.ScenicPayDao;

public class Confirm_order_scenicServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int souno = Integer.parseInt(request.getParameter("uno"));
		int sosno = Integer.parseInt(request.getParameter("sosno"));
		int socount = Integer.parseInt(request.getParameter("socount"));
		int soprice = Integer.parseInt(request.getParameter("soprice").substring(0, request.getParameter("soprice").indexOf(".")));
		
		String socontactname = request.getParameter("socontactname");
		socontactname=new String(socontactname.getBytes("ISO-8859-1"),"UTF-8");
		//System.out.println(socontactname);
		
		String socontactmobile = request.getParameter("socontactmobile");
		String sodate = request.getParameter("sodate");
		
		ScenicDao scenicDao = new ScenicDao();
		ScenicOrderDao cosDao = new ScenicOrderDao();
		cosDao.executeUpdate(souno, sosno, socount, soprice, socontactname, socontactmobile, sodate);
		ScenicPayDao scenicPayDao = new ScenicPayDao();
		scenicPayDao.executeUpdate(cosDao.selectCurentOrders().get(0).getSono(), socount*soprice, "Ö§¸¶±¦Ö§¸¶", "Î´¸¶¿î");
		//System.out.println(cosDao.selectCurentOrders().get(0));
		
		request.setAttribute("Senic3Data", scenicDao.queryScenicsBySno(sosno).get(0));
		request.setAttribute("Comfirm_order_scenic",cosDao.selectCurentOrders().get(0));
		
		request.getRequestDispatcher("/qiantai/order/confirm_order_scenic.jsp?num=2").forward(request, response);
		
		
	}

}
