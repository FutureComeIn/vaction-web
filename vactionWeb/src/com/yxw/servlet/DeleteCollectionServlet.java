package com.yxw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.dao.CollectionDao;
import com.yxw.dao.CommentDao;

public class DeleteCollectionServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//ªÒ»° ’≤ÿ±‡∫≈
		int no=Integer.parseInt(request.getParameter("cno"));
		
		CollectionDao collectionDao=new CollectionDao();
		collectionDao.delete(no);
		
		request.getRequestDispatcher("/QueryCollectionServlet?currentPage=1").forward(request, response);
		
		
	}

}
