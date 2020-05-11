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
		// 创建Goods对象
		Goods goods = new Goods();

		//创建存放商品图片GoodPhoto对象
		GoodPhoto gp = new GoodPhoto();
		
		// 上传文件存放目录名称
		String dirName = "upload";

		// 上传文件存放目录(绝对路径)
		String saveDir = request.getSession().getServletContext().getRealPath(dirName);
		// 创建目录对象，判断是否存在：不存在就创建
		File dir = new File(saveDir);
		if (!dir.exists()) {
			dir.mkdir();
		}
		// 设置上传文件总大小
		int maxPostSize = 7 * 5 * 1024 * 1024;

		// 文件上传
		MultipartRequest multipart = new MultipartRequest(request, saveDir,
				maxPostSize, "utf-8");

		// 在文件上传过程中，获取提交的数据使用MultipartRequest对象来替换HttpServletRequest对象
		goods.setGname(multipart.getParameter("gname"));
		goods.setGtype(multipart.getParameter("gtype"));
		goods.setGplace(multipart.getParameter("gplace"));
		goods.setGprice(Integer.parseInt(multipart.getParameter("gprice")));
		goods.setGdealcount(Integer.parseInt(multipart.getParameter("gdealcount")));
		goods.setGpoint(Integer.parseInt(multipart.getParameter("gpoint")));

		List<String> pics = new ArrayList<String>();
		// 存储文件路径(相对路径)到数据库
		Enumeration enums = multipart.getFileNames();
		while (enums.hasMoreElements()) {
			String fileName=enums.nextElement().toString();
			File file = multipart.getFile(fileName);
			String saveName = dirName+"/" + file.getName();
			
			//图片路径
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
		
		//添加商品信息和商品图片信息
		new GoodsDao().addGoods(goods,gp);
		response.getWriter().println("商品添加成功");
	}

}
