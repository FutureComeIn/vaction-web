<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>我的头像</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css">    
    
    <script type="text/javascript">
    	$(function(){
    		$(".save").click(function(){
    			if($(".file").val()==null||$(".file").val()==""){
    				alert("请选择替换的头像");
    				return false;
    			}
    			document.myform.submit();
    		})
    	})
    </script>
</head>
<body>
	<jsp:include page="/qiantai/user/userHead.jsp" flush="true"></jsp:include>
<!-----------------框架---------------->
<div class="cw1000">
	<div class="w280 fl">
		<div class="public_box">
			<!-----------------设置导航---------------->
			<div id="set_nav">
				<ul>
					<li><a href="<%=path %>/qiantai/user/my_info.jsp"><i class="ico1"></i>我的信息</a></li>
					<li><a class="cur" href="<%=path %>/qiantai/user/my_head.jsp"><i class="ico2"></i>我的头像</a></li>
					<li><a href="<%=path %>/UserServlet?type=select_contact&uno=${user.uno}"><i class="ico3"></i>常用联系人</a></li>
					<li><a href="<%=path %>/qiantai/user/security.jsp"><i class="ico4"></i>修改密码</a></li>
				</ul>
			</div>
		</div>	
	</div>
	<div class="w700 fr">
		<div class="public_box">
			<!-----------------我的头像---------------->
			<div id="set_box">
			
				<form name="myform" method="post" action="<%=path %>/UserServlet?type=updateTx" enctype="multipart/form-data">
				<div class="title"><h2>我的头像</h2></div>
				<div id="my_head">
					<div class="pic"><img src="${user.utxPath }"/></div>
						<input type="hidden" name="uno" value="${user.uno }" /> 
					<input class="file" type="file" name="touxiang" /> 
				</div>
				<div class="operation">
					<input type="button" class="save" value="保存" />
				</div>
				</form>
				
			</div>
		</div>	
	</div>
	<div class="clear"></div>
</div>
<!-----------------版底---------------->
<div id="footer">
	<p>河洛文化旅游发展有限公司 版权所有</p>
	<p>Copyright 2016 zgqygc.com All Rights Reserved | 豫ICP备10000000号　技术支持：闪迅</p>
</div>
</body>
</html>