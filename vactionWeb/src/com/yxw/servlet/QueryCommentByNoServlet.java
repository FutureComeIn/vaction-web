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
import com.yxw.dao.CommentDao;
import com.yxw.view.MyCommentView;
import com.yxw.view.MyNoteView;

public class QueryCommentByNoServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
      this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user=(User)request.getSession().getAttribute("user");
		//创建数据访问类对象
		CommentDao commentDao=new CommentDao();
		
		//分页
		List<MyCommentView> list=commentDao.queryCommentByNuno(user.getUno());
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
		request.setAttribute("MycommentList", commentDao.queryCommentByPage(user.getUno(), currentPage));
		//把当前页码绑定到request作用
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		//转发
		request.getRequestDispatcher("qiantai/note/note_comments.jsp").forward(request, response);
		
	}

}
