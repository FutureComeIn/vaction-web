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
       //��ȡ���ݹ������μǱ��
		int noteNo=Integer.parseInt(request.getParameter("nno"));
		//�������ݷ��������
		NoteDao noteDao=new NoteDao();
		CommentDao commentDao=new CommentDao();
		//��ѯָ���μǵ����ݲ��󶨵�����������
		request.setAttribute("ncontent", noteDao.queryContentByNoteId(noteNo));
		 request.setAttribute("comList", commentDao.queryAll(noteNo));
		//���μǱ�ŵ�����������
		request.setAttribute("noteNo", noteNo);
		//ת��
		request.getRequestDispatcher("qiantai/note/note.jsp").forward(request, response);
		
		
	}

}
