package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QrServlet extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	String str=(String) request.getSession().getAttribute("str");
    	int cno=Integer.parseInt((String) request.getSession().getAttribute("cno"));
    	if("".equals(str)||str==null){
    		response.getWriter().write("请选择您的地址！");
    	}
    	if(cno==0){
    		response.getWriter().write("请选择您的付款方式！");
    		
    	}
	}

}