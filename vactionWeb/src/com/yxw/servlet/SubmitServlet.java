package com.yxw.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.User;
import com.yxw.dao.Shopcardeletedao;
import com.yxw.util.DBUtil;
import com.yxw.view.GoodsShopcar;
import com.yxw.view.Orderview;

public class SubmitServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
				this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        	response.setCharacterEncoding("UTF-8");
        	request.setCharacterEncoding("utf-8");
        	Connection con=DBUtil.getConn();
        	PreparedStatement pt=null;
        	ResultSet rs=null;
        	
        	User user=(User)request.getSession().getAttribute("user");
			String[] sno=request.getParameterValues("sno");
			String sql="select *from(select * from tv_user u inner join (select * from tv_goods g inner join tv_shopcar s on g.gno=s.sgno) gs on gs.suno=u.uno order by sno desc) where sno=?";
			Double tprice=0.0;
			List<GoodsShopcar> gsList=new ArrayList<GoodsShopcar>();
			for (int i=0;i<sno.length;i++){
				int s=Integer.parseInt(sno[i]);
				
				Object[] obj={s};
				
				System.out.println(DBUtil.query(sql, GoodsShopcar.class,obj));
				
				GoodsShopcar gs=(GoodsShopcar) DBUtil.query(sql, GoodsShopcar.class,obj).get(0);
				gsList.add(gs);
			
			} 	
			for(GoodsShopcar gg:gsList){
				tprice=tprice+gg.getGprice();
			}
			Object[] obj1={user.getUno(),tprice,new java.sql.Timestamp(new java.util.Date().getTime())};
			request.getSession().setAttribute("gsList", gsList);
			String sql1="insert into tv_goodorder values(seq_goodorder_gono.nextval,?,?,?)";
			int m=DBUtil.executeUpdate(sql1, obj1);
			int gono=0;
			String sql_2="select seq_goodorder_gono.nextval from dual";
			String sql2="select seq_goodorder_gono.currval-1 from dual";
			try {
				pt =con.prepareStatement(sql_2);
				rs =pt.executeQuery();
				
				pt =con.prepareStatement(sql2);
				rs =pt.executeQuery();
				if(rs.next()){
					gono=rs.getInt(1);
					System.out.println(gono);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			String sql3="insert into tv_orderdetail values(seq_orderdetail_odno.nextval,?,?,?,?,?,null,2,'Î´¸¶¿î')";
			for(GoodsShopcar gg:gsList){
				Object[] obj2={gono,gg.getSgno(),gg.getScount(),gg.getGprice(),gg.getSprice()};
				int b=DBUtil.executeUpdate(sql3, obj2);
			}
			List<Orderview> orderviewList=new ArrayList<Orderview>();
			for (int i=0;i<sno.length;i++){
				int s=Integer.parseInt(sno[i]);
				String sql4="select *from(select * from(select *from (select *from tv_goodorder g inner join tv_orderdetail o on g.gono=o.odgono) go inner join tv_goods d on go.odgno=d.gno) god inner join tv_shopcar s on god.gno=s.sgno) where sno=?";
				Object[] obj={s};
				Orderview orderview=(Orderview) DBUtil.query(sql4,Orderview.class,obj).get(0);
				orderviewList.add(orderview);
			}
			request.getSession().setAttribute("orderviewList", orderviewList);
			for (int i=0;i<sno.length;i++){
				int s=Integer.parseInt(sno[i]);
				new Shopcardeletedao().DelShopcarByid(s);
			
			}
			response.sendRedirect(request.getContextPath()+"/qiantai/order/confirm_order_food.jsp");
	}

}
