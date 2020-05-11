package com.yxw.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Goods;
import com.yxw.bean.User;
import com.yxw.util.DBUtil;
import com.yxw.view.GoodsShopcar;

public class ShopcaraddServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int num=Integer.parseInt(request.getParameter("scount"));
		int total=Integer.parseInt(request.getParameter("sprice"));
		User user=(User) request.getSession().getAttribute("user");
		Goods good=(Goods) request.getSession().getAttribute("good");
		request.getSession().setAttribute("num", num);
		request.getSession().setAttribute("total", total);
		String sql1="select * from tv_user u inner join (select * from tv_goods g inner join tv_shopcar s on g.gno=s.sgno) gs on gs.suno=u.uno order by sno desc";
		List<GoodsShopcar> GoodsShopcarList=DBUtil.query(sql1, GoodsShopcar.class,null);
		request.getSession().setAttribute("GoodsShopcarList", GoodsShopcarList);
		int n=0;
		System.out.println(good.getGno());
		for(GoodsShopcar gs:GoodsShopcarList){
			if(good.getGno()==gs.getSgno()){
				String sql2="update tv_shopcar set scount=?,sprice=? where sgno=?";
				int count =gs.getScount()+num;
				int price =(int) (gs.getSprice()+total);
				Object[] obj={count,price,good.getGno()};
				int m=DBUtil.executeUpdate(sql2, obj);
				n++;
			}
		}
		if(n==0){
		String sql="insert into tv_shopcar values(seq_shopcar_sno.nextval,?,?,?,?)";
		Object[] obj={user.getUno(),good.getGno(),num,total};
		int a=DBUtil.executeUpdate(sql, obj);
		}
		response.sendRedirect(request.getContextPath()+"/qiantai/order/shop_car.jsp");
	}

}
