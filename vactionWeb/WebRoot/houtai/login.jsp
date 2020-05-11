<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    
    <title>登录</title>
	<link rel="stylesheet" href="<%=path%>/houtai/lib/layui/css/layui.css" media="all" />
	<link rel="stylesheet" href="<%=path%>/houtai/css/login.css" />

  </head>
  
  <body class="beg-login-bg" background="<%=path%>/houtai/images/bg.jpg">
    <div class="beg-login-box">
			<header>
				<h1>欢迎登录</h1>
			</header>
			<div class="beg-login-main">
				<form action="<%=path %>/AdminServlet?type=login" class="layui-form" method="post" name="loginForm">
					<input name="__RequestVerificationToken" type="hidden" value="fkfh8D89BFqTdrE2iiSdG_L781RSRtdWOH411poVUWhxzA5MzI8es07g6KPYQh9Log-xf84pIR2RIAEkOokZL3Ee3UKmX0Jc8bW8jOdhqo81" />
                
                <!---->
                <div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe612;</i>
                    	</label>
						<select name=""> 
							<option value="0">用户名登录</option> 
							<option value="1">唯一标识登录</option> 
						</select> 
					</div>
                <!---->
                
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe612;</i>
                   		 </label>
						<input type="text" name="userName" lay-verify="userName" autocomplete="off" placeholder="请输入登录名" class="layui-input">
					</div>
					
					<div class="layui-form-item">
						<label class="beg-login-icon">
                        <i class="layui-icon">&#xe642;</i>
                    	</label>
						<input type="password" name="password" lay-verify="password" autocomplete="off" placeholder="请输入密码" class="layui-input">
					</div>
					
					<div class="layui-form-item">
						<div class="beg-pull-left beg-login-remember">
							<label>记住帐号？</label>
							<input type="checkbox" name="rememberMe" value="false" lay-skin="switch" checked title="记住帐号">
						</div>
						<div class="beg-pull-right">
							<button class="layui-btn layui-btn-primary" lay-submit lay-filter="login">
                            <i class="layui-icon">&#xe650;</i> 登录
                        	</button>
						</div>
						<div class="beg-clear"></div>
					</div>
				</form>
			</div>
			
		</div>
		
		<script type="text/javascript" src="<%=path%>/houtai/lib/layui/layui.js"></script>
		<script>
			layui.use(['layer', 'form'], function() {
					var layer = layui.layer,
					$ = layui.jquery,
					form = layui.form();
					
				form.on('submit(login)',function(data){
					var name=$(".layui-input").eq(1).val();
					var psw=$(".layui-input:last").val();
					if(name==""){
						alert("请输入登录名");
						$(".layui-input").eq(1).focus();
						return;
					}
					if(psw==""){
						alert("请输入密码");
						$(".layui-input:last").focus();
						return;
					}
					document.loginForm.submit();
				});
			});
		</script>
  </body>
</html>
