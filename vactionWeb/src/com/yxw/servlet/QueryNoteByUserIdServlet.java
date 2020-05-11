package com.yxw.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.PageData;
import com.yxw.bean.User;
import com.yxw.dao.NoteDao;
import com.yxw.view.MyNoteView;

public class QueryNoteByUserIdServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
     this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user=(User)request.getSession().getAttribute("user");
		//�������ݷ��������
		NoteDao noteDao=new NoteDao();
		//��ҳ
		List<MyNoteView> list=noteDao.queryNoteByNuno(user.getUno());
		int totalPage=list.size()/PageData.pagesize;
		if(list.size()%PageData.pagesize!=0){
			totalPage=list.size()/PageData.pagesize+1;
		}
		int currentPage = 1;
		String strPage = request.getParameter("currentPage");
		if(null!=strPage&&!"".equals(strPage)){
			currentPage = Integer.parseInt(strPage);
		}	
		//��ѯ�μǲ��󶨵�����������
		request.setAttribute("MynoteList", noteDao.queryNoteByPage(user.getUno(), currentPage));
		//�ѵ�ǰҳ��󶨵�request����
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		//���μǱ�ŵ�����������
		//request.setAttribute("userId", userId);
		//ת��
		request.getRequestDispatcher("qiantai/note/my_note.jsp").forward(request, response);
		
		
	}

}
