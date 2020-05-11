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
		
		// �ϴ��ļ����Ŀ¼����
		String dirName = "upload";

		// �ϴ��ļ����Ŀ¼(����·��)
		String saveDir = request.getSession().getServletContext().getRealPath(
				"upload");
		// ����Ŀ¼�����ж��Ƿ���ڣ������ھʹ���
		File dir = new File(saveDir);
		if (!dir.exists()) {
			dir.mkdir();
		}
		// �����ϴ��ļ��ܴ�С
		int maxPostSize = 3 * 5 * 1024 * 1024;

		// �ļ��ϴ�
		MultipartRequest multipart = new MultipartRequest(request, saveDir,
				maxPostSize, "utf-8");

		// ���ļ��ϴ������У���ȡ�ύ������ʹ��MultipartRequest�������滻HttpServletRequest����
		tvNote.setNtitle(multipart.getParameter("title").trim());
		tvNote.setNcontent(multipart.getParameter("content").trim());

		// �洢�ļ�·��(���·��)�����ݿ�
		Enumeration enums = multipart.getFileNames();
		while (enums.hasMoreElements()) {
			String fileName=enums.nextElement().toString();
			File file = multipart.getFile(fileName);
			String saveName = "upload/" + file.getName();
			
			//ͼƬ·��
			if ("fpath".equals(fileName)) {
				tvNote.setNsendfmPath(saveName);
			}
		}
		
		//��ȡ�ύ������
		User user=(User)request.getSession().getAttribute("user");
		tvNote.setNuno(user.getUno());
		
		NoteDao noteDao=new NoteDao();
		if(flag==1){
			System.out.println(tvNote);
			noteDao.save(tvNote);
			noteDao.updateUpoint(user.getUno());
			//�ض���
			response.sendRedirect("QueryNoteServlet?type=sendNote&currentPage=1");
		}
		if(flag==2){
			//�ض���
			System.out.println(tvNote);
			noteDao.saveToDraft(tvNote);
			response.sendRedirect("QueryNoteServlet?type=DraftNote&currentPage=1");
		}
	}

}
