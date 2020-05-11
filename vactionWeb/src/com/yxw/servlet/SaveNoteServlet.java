package com.yxw.servlet;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.yxw.bean.TravelNote;
import com.yxw.bean.User;
import com.yxw.dao.NoteDao;

public class SaveNoteServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       this.doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int flag=Integer.parseInt(request.getParameter("flag"));
		String url=null;
		TravelNote tvNote=new TravelNote();
		
		// 上传文件存放目录名称
		String dirName = "upload";

		// 上传文件存放目录(绝对路径)
		String saveDir = request.getSession().getServletContext().getRealPath(
				"upload");
		// 创建目录对象，判断是否存在：不存在就创建
		File dir = new File(saveDir);
		if (!dir.exists()) {
			dir.mkdir();
		}
		// 设置上传文件总大小
		int maxPostSize = 3 * 5 * 1024 * 1024;

		// 文件上传
		MultipartRequest multipart = new MultipartRequest(request, saveDir,
				maxPostSize, "utf-8");

		// 在文件上传过程中，获取提交的数据使用MultipartRequest对象来替换HttpServletRequest对象
		tvNote.setNtitle(multipart.getParameter("title").trim());
		tvNote.setNcontent(multipart.getParameter("content").trim());

		// 存储文件路径(相对路径)到数据库
		Enumeration enums = multipart.getFileNames();
		while (enums.hasMoreElements()) {
			String fileName=enums.nextElement().toString();
			File file = multipart.getFile(fileName);
			String saveName = "upload/" + file.getName();
			
			//图片路径
			if ("fpath".equals(fileName)) {
				tvNote.setNsendfmPath(saveName);
			}
		}
		
		//获取提交的数据
		User user=(User)request.getSession().getAttribute("user");
		tvNote.setNuno(user.getUno());
		
		NoteDao noteDao=new NoteDao();
		if(flag==1){
			System.out.println(tvNote);
			noteDao.save(tvNote);
			noteDao.updateUpoint(user.getUno());
			//重定向
			response.sendRedirect("QueryNoteServlet?type=sendNote&currentPage=1");
		}
		if(flag==2){
			//重定向
			System.out.println(tvNote);
			noteDao.saveToDraft(tvNote);
			response.sendRedirect("QueryNoteServlet?type=DraftNote&currentPage=1");
		}
	}

}
