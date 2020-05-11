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
import com.yxw.view.NoteView;

public class QueryNoteServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		 //获取游客编号
		int userId=5;
		User user=(User)request.getSession().getAttribute("user");
		String type=request.getParameter("type");
		if("sendNote".equals(type)){
			//创建数据访问类对象
			NoteDao noteDao =new NoteDao();
			//分页
			List<NoteView> list=noteDao.query();
			int totalPage=list.size()/PageData.pagesize;
			if(list.size()%PageData.pagesize!=0){
				totalPage=list.size()/PageData.pagesize+1;
			}
			int currentPage = 1;
			String strPage = request.getParameter("currentPage");
			if(null!=strPage&&!"".equals(strPage)){
				currentPage = Integer.parseInt(strPage);
			}	
			 //查询游记信息并绑定到请求作用域
		    request.setAttribute("tnList", noteDao.queryAll(currentPage));
		    //把当前页码绑定到request作用
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPage", totalPage);
		    //转发
		    request.getRequestDispatcher("qiantai/note/note_list.jsp").forward(request, response);
			
		}
        if("DraftNote".equals(type)){
        	//创建数据访问类对象
			NoteDao noteDao =new NoteDao();
			//分页
			List<MyNoteView> list=noteDao.queryNoteOfDraft(user.getUno());
			int totalPage=list.size()/PageData.pagesize;
			if(list.size()%PageData.pagesize!=0){
				totalPage=list.size()/PageData.pagesize+1;
			}
			int currentPage = 1;
			String strPage = request.getParameter("currentPage");
			if(null!=strPage&&!"".equals(strPage)){
				currentPage = Integer.parseInt(strPage);
			}	
			 //查询游记信息并绑定到请求作用域
		    request.setAttribute("DraftNoteList", noteDao.queryNoteOfDraftByPage(user.getUno(), currentPage));
		    //把当前页码绑定到request作用
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPage", totalPage);
		    //转发
		    request.getRequestDispatcher("qiantai/note/my_note2.jsp").forward(request, response);
        }
		
	}

}
