package com.yxw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Comment;
import com.yxw.bean.User;
import com.yxw.dao.CommentDao;

public class SaveCommentServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //获取评论内容
		request.setCharacterEncoding("UTF-8");
		int cobjectno=Integer.parseInt(request.getParameter("noteNo"));
		String content=request.getParameter("comment");
		
		Comment comment=new Comment();
		comment.setCcontent(content);
		comment.setCobjectno(cobjectno);
		
		User user=(User)request.getSession().getAttribute("user");
		comment.setCuno(user.getUno());
		
		
		CommentDao commentDao=new CommentDao();
		commentDao.save(comment);
		
		//重定向
		response.sendRedirect("queryContentOfNoteServlet?nno="+cobjectno);
	}

}
