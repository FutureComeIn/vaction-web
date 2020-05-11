<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>登录</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css"> 
    <script type="text/javascript">
    	<%
			String url=request.getParameter("url");
    		System.out.println("login.jsp界面:"+url);
    		if("UserServlet?type=exitUser".equals(url)){
    			url="index.jsp";
    		}
    		//System.out.println("login.jsp界面修改:"+url);
    		request.getSession().setAttribute("url",url);
    	%>

    	$(function(){
    		$(".submit").click(function(){
    			var nickname=$(".text").eq(0).val();
    			var psw=$(".text").eq(1).val();
    			if(nickname==null||nickname==""){
    				alert("昵称不能为空");
    				//聚集光标
    				$(".text").eq(0).focus();
    				return false;
    			}
    			if(psw==null||psw==""){
    				alert("密码不能为空");
    				$(".text").eq(1).focus();
    				return false;
    			}
    			document.loginForm.submit();
    		})
    	})
    </script>   
</head>
<body>

<!-------------------登录------------------->
<div id="log_register">
	
	<div class="lr_box">
		
		<div class="tag">
			<ul>
				<li><a class="cur" href="<%=path %>/qiantai/user/login.jsp">登录</a></li>
				<li><a href="<%=path %>/qiantai/user/register.jsp">注册</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<form action="<%=path %>/UserServlet?type=login" method="post" name="loginForm">
			
			<input type="hidden" value="" id="url" name="url"/>
			
			<table class="table_list">
				<tbody>
					<tr>
						<td><input class="text" name="nickname" type="text" placeholder="用户名"></td>
					</tr>
					<tr>
						<td><input class="text" name="psw" type="password" placeholder="您的密码"></td>
					</tr>
					<tr>
						<td>
							<label class="am-checkbox">
								<input type="checkbox" id="checkbox_a1" class="chk_1"> 
								<label for="checkbox_a1"></label> 记住密码
							</label>
							<a class="back" href="#">找回密码</a>
						</td>
					</tr>
					<tr>
						<td><input class="submit" type="button" value="登录"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</div>

</body>
</html>