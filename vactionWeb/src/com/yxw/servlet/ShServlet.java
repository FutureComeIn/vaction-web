package com.yxw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ShServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	System.out.println("请求成功!");
    	int cno=Integer.parseInt(request.getParameter("cno"));
    	request.getSession().setAttribute("cno", cno);
    	response.getWriter().write("地址确认！");
	}

}

