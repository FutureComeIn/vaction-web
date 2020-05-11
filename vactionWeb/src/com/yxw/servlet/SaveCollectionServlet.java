package com.yxw.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Collection;
import com.yxw.bean.User;
import com.yxw.dao.CollectionDao;
import com.yxw.dao.NoteDao;

public class SaveCollectionServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
     this.doPost(request, response);
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        //获取收藏信息
		int cnno=Integer.parseInt(request.getParameter("cnno"));
		Collection collection=new Collection();
		collection.setCnno(cnno);
		
		User user=(User)request.getSession().getAttribute("user");
		collection.setCuno(user.getUno());
		
		CollectionDao collectionDao=new CollectionDao();
		collectionDao.save(collection);
		
		NoteDao noteDao=new NoteDao();
		noteDao.updateCollection(cnno);
		
		//重定向
		response.sendRedirect("QueryCollectionServlet?currentPage=1");
		
	}

}
