<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.bean.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>我的信息</title>
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
    		<%
    			User user=(User)request.getSession().getAttribute("user");
    			String sex=user.getUsex();
    			if("男".equals(sex)){
    		%>
    				$(".radio:first").attr("checked","checked");
    		<%
    			}else if("女".equals(sex)){
    		%>
    				$(".radio").eq(1).attr("checked","checked");
    		<%
    			}else{
    		%>	
    				$(".radio:last").attr("checked","checked");
    		<%
    			}
    		%>
    		
    		$(".save").click(function(){
    			var count=0;
    			if($("input:first").val()==""||$("input:first").val()==null){
    				alert("请填写完整信息..");
    				return false;
    			}
    			for(var i=1;i<$(".radio").size()-1;i++){
    				if($(".radio").eq(i).attr("checked")!="checked"){
	    	 				count++;
	    	 		}
    	 			if(count==3){
    	 				alert("请填写完整信息..");
    	 				return false;
    	 			}
    			}
    			if($("textarea").val()==""||$("textarea").val()==null){
    				alert("请填写完整信息..");
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
					<li><a class="cur" href="<%=path %>/qiantai/user/my_info.jsp"><i class="ico1"></i>我的信息</a></li>
					<li><a href="<%=path %>/qiantai/user/my_head.jsp"><i class="ico2"></i>我的头像</a></li>
					<li><a href="<%=path %>/UserServlet?type=select_contact&uno=${user.uno}"><i class="ico3"></i>常用联系人</a></li>
					<li><a href="<%=path %>/qiantai/user/security.jsp"><i class="ico4"></i>修改密码</a></li>
				</ul>
			</div>
		</div>	
	</div>
	<div class="w700 fr">
		<div class="public_box">
			<!-----------------我的信息---------------->
			<div id="set_box">
				<form action="<%=path %>/UserServlet?type=updateInfo" name="myform" method="post">
					<input type="hidden" name="uno" value="${user.uno }"/>
				<div class="title"><h2>我的信息</h2></div>
				<table class="table_list">
					<tr>
						<th>用户名：</th>
						<td><input class="text" type="text" value="${user.uname }" name="name"/></td>
					</tr>
					<tr>
						<th>性别：</th>
						<td>
							<label class="am-radio">
								<input class="radio" type="radio" name="radio3" value="" data-am-ucheck> 男
							</label>
							<label class="am-radio">
								<input class="radio" type="radio" name="radio3" value="" data-am-ucheck> 女
							</label>
							<label class="am-radio">
								<input class="radio" type="radio" name="radio3" value="" data-am-ucheck> 保密
							</label>
						</td>
					</tr>
					<tr>
						<th>个人签名：</th>
						<td><textarea name="signature" placeholder="例：一场说走就走的旅行，不必在乎终点！">${user.usignature }</textarea></td>
					</tr>
				</table>
				<div class="operation"><input type="button" class="save" value="更新" /></div>
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