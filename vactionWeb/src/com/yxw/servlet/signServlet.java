package com.yxw.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.User;
import com.yxw.util.DBUtil;

public class signServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//response.setContentType("text/html");
		this.doPost(request, response);

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//对登录成功后要返回的URL界面操作
		String url=request.getParameter("url2");
		System.out.println("signServlet:"+url);
		
		//给当前用户添加积分20
		String uno=request.getParameter("uno");
		String sql="update tv_user set upoint=upoint+20 where uno=?";
		Object[] obj={Integer.parseInt(uno)};
		DBUtil.executeUpdate(sql, obj);
		
		String sql1="select *from tv_user where uno=?";
		List<User> ulist=DBUtil.query(sql1, User.class, obj);
		request.getSession().setAttribute("user", ulist.get(0));
		
	
		request.getSession().setAttribute("sign", "yes");

		request.getRequestDispatcher(url).forward(request,response);
	}

}
