package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ZfServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
    	request.setCharacterEncoding("utf-8");
    	System.out.println("请求成功!");
    	int n=Integer.parseInt(request.getParameter("n"));
    	String str="";
    	if(n==1){
    		str="支付宝支付";
    	}else if(n==2){
    		str="微信支付";
    		
    	}
    	request.getSession().setAttribute("str", str);
    	response.getWriter().write(str+"方式支付确认！");

	}

}
