package com.yxw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.User;
import com.yxw.dao.CommentDao;
import com.yxw.dao.NoteDao;

public class QueryContentOfNoteServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       //获取传递过来的游记编号
		int noteNo=Integer.parseInt(request.getParameter("nno"));
		//创建数据访问类对象
		NoteDao noteDao=new NoteDao();
		CommentDao commentDao=new CommentDao();
		//查询指定游记的内容并绑定到请求作用域
		request.setAttribute("ncontent", noteDao.queryContentByNoteId(noteNo));
		 request.setAttribute("comList", commentDao.queryAll(noteNo));
		//绑定游记编号到请求作用域
		request.setAttribute("noteNo", noteNo);
		//转发
		request.getRequestDispatcher("qiantai/note/note.jsp").forward(request, response);
		
		
	}

}
