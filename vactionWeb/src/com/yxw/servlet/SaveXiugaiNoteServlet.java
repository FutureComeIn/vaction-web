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
import com.yxw.bean.TravelNote;
import com.yxw.dao.NoteDao;

public class SaveXiugaiNoteServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 上传文件存放目录名称
		String dirName = "upLoad";

		// 上传文件存放目录(绝对路径)
		String saveDir = request.getSession().getServletContext().getRealPath(
				"upLoad");
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
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		TravelNote travelNote = new NoteDao().queryNoteByNoteId(nno).get(0);
		travelNote.setNtitle(multipart.getParameter("title").trim());
		travelNote.setNcontent(multipart.getParameter("content").trim());

		// 存储文件路径(相对路径)到数据库
		Enumeration enums = multipart.getFileNames();
		
		//根据商品编号查询商品图片信息
		while (enums.hasMoreElements()) {
			try {
				String fileName = enums.nextElement().toString();
				File file = multipart.getFile(fileName);
				String saveName = "upload/" + file.getName();
				if ("fpath".equals(fileName)) {
					travelNote.setNsendfmPath(saveName);
				}
			} catch (Exception e) {
			}
		}

		System.out.println(travelNote);
		
		//进行修改
		new NoteDao().updateXiugaiNote(travelNote);
		response.sendRedirect(request.getContextPath()+"/QueryNoteServlet?type=DraftNote&currentPage=1");
		
		
		
		
	}

}
