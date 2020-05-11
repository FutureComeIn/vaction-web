package com.yxw.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Goods;
import com.yxw.dao.TypeSearchdao;

public class typeServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			String gtype=request.getParameter("gtype");
			System.out.println(gtype);
			if(gtype.equals("all")){
				request.getRequestDispatcher("/qiantai/mall/mall_list.jsp").forward(request, response);
			}
			
			if(gtype.equals("Ncp")){
				List<Goods> NcpList=new TypeSearchdao().queryByType("农产品");
				request.getSession().setAttribute("NcpList", NcpList);
				request.getRequestDispatcher("/qiantai/mall/Ncp.jsp").forward(request, response);
			}
			if(gtype.equals("Sg")){
				List<Goods> SgList=new TypeSearchdao().queryByType("水果");
				request.getSession().setAttribute("SgList", SgList);
				request.getRequestDispatcher("/qiantai/mall/Sg.jsp").forward(request, response);
				}
			if(gtype.equals("Gyp")){
				List<Goods> GypList=new TypeSearchdao().queryByType("工艺品");
				request.getSession().setAttribute("GypList", GypList);
				request.getRequestDispatcher("/qiantai/mall/Gyp.jsp").forward(request, response);
				}
			if(gtype.equals("Fsp")){
				List<Goods> FspList=new TypeSearchdao().queryByType("副食品");
				request.getSession().setAttribute("FspList", FspList);
				request.getRequestDispatcher("/qiantai/mall/Fsp.jsp").forward(request, response);
				}
			request.getSession().setAttribute("gtype", gtype);

	}

}
