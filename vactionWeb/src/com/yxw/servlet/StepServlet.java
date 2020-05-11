package com.yxw.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Goods;
import com.yxw.dao.GnoSearchdao;
import com.yxw.dao.TypeSearchAlldao;

public class StepServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			List<Goods> goodList=new TypeSearchAlldao().queryByType();
			request.getSession().setAttribute("goodList",goodList);
			int gno=Integer.parseInt(request.getParameter("gno"));
			Goods good=new GnoSearchdao().queryByGno(gno);
			request.getSession().setAttribute("good", good);
			request.getRequestDispatcher("/qiantai/mall/project.jsp").forward(request, response);
	}

}

