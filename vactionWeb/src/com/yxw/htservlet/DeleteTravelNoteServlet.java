package com.yxw.htservlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.dao.CollectionDao;
import com.yxw.dao.CommentDao;
import com.yxw.dao.TravelNoteDao;

public class DeleteTravelNoteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno").trim());
		new CommentDao().deleteByCobjectno(nno);
		new CollectionDao().deleteByCnno(nno);
		
		int num = new TravelNoteDao().deleteTravelNoteByNno(nno);
		if(num>0){
			request.setAttribute("message","É¾³ý³É¹¦£¡");
			request.setAttribute("path",request.getContextPath()+"/queryAllTravelNotesServlet");
			request.getRequestDispatcher("/common/success.jsp").forward(request, response);
		}else{
			request.setAttribute("message","É¾³ýÊ§°Ü£¡");
			request.setAttribute("path",request.getContextPath()+"/queryAllTravelNotesServlet");
			request.getRequestDispatcher("/common/success.jsp").forward(request, response);
		}
	}

}
