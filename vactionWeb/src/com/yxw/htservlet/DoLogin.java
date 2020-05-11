package com.yxw.htservlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.User;
import com.yxw.util.DBUtil;

public class DoLogin extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String type=request.getParameter("type");
		System.out.println("Dologin:"+type);
		
		 request.setCharacterEncoding("utf-8");
		 
		 if("login".equals(type)){
			 String userName=request.getParameter("userName");
	         String userPwd=request.getParameter("userPwd");
	         String sql="select * from tv_user where uname=? and upw=?";
			 Object[] obj={userName,userPwd};
			 List<User> ulist=DBUtil.query(sql, User.class, obj);
			 if(ulist.size()==0){
				 response.getWriter().write("error");
			 }else{
				 request.getSession().setAttribute("user",ulist.get(0));
				 response.getWriter().write("ok"); 
			 }
		 }
		 if("sign".equals(type)){
			 response.getWriter().write("ok"); 
		 }
         
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doGet(request, response);
	}

}
