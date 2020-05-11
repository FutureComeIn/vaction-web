package com.yxw.servlet;

import java.awt.image.RenderedImage;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yxw.util.CodeUtil;



public class ImgServlet2 extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//根据验证码生成类获取 验证的map(即产生一个图像验证码)
		Map<String,Object> map=CodeUtil.generateCodeAndPic();
		String code=map.get("code").toString(); //获取验证码值

		request.getSession().setAttribute("code",code);
		//System.out.println(request.getSession().getId());
		    //18B91D0C21BE1375D3553314AF31AB34

		
		//将验证码BufferedImage对象写入响应流
		ServletOutputStream opt=response.getOutputStream();
		ImageIO.write((RenderedImage)map.get("codePic"),"jpeg",opt);
		opt.close();
	}

}
