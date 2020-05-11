package com.yxw.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Contact;
import com.yxw.bean.User;
import com.yxw.dao.ScenicDao;
import com.yxw.dao.ScenicOrderDao;
import com.yxw.util.DBUtil;

public class Submit_orderServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		int sno=Integer.parseInt(request.getParameter("sno"));
		
		User user=(User)request.getSession().getAttribute("user");
		int uno=user.getUno();
		String sql="select *from tv_contact where cuno=? order by cno";
		Object[] obj={uno};
		List<Contact> clist=DBUtil.query(sql, Contact.class, obj);
		request.setAttribute("clist",clist);
		
		ScenicDao scenicDao = new ScenicDao();
		request.setAttribute("Senic2Data", scenicDao.queryScenicsBySno(sno).get(0));
		
		request.getRequestDispatcher("/qiantai/order/submit_orders.jsp").forward(request, response);
		
		
	}

}