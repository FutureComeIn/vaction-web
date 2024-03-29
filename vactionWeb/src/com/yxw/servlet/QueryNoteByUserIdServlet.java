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
		//创建数据访问类对象
		NoteDao noteDao=new NoteDao();
		//分页
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
		//查询游记并绑定到请求作用域
		request.setAttribute("MynoteList", noteDao.queryNoteByPage(user.getUno(), currentPage));
		//把当前页码绑定到request作用
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		//绑定游记编号到请求作用域
		//request.setAttribute("userId", userId);
		//转发
		request.getRequestDispatcher("qiantai/note/my_note.jsp").forward(request, response);
		
		
	}

}
