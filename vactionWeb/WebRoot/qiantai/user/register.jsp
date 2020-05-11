<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>注册</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css">    
    
    <script src="<%=path %>/js/jquery-1.8.2.min.js"> </script>
    <script type="text/javascript">
    	 $(function(){
    	 	$("#change").click(function(){
    	 		var date=new Date();
		 		$("#img").attr("src","<%=path %>/ImgServlet2?date="+date.getTime());
    	 	})
    	 	
    	 	
    	 	$(".submit:first").click(function(){
    	 		var count=0;
    	 		$input=$("input");
    	 		for(var i=0;i<$input.size()-2;i++){
	    	 		if(i==3||i==4||i==5){
	    	 			if($input.eq(i).attr("checked")!="checked"){
	    	 				count++;
	    	 			}
	    	 			if(count==3){
	    	 				alert("请填写完整信息再提交");
	    	 				return false;
	    	 			}
	    	 		}else{
	    	 			if($input.eq(i).val()==""||$input.eq(i).val()==null){
	    	 				alert("请填写完整信息再提交");
	    	 				return false;
	    	 			}
	    	 		}
	    	 		//密码
	    	 		if(i==2){
	    	 			var psw=$input.eq(i).val();
	    	 			
	    	 			var flag=psw.test("^[0-9A-Za-z]");
	    	 			alert(flag);
	    	 			if(flag==false){
	    	 				alert("密码为数字或英文字母组成");
	    	 				return;
	    	 			}
	    	 		}
	    	 	}
	    	 	document.myform.submit();
    	 	})

    	 })
    	 
		 	
		 
    	
    </script>
</head>
<body>

<!-------------------登录------------------->
<div id="log_register">
	
	<div  class="lr_box" style="position:absolute;top:300px;left:800px;width:440px;">
		
		<div class="tag">
			<ul>
				<li><a href="<%=path %>/qiantai/user/login.jsp">登录</a></li>
				<li><a class="cur" href="<%=path %>/qiantai/user/register.jsp">注册</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		
		<form name="myform" action="<%=path %>/UserServlet?type=register" method="post" enctype="multipart/form-data">
			<table class="table_list">
				<tbody>
					<tr>
						<td>
							我的头像:<img src="<%=path %>/images/user_head_pic.jpg"/> <br/>
							<input type="file" name="touxiang"/> 
						</td>
					</tr>
					<tr>
						<td><input class="text" style="height:30px;" name="nickname" type="text" placeholder="用户名"></td>
					</tr>
					<tr>
						<td><input class="text" style="height:30px;" name="password" type="password" placeholder="您的密码"></td>
					</tr>
					<tr>
						<td>
						         性别:&nbsp;&nbsp;&nbsp;
						         <input type="radio" name="sex" value="男"/>男&nbsp;&nbsp;
						         <input type="radio" name="sex" value="女"/>女&nbsp;&nbsp;
						         <input type="radio" name="sex" value="保密"/>保密
						</td>
					</tr>
					<tr>
						<td><input class="text" style="height:30px;" name="signature" type="text" placeholder="个性签名"></td>
					</tr>
					
					<!-- 添加图形验证码 -->
					<tr>
						<td >
						    <input style="width:50%;height:30px;" class="text" type="text" placeholder="验证码" name="yzm"/>&nbsp;&nbsp;
							<img id="img" src="<%=path %>/ImgServlet2"/> &nbsp;
							<a style="color:red;cursor: pointer;" id="change" href="javascript:;" >换一张</a>
						</td>
					</tr>

					<tr>
						<td> 
							<input class="submit" type="button" value="注册">&nbsp;
							<input class="submit" type="reset" value="重置">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>

</div>

</body>
</html>