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
		// �ϴ��ļ����Ŀ¼����
		String dirName = "upLoad";

		// �ϴ��ļ����Ŀ¼(����·��)
		String saveDir = request.getSession().getServletContext().getRealPath(
				"upLoad");
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
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		TravelNote travelNote = new NoteDao().queryNoteByNoteId(nno).get(0);
		travelNote.setNtitle(multipart.getParameter("title").trim());
		travelNote.setNcontent(multipart.getParameter("content").trim());

		// �洢�ļ�·��(���·��)�����ݿ�
		Enumeration enums = multipart.getFileNames();
		
		//������Ʒ��Ų�ѯ��ƷͼƬ��Ϣ
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
		
		//�����޸�
		new NoteDao().updateXiugaiNote(travelNote);
		response.sendRedirect(request.getContextPath()+"/QueryNoteServlet?type=DraftNote&currentPage=1");
		
		
		
		
	}

}
