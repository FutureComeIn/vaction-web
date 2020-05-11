package com.yxw.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Goods;
import com.yxw.bean.Scenic;
import com.yxw.util.DBUtil;
import com.yxw.view.NoteView;

public class QiantaiServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//查询景区到前台首页显示，查询指定大小
		String sql="select *from (select s.*,row_number() over (order by sno desc) rno from tv_scenic s) sc where sc.rno<6";
		List<Scenic> qtslist=DBUtil.query(sql, Scenic.class, null);
		request.getSession().setAttribute("qtslist", qtslist);
		
		//查询商品到前台显示，查询制定大小
		String sql2="select *from (select g.*,row_number() over (order by gno desc) rno from tv_goods g) go where go.rno<6";
		List<Goods> qtglist=DBUtil.query(sql2, Goods.class, null);
		request.getSession().setAttribute("qtglist", qtglist);
		
		//查询游记到前台显示，查询制定大小
		String sql3="select *from(select n.*,u.utxPath,u.uname,row_number() over(order by n.nno desc)"; 
		sql3+=" recordno  from tv_note n inner join tv_user u on n.nuno=u.uno where nsend='是') nn where nn.recordno<5";
		List<NoteView> qtnlist=DBUtil.query(sql3, NoteView.class, null);
		for(NoteView n: qtnlist){
			String content=n.getNcontent().substring(0,2)+"...";
			n.setNcontent(content);
		}
		request.getSession().setAttribute("qtnlist", qtnlist);
		
		request.getRequestDispatcher("index.jsp").forward(request,response);
		
	}

}
