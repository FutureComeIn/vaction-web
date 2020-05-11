package com.yxw.htservlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.bean.Admin;
import com.yxw.util.DBUtil;

public class AdminServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String message="";
		String path="";
		
		String type=request.getParameter("type");

		
		if("login".equals(type)){
			String name=request.getParameter("userName");
			String psw=request.getParameter("password");
			String sql="select *from tv_admin where aname=?";
			Object[] obj={name};
			List<Admin> alist=DBUtil.query(sql, Admin.class, obj);
			if(alist.size()==0){
				message="��¼������";
				request.setAttribute("message", message);
				request.setAttribute("path", path);
				request.getRequestDispatcher("common/success.jsp").forward(request,response);
				return;
			}
			if(!psw.equals(alist.get(0).getApsw())){
				message="�������";
				request.setAttribute("message",message);
				request.setAttribute("path", path);
				request.getRequestDispatcher("common/success.jsp").forward(request,response);
				return;
			}
			message="��¼�ɹ�";
			path="houtai/index.jsp";
			request.setAttribute("message",message);
			request.setAttribute("path",path);
			request.getSession().setAttribute("admin",alist.get(0));
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		
		if("update".equals(type)){
			String ano=request.getParameter("ano");
			//��������:��jsp���洫��servlet�����ֵ
			String name=new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
			String mobile=request.getParameter("mobile");
			System.out.println(ano+" "+name+" "+mobile );
			String sql="update tv_admin set aname=?,amobile=? where ano=?";
			Object[] obj={name,mobile,Integer.parseInt(ano)};
			if(DBUtil.executeUpdate(sql,obj)==1){
				message="�޸ĳɹ�...";
				path="houtai/admin/adminInfo.jsp";
				String sql_select="select *from tv_admin where ano=?";
				Object[] obj1={Integer.parseInt(ano)};
				List<Admin> alist=DBUtil.query(sql_select, Admin.class, obj1);
				request.getSession().setAttribute("admin", alist.get(0));
			}else{
				message="�޸�ʧ��...";
			}
			request.setAttribute("message",message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
	
	}

}
