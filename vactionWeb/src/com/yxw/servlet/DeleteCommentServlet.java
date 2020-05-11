package com.yxw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.dao.CommentDao;

public class DeleteCommentServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       //ªÒ»°∆¿¬€±‡∫≈
		int no=Integer.parseInt(request.getParameter("cno"));
		CommentDao commentDao=new CommentDao();
		commentDao.delete(no);
		
		request.getRequestDispatcher("/QueryCommentByNoServlet?currentPage=1").forward(request, response);
		
	}

}
