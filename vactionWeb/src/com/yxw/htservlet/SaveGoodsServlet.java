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
import com.yxw.bean.GoodPhoto;
import com.yxw.bean.Goods;
import com.yxw.dao.GoodsDao;

public class SaveGoodsServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// ����Goods����
		Goods goods = new Goods();

		//���������ƷͼƬGoodPhoto����
		GoodPhoto gp = new GoodPhoto();
		
		// �ϴ��ļ����Ŀ¼����
		String dirName = "upload";

		// �ϴ��ļ����Ŀ¼(����·��)
		String saveDir = request.getSession().getServletContext().getRealPath(dirName);
		// ����Ŀ¼�����ж��Ƿ���ڣ������ھʹ���
		File dir = new File(saveDir);
		if (!dir.exists()) {
			dir.mkdir();
		}
		// �����ϴ��ļ��ܴ�С
		int maxPostSize = 7 * 5 * 1024 * 1024;

		// �ļ��ϴ�
		MultipartRequest multipart = new MultipartRequest(request, saveDir,
				maxPostSize, "utf-8");

		// ���ļ��ϴ������У���ȡ�ύ������ʹ��MultipartRequest�������滻HttpServletRequest����
		goods.setGname(multipart.getParameter("gname"));
		goods.setGtype(multipart.getParameter("gtype"));
		goods.setGplace(multipart.getParameter("gplace"));
		goods.setGprice(Integer.parseInt(multipart.getParameter("gprice")));
		goods.setGdealcount(Integer.parseInt(multipart.getParameter("gdealcount")));
		goods.setGpoint(Integer.parseInt(multipart.getParameter("gpoint")));

		List<String> pics = new ArrayList<String>();
		// �洢�ļ�·��(���·��)�����ݿ�
		Enumeration enums = multipart.getFileNames();
		while (enums.hasMoreElements()) {
			String fileName=enums.nextElement().toString();
			File file = multipart.getFile(fileName);
			String saveName = dirName+"/" + file.getName();
			
			//ͼƬ·��
			if ("gheadphotopath".equals(fileName)) {
				goods.setGheadphotopath(saveName);
			}
			if ("gdetailphotopath".equals(fileName)) {
				goods.setGdetailphotopath(saveName);
			}
			if ("gppath1".equals(fileName)) {
				gp.setGppath1(saveName);
			}
			if ("gppath2".equals(fileName)) {
				gp.setGppath2(saveName);
			}
			if ("gppath3".equals(fileName)) {
				gp.setGppath3(saveName);
			}
			if ("gppath4".equals(fileName)) {
				gp.setGppath4(saveName);
			}
			if ("gppath5".equals(fileName)) {
				gp.setGppath5(saveName);
			}
		}
		
		//System.out.println(goods);
		//System.out.println(gp);
		
		//�����Ʒ��Ϣ����ƷͼƬ��Ϣ
		new GoodsDao().addGoods(goods,gp);
		response.getWriter().println("��Ʒ��ӳɹ�");
	}

}
