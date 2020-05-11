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
import com.yxw.dao.CollectionDao;
import com.yxw.dao.CommentDao;
import com.yxw.view.MyCollectionView;
import com.yxw.view.MyCommentView;

public class QueryCollectionServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
      this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user=(User)request.getSession().getAttribute("user");
		//�������ݷ��������
		CollectionDao collectionDao=new CollectionDao();
		
		//��ҳ
		List<MyCollectionView> list=collectionDao.queryCollectionByNuno(user.getUno());
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
		request.setAttribute("MycollectionList", collectionDao.queryCollectionByPage(user.getUno(), currentPage));
		//�ѵ�ǰҳ��󶨵�request����
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		//ת��
		request.getRequestDispatcher("qiantai/user/collection_list.jsp").forward(request, response);
		
	}

}
