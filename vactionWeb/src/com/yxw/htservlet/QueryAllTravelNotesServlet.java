package com.yxw.htservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.view.TravelNote;
import com.yxw.viewdao.TravelNoteDao;



public class QueryAllTravelNotesServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<TravelNote> travelNoteList = new TravelNoteDao().queryAllTravelNote();
		request.setAttribute("travelNoteList", travelNoteList);
		request.getRequestDispatcher("/houtai/travelNotes/travelNotes_management.jsp").forward(request, response);
	}

}
