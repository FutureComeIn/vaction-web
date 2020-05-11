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
		response.setContentType("text/html;charset=utf-8");//��������ҳ����ʾ������
		request.setCharacterEncoding("utf-8");
		
		String type=request.getParameter("type");
		System.out.println("�οͲ���:"+type);
		
		String path="";
		String message="";
		
		//�Ե�¼�ɹ���Ҫ���ص�URL�������
		String url=(String)request.getSession().getAttribute("url");
		
		//��ȫע��
		if("exitUser".equals(type)){
			request.getSession().removeAttribute("user");
			request.getSession().removeAttribute("sign");
			//request.getSession().invalidate();
			request.getRequestDispatcher("index.jsp").forward(request,response);
		}
		//�����̨����ע���û�
		if("exitUserHt".equals(type)){
			request.getSession().removeAttribute("user");
			request.getSession().removeAttribute("sign");
			//request.getSession().invalidate();
			request.getRequestDispatcher("houtai/login.jsp").forward(request,response);
		}
		//��¼
		if("login".equals(type)){
			String uname=request.getParameter("nickname");
			String upw=request.getParameter("psw");
			String sql="select *from tv_user where uname=?";
			Object[] obj={uname};
			List<User> ulist=DBUtil.query(sql, User.class, obj);
			if(ulist.size()==0){  
				message="�û�������...";
				path="";
				request.setAttribute("message",message);
				request.setAttribute("path",path);
				request.getRequestDispatcher("common/success.jsp").forward(request,response);
				return;
			}
			if(!upw.equals(ulist.get(0).getUpw())){
				message="�������...";
				//path="qiantai/user/login.jsp?url="+url; 
					//�����ò��� & ���ź��ֵ,���Ե�¼ʧ������Ҳ�ص�ǰҳ����
				//���õĽ��������path="" ִ��success.jsp����� window.location.back()
				//request.getSession().setAttribute("url",url) ��Ȼ������
				
				path="";
				request.setAttribute("message",message);
				request.setAttribute("path",path);
				request.getRequestDispatcher("common/success.jsp").forward(request,response);
				return;
			}
			message="��¼�ɹ�...";
			if(url==null||"".equals(url)){
				url="index.jsp";
			}
			path=url;
			request.setAttribute("message",message);
			request.setAttribute("path",path);
			request.getSession().setAttribute("user",ulist.get(0));
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		//��̨-�û�����-ֻ��ѯ�û�
		if("admin_select".equals(type)){
			String sql="select *from tv_user";
			Object[] obj={};
			List<User> ulist=DBUtil.query(sql, User.class, obj);
			request.getSession().setAttribute("ulist", ulist);
			
			//��������
			int count=new UserDao().countUser();
			request.getSession().setAttribute("count", count);
			
			request.getRequestDispatcher("houtai/user/User_management.jsp").forward(request, response);
		}
		//��̨-�û�����-��ѯ�û�-�û�����
		if("seeUser".equals(type)){
			String uname=new String(request.getParameter("uname").getBytes("ISO-8859-1"),"UTF-8");
			String sql="select *from tv_user u inner join tv_contact c on u.uno=c.cuno where u.uname=?";
			Object[] obj={uname};
			List<UserContact> uclist=DBUtil.query(sql,UserContact.class, obj);
			if(uclist.size()>0){
				request.setAttribute("userContact", uclist.get(0));
				request.getRequestDispatcher("houtai/user/user_management_show.jsp").forward(request,response);
			}else{
				response.getWriter().println("���û���������Ϣ");
			}
		}
		//ɾ���û�(�ȵİѸ��û�����ϵ��ɾ��)
		if("deleteUser".equals(type)){
			String uno=request.getParameter("uno");
			int no=Integer.parseInt(uno);
			if(new UserDao().deleteUser(no)){
				message="ɾ���ɹ�...";
			}else{
				message="ɾ��ʧ��...";
			}
			request.setAttribute("message", message);
			path="houtai/user/User_management.jsp";
			request.setAttribute("path", path);
			
			//ɾ��֮�����²�ѯ
			String sql1="select *from tv_user";
			Object[] obj1={};
			List<User> ulist=DBUtil.query(sql1, User.class, obj1);
			request.getSession().setAttribute("ulist", ulist);
			//��������
			int count=new UserDao().countUser();
			request.getSession().setAttribute("count", count);
			
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		
		//ע��
		if("register".equals(type)){
			String loadName="upload"; //�ļ��ϴ���Ĵ���ļ���
			//�ļ��ϴ���Ĵ��·��������·����
			String filepath=request.getSession().getServletContext().getRealPath(loadName);
			//����Ŀ¼���󣨲������򴴽���
			File dir=new File(filepath);
			if(!dir.exists()){
				dir.mkdir();
			}
			
			int max=1*5*1024*1024; //�����ϴ��ļ����ܴ�С
			//�ϴ��ļ�
			MultipartRequest ms=new MultipartRequest(request,filepath,max,"utf-8");
			
			//���ļ��ϴ������У���ȡ�ύ������ʹ��MultipartRequest�������滻HttpServletRequest����
			
			String yzm=ms.getParameter("yzm");
			String yzmCode=(String)request.getSession().getAttribute("code");

			if(!yzmCode.equals(yzm)){
				message="��֤�����";
			}else{
				String touxiang=ms.getParameter("touxiang");
				//System.out.println(touxiang);  null
				String name=ms.getParameter("nickname");
				String sql2="select *from tv_user where uname=?";
				if(DBUtil.query(sql2, User.class,new Object[]{name}).size()>0){
					message="���û����Ѵ���";
				}else{
					String psw=ms.getParameter("password");
					String sex=ms.getParameter("sex");
					String signature=ms.getParameter("signature");

					List<String> plist=new ArrayList<String>();
					//�洢�ļ�·��(���·��)�����ݿ�
					Enumeration enums=ms.getFileNames();
					while(enums.hasMoreElements()){
						//����ͼƬ�������
						File file=ms.getFile(enums.nextElement().toString());
						String saveName=loadName+"/"+file.getName();
						System.out.println(saveName);
						plist.add(saveName);
					}
					
					String sql="insert into tv_user values(seq_user_uno.nextval,?,?,?,?,?,0)";
					Object[] obj={name,psw,sex,plist.get(0),signature};
					if(DBUtil.executeUpdate(sql, obj)>0){
						message="ע��ɹ�...";
						path="qiantai/user/my_info.jsp"; //ע��ɹ����� ������ҳ
					}else{
						message="ע��ʧ��...";
					}
				}
			}
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		
		//�޸�ͷ��
		if("updateTx".equals(type)){
			String loadName="upload"; //�ļ��ϴ���Ĵ���ļ���
			//�ļ��ϴ���Ĵ��·��������·����
			String filepath=request.getSession().getServletContext().getRealPath(loadName);
			//����Ŀ¼���󣨲������򴴽���
			File dir=new File(filepath);
			if(!dir.exists()){
				dir.mkdir();
			}
			
			int max=1*5*1024*1024; //�����ϴ��ļ����ܴ�С
			//�ϴ��ļ�
			MultipartRequest ms=new MultipartRequest(request,filepath,max,"utf-8");
			
			//���ļ��ϴ������У���ȡ�ύ������ʹ��MultipartRequest�������滻HttpServletRequest����
			String uno=ms.getParameter("uno");
			List<String> plist=new ArrayList<String>();
			//�洢�ļ�·��(���·��)�����ݿ�
			Enumeration enums=ms.getFileNames();
			while(enums.hasMoreElements()){
				//����ͼƬ�������
				File file=ms.getFile(enums.nextElement().toString());
				String saveName=loadName+"/"+file.getName();
				System.out.println(saveName);
				plist.add(saveName);
			}
			String sql="update tv_user set utxPath=? where uno=?";
			Object[] obj={plist.get(0),Integer.parseInt(uno)};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="ͷ����³ɹ�...";
				path="qiantai/user/my_head.jsp";
			}else{
				message="ͷ�����ʧ��...";
			}
			
			//����֮�����°�user
			String sql_user="select *from tv_user where uno=?";
			Object[] obj2={Integer.parseInt(uno)};
			List<User> ulist=DBUtil.query(sql_user, User.class, obj2);
			request.getSession().setAttribute("user",ulist.get(0));
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);	
		}
		//�޸���Ϣ
		if("updateInfo".equals(type)){
			String uno=request.getParameter("uno");
			String name=request.getParameter("name");
			String sex=request.getParameter("radio3");
			String signature=request.getParameter("signature");
			String sql="update tv_user set uname=?,usex=?,usignature=? where uno=?";
			Object[] obj={name,sex,signature,Integer.parseInt(uno)};
			
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="��Ϣ���³ɹ�...";
				path="qiantai/user/my_info.jsp";
			}else{
				message="��Ϣ����ʧ��...";
			}
			
			//����֮�����°�user
			String sql_user="select *from tv_user where uno=?";
			Object[] obj2={Integer.parseInt(uno)};
			List<User> ulist=DBUtil.query(sql_user, User.class, obj2);
			request.getSession().setAttribute("user",ulist.get(0));
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);	
		}
		//�޸�����
		if("updatePw".equals(type)){
			String uno=request.getParameter("uno");
			String pw2=request.getParameter("pw2");
			System.out.println("pw2="+pw2);
			String sql="update tv_user set upw=? where uno=?";
			Object[] obj={pw2,Integer.parseInt(uno)};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="������³ɹ�...";
				path="qiantai/user/security.jsp";
			}else{
				message="�������ʧ��...";
			}
			
			//����֮�����°�user
			String sql_user="select *from tv_user where uno=?";
			Object[] obj2={Integer.parseInt(uno)};
			List<User> ulist=DBUtil.query(sql_user, User.class, obj2);
			request.getSession().setAttribute("user",ulist.get(0));
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);	
		}
		//��ѯ��ϵ��
		if("select_contact".equals(type)){
			String uno=request.getParameter("uno");
			String sql2="select *from tv_contact order by cno";
			List<Contact> clist=DBUtil.query(sql2, Contact.class, null);
			request.getSession().setAttribute("clist", clist);
			//ͳ���ж�������ַ
			int count=new UserDao().count_contact(Integer.parseInt(uno));
			request.getSession().setAttribute("count", count);
			
			request.getRequestDispatcher("qiantai/user/my_contact.jsp").forward(request,response);
		}
		//�����ϵ��
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
			//System.out.println(isDefault); //��ѡ��δѡ��ʱ���� ��������Ϊ null
			if(!"��".equals(isDefault)){
				isDefault="��";
			}else{ //����Ϊ�� Ĭ�ϵ�ַ���Ƚ��и��µ�ַĬ�ϵĲ��� ������Ӹ�����ַ
				new UserDao().update_address(Integer.parseInt(uno));
			}
			String sql="insert into tv_contact values(seq_contact_cno.nextval,?,?,?,?,?,?)";
			Object[] obj={Integer.parseInt(uno),name,mobile,address,post,isDefault};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="��ϵ����ӳɹ�";
				path="qiantai/user/my_contact.jsp";
				//��ӳɹ���������ѯ
				String sql2="select *from tv_contact order by cno";
				List<Contact> clist=DBUtil.query(sql2, Contact.class, null);
				request.getSession().setAttribute("clist", clist);
				//ͳ���ж�������ַ
				int count=new UserDao().count_contact(Integer.parseInt(uno));
				request.getSession().setAttribute("count", count);

			}else{
				message="��ϵ�����ʧ��";
			}
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		//��ַ����ΪĬ�ϵĲ���:�Ƚ����û����е�ַ��Ĭ�ϣ��ٽ�������ַĬ��
		if("setAddress".equals(type)){
			String cno=request.getParameter("cno");
			String cuno=request.getParameter("cuno");
			//�����е�ַΪ ��
			new UserDao().update_address(Integer.parseInt(cuno));
			//������ַΪ ��
			String sql="update tv_contact set cdefault='��' where cno=?";
			Object[] obj={Integer.parseInt(cno)};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="����Ĭ�ϵ�ַ�ɹ�...";
				path="qiantai/user/my_contact.jsp";
			}else{
				message="����Ĭ�ϵ�ַʧ��...";
			}
			//�޸ĳɹ���������ѯ
			String sql2="select *from tv_contact order by cno";
			List<Contact> clist=DBUtil.query(sql2, Contact.class, null);
			request.getSession().setAttribute("clist", clist);
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		//ɾ����ַ
		if("delAddress".equals(type)){
			String cno=request.getParameter("cno");
			String sql="delete from tv_contact where cno=?";
			Object[] obj={Integer.parseInt(cno)};
			if(DBUtil.executeUpdate(sql, obj)>0){
				message="ɾ���ɹ�...";
				path="qiantai/user/my_contact.jsp";
			}else{
				message="ɾ��ʧ��...";
			}
			//ɾ���ɹ���������ѯ
			String sql2="select *from tv_contact order by cno";
			List<Contact> clist=DBUtil.query(sql2, Contact.class, null);
			request.getSession().setAttribute("clist", clist);
			
			request.setAttribute("message", message);
			request.setAttribute("path", path);
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		
	}
	

}
