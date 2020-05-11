package com.yxw.dao;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.util.DBUtil;
import com.yxw.view.GoodsShopcar;

public class AddDelServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			int sgno=Integer.parseInt(request.getParameter("sgno"));
			int n=Integer.parseInt(request.getParameter("n"));
			List<GoodsShopcar> goodsshopcar=(List<GoodsShopcar>) request.getSession().getAttribute("GoodsShopcarList");
			//reduce 1 add 2
			if(n==1){
				for(GoodsShopcar gs:goodsshopcar){
					if(sgno==gs.getSgno()){
						String sql="update tv_shopcar set scount=?,sprice=? where sgno=?";
						int m=gs.getScount();
						int sprice=0;
						m--;
						sprice=(int) (gs.getGprice()*m);
						Object[] obj={m,sprice,sgno};
						int a=DBUtil.executeUpdate(sql, obj);
					}	
				}
			}
			else if(n==2){
				for(GoodsShopcar gs:goodsshopcar){
					if(sgno==gs.getSgno()){
						String sql="update tv_shopcar set scount=?,sprice=? where sgno=?";
						int m=gs.getScount();
						int sprice=0;
						m++;
						sprice=(int) (gs.getGprice()*m);
						Object[] obj={m,sprice,sgno};
						int a=DBUtil.executeUpdate(sql, obj);
					}	
				}
			}
			response.sendRedirect(request.getContextPath()+"/qiantai/order/shop_car.jsp");
			
			
			
	}

}
