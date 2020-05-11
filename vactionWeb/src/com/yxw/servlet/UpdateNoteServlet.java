package com.yxw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.User;
import com.yxw.dao.NoteDao;

public class UpdateNoteServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
     this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    //获取游记编号
		int noteNo=Integer.parseInt(request.getParameter("noteNo"));
		User user=(User)request.getSession().getAttribute("user");
		 NoteDao noteDao=new NoteDao();
		 noteDao.update(noteNo);
		 noteDao.updateUpoint(user.getUno());
		 request.getRequestDispatcher("/QueryNoteServlet?type=sendNote&currentPage=1").forward(request, response); 
		
	}

}
