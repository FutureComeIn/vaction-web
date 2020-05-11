package com.yxw.htservlet;

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
import com.yxw.bean.Scenic;
import com.yxw.bean.ScenicData;
import com.yxw.bean.ScenicPhoto;
import com.yxw.bean.SearchScenic;
import com.yxw.dao.ScenicDao;
import com.yxw.util.DBUtil;

public class ScenicServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String message="";
		String path="";
		
		String type=request.getParameter("type");
		
		//��ѯ���о�����ǰ̨��ʾ
		if("qt_select".equals(type)){
			String page=request.getParameter("currentPage");
			int currentPage=1;
			if(page!=null&&!"".equals(page)){  // ��||���ˣ����������ľ� ||��������
				currentPage=Integer.parseInt(page);
			}
			ScenicData sdata=new ScenicDao().queryScenic(new SearchScenic(0,""),currentPage);
			request.setAttribute("sdata",sdata);
			request.setAttribute("currentPage",currentPage);
			request.getRequestDispatcher("qiantai/scenic/scenic_list.jsp").forward(request,response);
		}
		
		//��ѯ���о�������̨��ʾ
		if("admin_select".equals(type)){
			/*
			String sql="select *from tv_scenic order by sno";
			Object[] obj={};
			List<Scenic> slist=DBUtil.query(sql,Scenic.class, obj);*/
			String sno=request.getParameter("sno");
			String sname=request.getParameter("sname");
			String page=request.getParameter("currentPage");
			int no=0;
			int currentPage=1;
			if(sno!=null&&!"".equals(sno)){  // ��||���ˣ����������ľ� ||��������
				no=Integer.parseInt(sno);
			}
			if(page!=null&&!"".equals(page)){ //���õ�ǰҳ
				currentPage=Integer.parseInt(page);
			}
			SearchScenic search=new SearchScenic(no,sname);
			ScenicData sdata=new ScenicDao().queryScenic(search, currentPage);
			request.getSession().setAttribute("sdata",sdata);
			request.getSession().setAttribute("search",search);
			request.getSession().setAttribute("currentPage",currentPage);
			request.getRequestDispatcher("houtai/scenicSpot/scenicSpot_management.jsp").forward(request,response);
			
		}
		//��ѯĳ����ͼƬ
		if("photo_select".equals(type)){
			String sno=request.getParameter("sno");
			int no=Integer.parseInt(sno);
			String sql="select *from tv_scenicphoto where spsno=?";
			Object[] obj={no};
			List<ScenicPhoto> splist=DBUtil.query(sql,ScenicPhoto.class, obj);
			if(splist.size()>0){
				request.setAttribute("scenicPhoto", splist.get(0));
				request.getRequestDispatcher("houtai/scenicSpot/scenicPhoto.jsp").forward(request,response);
			}else{
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println("�þ�������ͼƬ");
			}
		}
		//��Ӿ���
		if("add".equals(type)){
			//�ļ��ϴ���Ĵ���ļ���
			String loadName="upload";
			//�ļ��ϴ���Ĵ��·��������·����
			String filepath=request.getSession().getServletContext().getRealPath(loadName);
			
			//����Ŀ¼���󣨲������򴴽���
			File dir=new File(filepath);
			if(!dir.exists()){
				dir.mkdir();
			}
			
			//�����ϴ��ļ����ܴ�С
			int max=2*5*1024*1024;
			
			//�ϴ��ļ�
			MultipartRequest ms=new MultipartRequest(request,filepath,max,"utf-8");
			
			//���ļ��ϴ������У���ȡ�ύ������ʹ��MultipartRequest�������滻HttpServletRequest����
			String name=ms.getParameter("name");
			//System.out.println("����:"+name);
			String content=ms.getParameter("content");
			String mobile=ms.getParameter("mobile");
			String opendate=ms.getParameter("opendate");
			String address=ms.getParameter("address");
			String price=ms.getParameter("price");
			int price1=Integer.parseInt(price);
			

			//�洢�ļ�·��(���·��)�����ݿ�
			Enumeration enums=ms.getFileNames();
			Scenic sc=new Scenic();
			while(enums.hasMoreElements()){
				//����ͼƬ�������
				String spname=enums.nextElement().toString();
				File file=ms.getFile(spname);
				String saveName=loadName+"/"+file.getName();
				if("logo".equals(spname)){
					sc.setSheadpath(saveName);
				}
				if("background".equals(spname)){
					sc.setSbgpath(saveName);
				}
				
			}
			//���ƣ�����ͷ�񣬱���ͼƬ�����ֽ��ܣ���ѯ�绰������ʱ�䣬��ϸ��ַ���۸�
			Object[] obj1={name,sc.getSheadpath(),sc.getSbgpath(),content,mobile,opendate,address,price1};
			String sql1="insert into tv_scenic values(seq_scenic_sno.nextval,?,?,?,?,?,?,?,?)";
			if(DBUtil.executeUpdate(sql1,obj1)==1){
				message="������ӳɹ�...";
				path="houtai/scenicSpot/scenicSpot_management.jsp";
			}else{
				message="�������ʧ��...";
			}
			request.setAttribute("message",message);
			request.setAttribute("path",path);
			//������ҳ��ѯ
			ScenicData sdata=new ScenicDao().queryScenic(new SearchScenic(0,""),1);
			request.getSession().setAttribute("sdata",sdata);
			request.getSession().setAttribute("currentPage",1);

			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		
		//��Ӿ���ͼƬ
		if("addPhoto".equals(type)){
			//�ļ��ϴ���Ĵ���ļ���
			String loadName="upload";
			//�ļ��ϴ���Ĵ��·��������·����
			String filepath=request.getSession().getServletContext().getRealPath(loadName);
			
			//����Ŀ¼���󣨲������򴴽���
			File dir=new File(filepath);
			if(!dir.exists()){
				dir.mkdir();
			}
			
			//�����ϴ��ļ����ܴ�С
			int max=5*5*1024*1024;
			
			//�ϴ��ļ�
			MultipartRequest ms=new MultipartRequest(request,filepath,max,"utf-8");
			
			//���ļ��ϴ������У���ȡ�ύ������ʹ��MultipartRequest�������滻HttpServletRequest����
			String sno=ms.getParameter("sno");
			int no=Integer.parseInt(sno);
			
			//�洢�ļ�·��(���·��)�����ݿ�
			Enumeration enums=ms.getFileNames();
			
			ScenicPhoto sp=new ScenicPhoto();
			
			while(enums.hasMoreElements()){
				//����ͼƬ�������
				String pname=enums.nextElement().toString();
				System.out.println(pname);
				File file=ms.getFile(pname); 
				String saveName=loadName+"/"+file.getName();  
				if("photo1".equals(pname)){
					sp.setSpphoto1(saveName);
				}
				if("photo2".equals(pname)){
					sp.setSpphoto2(saveName);
				}
				if("photo3".equals(pname)){
					sp.setSpphoto3(saveName);
				}
				if("photo4".equals(pname)){
					sp.setSpphoto4(saveName);
				}
				if("photo5".equals(pname)){
					sp.setSpphoto5(saveName);
				}
			}
			String sql2="insert into tv_scenicphoto values(seq_scenicphoto_spno.nextval,?,?,?,?,?,?)";
			Object[] obj2={no,sp.getSpphoto1(),sp.getSpphoto2(),sp.getSpphoto3(),sp.getSpphoto4(),sp.getSpphoto5()};
			
			//*************�˴��ж������Ѿ������ͼƬ������ɾ��
			String sql="select *from tv_scenicphoto where spsno=?";
			Object[] obj={no};
			List<ScenicPhoto> splist=DBUtil.query(sql,ScenicPhoto.class, obj);
			if(splist.size()>0){
				String sql_del="delete from tv_scenicphoto where spsno=?";
				if(DBUtil.executeUpdate(sql_del, obj)>0){
					if(DBUtil.executeUpdate(sql2,obj2)==1){
						message="yes";
					}else{
						message="no";
					}
				}else{
					message="no";
				}
			}else{
				if(DBUtil.executeUpdate(sql2,obj2)==1){
					message="yes";
				}else{
					message="no";
				}
			}
			request.getRequestDispatcher("houtai/scenicSpot/addScenicPhoto.jsp?message="+message).forward(request,response);
		}
		//ɾ������
		if("del".equals(type)){
			String sno=request.getParameter("sno");
			if(new ScenicDao().delete(Integer.parseInt(sno))){
				message="����ɾ���ɹ�...";
				path="houtai/scenicSpot/scenicSpot_management.jsp";
			}else{
				message="����ɾ��ʧ��...";
			}
			request.setAttribute("message",message);
			request.setAttribute("path",path);
			
			//������ҳ��ѯ
			ScenicData sdata=new ScenicDao().queryScenic(new SearchScenic(0,""),1);
			request.getSession().setAttribute("sdata",sdata);
			request.getSession().setAttribute("currentPage",1);
			
			request.getRequestDispatcher("common/success.jsp").forward(request,response);
		}
		//�޸ľ���ʱ�Ĳ�ѯĳ������
		if("update_select".equals(type)){
			String sno=request.getParameter("sno");
			String sql="select *from tv_scenic where sno=?";
			Object[] obj={Integer.parseInt(sno)};
			List<Scenic> scenic=DBUtil.query(sql,Scenic.class,obj);
			request.setAttribute("scenic", scenic.get(0));
			request.getRequestDispatcher("houtai/scenicSpot/updateScenic.jsp").forward(request,response);
		}
		
		//ǰ̨�Ĳ�ѯĳ������ ,ͬʱ�� �þ���ͼƬ�����
		if("qt_select1".equals(type)){
			String sno=request.getParameter("sno");
			Object[] obj={Integer.parseInt(sno)};
			
			String sql="select *from tv_scenic where sno=?";
			List<Scenic> scenic=DBUtil.query(sql,Scenic.class,obj);
			request.getSession().setAttribute("qt_scenic", scenic.get(0));
			
			String sql1="select *from tv_scenicphoto where spsno=?";
			List<ScenicPhoto> splist=DBUtil.query(sql1,ScenicPhoto.class, obj);
			request.setAttribute("qt_sphoto", splist.get(0));
			
			request.getRequestDispatcher("qiantai/scenic/scenic.jsp").forward(request,response);
		}
		
		
		//����ĳ������Ϣ
		if("update".equals(type)){
			//�ļ��ϴ���Ĵ���ļ���
			String loadName="upload";
			//�ļ��ϴ���Ĵ��·��������·����
			String filepath=request.getSession().getServletContext().getRealPath(loadName);
			
			//����Ŀ¼���󣨲������򴴽���
			File dir=new File(filepath);
			if(!dir.exists()){
				dir.mkdir();
			}
			
			//�����ϴ��ļ����ܴ�С
			int max=2*5*1024*1024;
			
			//�ϴ��ļ�
			MultipartRequest ms=new MultipartRequest(request,filepath,max,"utf-8");
			
			//���ļ��ϴ������У���ȡ�ύ������ʹ��MultipartRequest�������滻HttpServletRequest����
			String sno=ms.getParameter("sno");
			int no=Integer.parseInt(sno);
			String name=ms.getParameter("name");
			//System.out.println("����:"+name);
			String content=ms.getParameter("content");
			String mobile=ms.getParameter("mobile");
			String opendate=ms.getParameter("opendate");
			String address=ms.getParameter("address");
			String price=ms.getParameter("price");
			double price1=Double.parseDouble(price);
			
			Scenic sc=new Scenic();
			//�洢�ļ�·��(���·��)�����ݿ�
			Enumeration enums=ms.getFileNames();
			/*
			System.out.println(enums.hasMoreElements());   //true
			System.out.println(enums.nextElement().toString());//background logo
			System.out.println(ms.getFile(enums.nextElement().toString())); //null
			*/
			boolean flag=false;
			int count=0;
			while(enums.hasMoreElements()){
				//����ͼƬ�������
				String spname=enums.nextElement().toString();
				File file=ms.getFile(spname); 
				if(file!=null){
					String saveName=loadName+"/"+file.getName();
					if("logo".equals(spname)){
						sc.setSheadpath(saveName);
						count++;
					}
					if("background".equals(spname)){
						sc.setSbgpath(saveName);
						count++;
					}
				}
				if(count==2){
					flag=true;
				}
			}
			/**
			 * ��������Ҫ��ͼƬ���������������һ��������
			 */
			
			if(flag){  //��ͼƬ
				
				//���ƣ�����ͷ�񣬱���ͼƬ�����ֽ��ܣ���ѯ�绰������ʱ�䣬��ϸ��ַ���۸�
				Object[] obj1={name,sc.getSheadpath(),sc.getSbgpath(),content,mobile,opendate,address,price1,no};
				String sql1="update tv_scenic set sname=?,sheadpath=?,sbgpath=?,scontent=?,smobile=?,sopendate=?,saddress=?,sprice=? where sno=?";
				if(DBUtil.executeUpdate(sql1,obj1)==1){
					message="�������³ɹ�...";
					path="houtai/scenicSpot/scenicSpot_management.jsp";
				}else{
					message="��������ʧ��...";
				}
				
			}else{  //����ͼƬ
				
				//���ƣ�����ͷ�񣬱���ͼƬ�����ֽ��ܣ���ѯ�绰������ʱ�䣬��ϸ��ַ���۸�
				Object[] obj1={name,content,mobile,opendate,address,price1,no};
				String sql1="update tv_scenic set sname=?,scontent=?,smobile=?,sopendate=?,saddress=?,sprice=? where sno=?";
				if(DBUtil.executeUpdate(sql1,obj1)==1){
					message="�������³ɹ�...";
					path="houtai/scenicSpot/scenicSpot_management.jsp";
				}else{
					message="��������ʧ��...";
				}
			}
			request.setAttribute("message",message);
			request.setAttribute("path",path);
			
			//������ҳ��ѯ
			ScenicData sdata=new ScenicDao().queryScenic(new SearchScenic(0,""),1);
			request.getSession().setAttribute("sdata",sdata);
			request.getSession().setAttribute("currentPage",1);
			
			request.getRequestDispatcher("common/success.jsp").forward(request,response);

		}
	}

}
