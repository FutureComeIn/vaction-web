package com.yxw.servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.yxw.bean.Contact;
import com.yxw.bean.User;
import com.yxw.dao.UserDao;
import com.yxw.util.DBUtil;
import com.yxw.view.UserContact;

public class UserServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");//设置在网页上显示不乱码
		request.setCharacterEncoding("utf-8");
		
		String type=request.getParameter("type");
		System.out.println("游客操作:"+type);
		
		String path="";
		String message="";
		
		//对登录成功后要返回的URL界面操作
		String url=(String)request.getSession().getAttribute("url");
		
		//安全注销
		if("exitUser".equals(type)){
			request.getSession().removeAttribute("user");
			request.getSession().removeAttribute("sign");
			//request.getSession().invalidate();
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
		//点击后台管理注销用户
		if("exitUserHt".equals(type)){
			request.getSession().removeAttribute("user");
			request.getSession().removeAttribute("sign");
			//request.getSession().invalidate();
			request.getRequestDispatcher("houtai/login.jsp").forward(request,response);
		}
		//登录
		if("login".equals(type)){
			String uname=request.getParameter("nickname");
			String upw=request.getParameter("psw");
			String sql="select *from tv_user where uname=?";
			Object[] obj={uname};
			List<User> ulist=DBUtil.query(sql, User.class, obj);
			if(ulist.size()==0){  
				message="用户名错误...";
				path="";
				request.setAttribute("message",message);
				request.setAttribute("path",path);
				request.getRequestDispatcher("common/success.jsp").forward(request,response);
				return;
			}
			if(!upw.equals(ulist.get(0).getUpw())){
				message="密码错误...";
				//path="qiantai/user/login.jsp?url="+url; 
					//还是拿不到 & 符号后的值,所以登录失败让它也回当前页算了
				//更好的解决方法：path="" 执行success.jsp界面的 window.location.back()
				//request.getSession().setAttribute("url",url) 依然起作用
				
				path="";
				request.setAttribute("message",message);
				request.setAttribute("path",path);
				request.getRequestDispatcher("common/success.jsp").forward(request,response);
				return;
			}
			message="登录成功...";
			if(url==null||"".equals(url)){
				url="index.jsp";
			}
			path=url;
			request.setAttribute("message",message);
			request.setAttribute("path",path);
			request.getSession().setAttribute("user",ulist.get(0));
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		//后台-用户管理-只查询用户
		if("admin_select".equals(type)){
			String sql="select *from tv_user";
			Object[] obj={};
			List<User> ulist=DBUtil.query(sql, User.class, obj);
			request.getSession().setAttribute("ulist", ulist);
			
			//数据条数
			int count=new UserDao().countUser();
			request.getSession().setAttribute("count", count);
			
			request.getRequestDispatcher("houtai/user/User_management.jsp").forward(request, response);
		}
		//后台-用户管理-查询用户-用户详情
		if("seeUser".equals(type)){
			String uname=new String(request.getParameter("uname").getBytes("ISO-8859-1"),"UTF-8");
			String sql="select *from tv_user u inner join tv_contact c on u.uno=c.cuno where u.uname=?";
			Object[] obj={uname};
			List<UserContact> uclist=DBUtil.query(sql,UserContact.class, obj);
			if(uclist.size()>0){
				request.setAttribute("userContact", uclist.get(0));
				request.getRequestDispatcher("houtai/user/user_management_show.jsp").forward(request,response);
			}else{
				response.getWriter().println("该用户无其他信息");
			}
		}
		//删除用户(先的把该用户的联系人删除)
		if("deleteUser".equals(type)){
			String uno=request.getParameter("uno");
			int no=Integer.parseInt(uno);
			if(new UserDao().deleteUser(no)){
				message="删除成功...";
			}else{
				message="删除失败...";
			}
			request.setAttribute("message", message);
			path="houtai/user/User_management.jsp";
			request.setAttribute("path", path);
			
			//删除之后重新查询
			String sql1="select *from tv_user";
			Object[] obj1={};
			List<User> ulist=DBUtil.query(sql1, User.class, obj1);
			request.getSession().setAttribute("ulist", ulist);
			//数据条数
			int count=new UserDao().countUser();
			request.getSession().setAttribute("count", count);
			
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		
		//注册
		if("register".equals(type)){
			String loadName="upload"; //文件上传后的存放文件名
			//文件上传后的存放路径（绝对路径）
			String filepath=request.getSession().getServletContext().getRealPath(loadName);
			//创建目录对象（不存在则创建）
			File dir=new File(filepath);
			if(!dir.exists()){
				dir.mkdir();
			}
			
			int max=1*5*1024*1024; //设置上传文件的总大小
			//上传文件
			MultipartRequest ms=new MultipartRequest(request,filepath,max,"utf-8");
			
			//在文件上传过程中，获取提交的数据使用MultipartRequest对象来替换HttpServletRequest对象
			
			String yzm=ms.getParameter("yzm");
			String yzmCode=(String)request.getSession().getAttribute("code");

			if(!yzmCode.equals(yzm)){
				message="验证码错误";
			}else{
				String touxiang=ms.getParameter("touxiang");
				//System.out.println(touxiang);  null
				String name=ms.getParameter("nickname");
				String sql2="select *from tv_user where uname=?";
				if(DBUtil.query(sql2, User.class,new Object[]{name}).size()>0){
					message="此用户名已存在";
				}else{
					String psw=ms.getParameter("password");
					String sex=ms.getParameter("sex");
					String signature=ms.getParameter("signature");

					List<String> plist=new ArrayList<String>();
					//存储文件路径(相对路径)到数据库
					Enumeration enums=ms.getFileNames();
					while(enums.hasMoreElements()){
						//接收图片是无序的
						File file=ms.getFile(enums.nextElement().toString());
						String saveName=loadName+"/"+file.getName();
						System.out.println(saveName);
						plist.add(saveName);
					}
					
					String sql="insert into tv_user values(seq_user_uno.nextval,?,?,?,?,?,0)";
					Object[] obj={name,psw,sex,plist.get(0),signature};
					if(DBUtil.executeUpdate(sql, obj)>0){
						message="注册成功...";
						path="qiantai/user/my_info.jsp"; //注册成功跳到 个人主页
					}else{
						message="注册失败...";
					}
				}
			}
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		
		//修改头像
		if("updateTx".equals(type)){
			String loadName="upload"; //文件上传后的存放文件名
			//文件上传后的存放路径（绝对路径）
			String filepath=request.getSession().getServletContext().getRealPath(loadName);
			//创建目录对象（不存在则创建）
			File dir=new File(filepath);
			if(!dir.exists()){
				dir.mkdir();
			}
			
			int max=1*5*1024*1024; //设置上传文件的总大小
			//上传文件
			MultipartRequest ms=new MultipartRequest(request,filepath,max,"utf-8");
			
			//在文件上传过程中，获取提交的数据使用MultipartRequest对象来替换HttpServletRequest对象
			String uno=ms.getParameter("uno");
			List<String> plist=new ArrayList<String>();
			//存储文件路径(相对路径)到数据库
			Enumeration enums=ms.getFileNames();
			while(enums.hasMoreElements()){
				//接收图片是无序的
				File file=ms.getFile(enums.nextElement().toString());
				String saveName=loadName+"/"+file.getName();
				System.out.println(saveName);
				plist.add(saveName);
			}
			String sql="update tv_user set utxPath=? where uno=?";
			Object[] obj={plist.get(0),Integer.parseInt(uno)};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="头像更新成功...";
				path="qiantai/user/my_head.jsp";
			}else{
				message="头像更新失败...";
			}
			
			//更新之后重新绑定user
			String sql_user="select *from tv_user where uno=?";
			Object[] obj2={Integer.parseInt(uno)};
			List<User> ulist=DBUtil.query(sql_user, User.class, obj2);
			request.getSession().setAttribute("user",ulist.get(0));
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);	
		}
		//修改信息
		if("updateInfo".equals(type)){
			String uno=request.getParameter("uno");
			String name=request.getParameter("name");
			String sex=request.getParameter("radio3");
			String signature=request.getParameter("signature");
			String sql="update tv_user set uname=?,usex=?,usignature=? where uno=?";
			Object[] obj={name,sex,signature,Integer.parseInt(uno)};
			
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="信息更新成功...";
				path="qiantai/user/my_info.jsp";
			}else{
				message="信息更新失败...";
			}
			
			//更新之后重新绑定user
			String sql_user="select *from tv_user where uno=?";
			Object[] obj2={Integer.parseInt(uno)};
			List<User> ulist=DBUtil.query(sql_user, User.class, obj2);
			request.getSession().setAttribute("user",ulist.get(0));
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);	
		}
		//修改密码
		if("updatePw".equals(type)){
			String uno=request.getParameter("uno");
			String pw2=request.getParameter("pw2");
			System.out.println("pw2="+pw2);
			String sql="update tv_user set upw=? where uno=?";
			Object[] obj={pw2,Integer.parseInt(uno)};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="密码更新成功...";
				path="qiantai/user/security.jsp";
			}else{
				message="密码更新失败...";
			}
			
			//更新之后重新绑定user
			String sql_user="select *from tv_user where uno=?";
			Object[] obj2={Integer.parseInt(uno)};
			List<User> ulist=DBUtil.query(sql_user, User.class, obj2);
			request.getSession().setAttribute("user",ulist.get(0));
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);	
		}
		//查询联系人
		if("select_contact".equals(type)){
			String uno=request.getParameter("uno");
			String sql2="select *from tv_contact order by cno";
			List<Contact> clist=DBUtil.query(sql2, Contact.class, null);
			request.getSession().setAttribute("clist", clist);
			//统计有多少条地址
			int count=new UserDao().count_contact(Integer.parseInt(uno));
			request.getSession().setAttribute("count", count);
			
			request.getRequestDispatcher("qiantai/user/my_contact.jsp").forward(request,response);
		}
		//添加联系人
		if("addContact".equals(type)){
			String uno=request.getParameter("uno");
			String name=request.getParameter("name");
			String address=request.getParameter("address");
			String mobile=request.getParameter("mobile");
			String post=request.getParameter("post");
			if("".equals(post)||post==null){
				post="000000";
			}
			String isDefault=request.getParameter("isDefault");
			//System.out.println(isDefault); //复选框未选中时，否 传过来变为 null
			if(!"是".equals(isDefault)){
				isDefault="否";
			}else{ //设置为了 默认地址，先进行更新地址默认的操作 ，再添加该条地址
				new UserDao().update_address(Integer.parseInt(uno));
			}
			String sql="insert into tv_contact values(seq_contact_cno.nextval,?,?,?,?,?,?)";
			Object[] obj={Integer.parseInt(uno),name,mobile,address,post,isDefault};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="联系人添加成功";
				path="qiantai/user/my_contact.jsp";
				//添加成功后，立即查询
				String sql2="select *from tv_contact order by cno";
				List<Contact> clist=DBUtil.query(sql2, Contact.class, null);
				request.getSession().setAttribute("clist", clist);
				//统计有多少条地址
				int count=new UserDao().count_contact(Integer.parseInt(uno));
				request.getSession().setAttribute("count", count);

			}else{
				message="联系人添加失败";
			}
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		//地址设置为默认的操作:先将该用户所有地址不默认，再将该条地址默认
		if("setAddress".equals(type)){
			String cno=request.getParameter("cno");
			String cuno=request.getParameter("cuno");
			//该所有地址为 否
			new UserDao().update_address(Integer.parseInt(cuno));
			//该条地址为 是
			String sql="update tv_contact set cdefault='是' where cno=?";
			Object[] obj={Integer.parseInt(cno)};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="设置默认地址成功...";
				path="qiantai/user/my_contact.jsp";
			}else{
				message="设置默认地址失败...";
			}
			//修改成功后，立即查询
			String sql2="select *from tv_contact order by cno";
			List<Contact> clist=DBUtil.query(sql2, Contact.class, null);
			request.getSession().setAttribute("clist", clist);
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		//删除地址
		if("delAddress".equals(type)){
			String cno=request.getParameter("cno");
			String sql="delete from tv_contact where cno=?";
			Object[] obj={Integer.parseInt(cno)};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="删除成功...";
				path="qiantai/user/my_contact.jsp";
			}else{
				message="删除失败...";
			}
			//删除成功后，立即查询
			String sql2="select *from tv_contact order by cno";
			List<Contact> clist=DBUtil.query(sql2, Contact.class, null);
			request.getSession().setAttribute("clist", clist);
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		
	}
	

}
