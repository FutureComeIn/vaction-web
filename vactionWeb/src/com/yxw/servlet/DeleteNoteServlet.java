package com.yxw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.dao.CollectionDao;
import com.yxw.dao.CommentDao;
import com.yxw.dao.NoteDao;

public class DeleteNoteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
   this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
         //获取游记编号
		 int noteNo=Integer.parseInt(request.getParameter("noteNo"));
		new CommentDao().deleteByCobjectno(noteNo);
		new CollectionDao().deleteByCnno(noteNo);
		 String type=request.getParameter("type");
		 NoteDao noteDao=new NoteDao();
		 noteDao.delete(noteNo);	 
		 //转发
		 if("deleteNote".equals(type)){
		 request.getRequestDispatcher("/QueryNoteByUserIdServlet").forward(request, response);
		 }
		 if("deleteDraft".equals(type)){
			 request.getRequestDispatcher("/QueryNoteServlet?type=DraftNote&currentPage=1").forward(request, response); 
		 }
		 
	}

}
