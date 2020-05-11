package com.yxw.htservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.GoodPhoto;
import com.yxw.bean.Goods;
import com.yxw.dao.GoodPhotoDao;
import com.yxw.dao.GoodsDao;
import com.yxw.util.DBUtil;

public class QueryAllGoodsServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type=request.getParameter("type");
		
		if("qtselect".equals(type)){
			List<Goods> goodsList = new GoodsDao().queryAllGoods();
			request.getSession().setAttribute("goodsList", goodsList);
			request.getRequestDispatcher("qiantai/mall/mall_list.jsp").forward(request, response);
		}
		if("htselect".equals(type)){
			List<Goods> goodsList = new GoodsDao().queryAllGoods();
			request.getSession().setAttribute("goodsList", goodsList);
			request.getRequestDispatcher("/houtai/goods/goods_management.jsp").forward(request, response);
		}
		if("selectByNo".equals(type)){
			String gno=request.getParameter("gno");
			String sql="select *from tv_goods where gno=?";
			Object[] obj={Integer.parseInt(gno)};
			List<Goods> glist=DBUtil.query(sql,Goods.class, obj);
			request.setAttribute("qtgood", glist.get(0));
			
			List<GoodPhoto> gp=new GoodPhotoDao().queryGoodPhotoByPgno(Integer.parseInt(gno));
	    	request.setAttribute("qtgPhoto",gp.get(0));
			
			request.getRequestDispatcher("qiantai/mall/project.jsp").forward(request,response);
		}
		
	}
}
