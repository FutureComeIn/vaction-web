package com.yxw.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.TravelNote;
import com.yxw.dao.NoteDao;

public class XiugaiNoteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));
		TravelNote travelNote = new NoteDao().queryNoteByNoteId(nno).get(0);
		request.setAttribute("travelNote", travelNote);
		request.getRequestDispatcher("/qiantai/note/xiugai_note.jsp").forward(request, response);
	}

}
