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
import com.yxw.dao.GoodPhotoDao;
import com.yxw.dao.GoodsDao;

public class UpdateGoodsServlert extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
		int maxPostSize = 3 * 5 * 1024 * 1024;

		// �ļ��ϴ�
		MultipartRequest multipart = new MultipartRequest(request, saveDir,
				maxPostSize, "utf-8");

		// ���ļ��ϴ������У���ȡ�ύ������ʹ��MultipartRequest�������滻HttpServletRequest����
		
		int gno = Integer.parseInt(multipart.getParameter("gno"));
		Goods g = new GoodsDao().queryGoodsByNno(gno).get(0);
		g.setGname(multipart.getParameter("gname"));
		g.setGtype(multipart.getParameter("gtype"));
		g.setGplace(multipart.getParameter("gplace"));
		String gprice = multipart.getParameter("gprice").trim().toString();
		g.setGprice(Integer.parseInt(gprice.substring(0, gprice.indexOf("."))));
		g.setGdealcount(Integer.parseInt(multipart.getParameter("gdealcount")));
		g.setGpoint(Integer.parseInt(multipart.getParameter("gpoint")));

		List<String> pics = new ArrayList<String>();
		// �洢�ļ�·��(���·��)�����ݿ�
		Enumeration enums = multipart.getFileNames();
		int num1 = 0;
		int num2 = 0;
		
		//������Ʒ��Ų�ѯ��ƷͼƬ��Ϣ
		GoodPhoto gp=new GoodPhotoDao().queryGoodPhotoByPgno(gno).get(0);
		while (enums.hasMoreElements()) {
			try {
				String fileName = enums.nextElement().toString();
				File file = multipart.getFile(fileName);
				String saveName = dirName+"/" + file.getName();
				if ("gheadphotopathC".equals(fileName)) {
					g.setGheadphotopath(saveName);
				}
				if ("gdetailphotopathC".equals(fileName)) {
					g.setGdetailphotopath(saveName);
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
			} catch (Exception e) {
			}
		}

		//�����޸�
		if(new GoodsDao().updateGoods(g,gp)==2){
			response.getWriter().write("�޸ĳɹ���");
		}else{
			response.getWriter().write("�޸�ʧ�ܣ�");
		}

		

	}

}