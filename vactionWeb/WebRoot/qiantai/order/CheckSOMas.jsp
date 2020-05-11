<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css">   
    
    <script>
    	$(function(){
    		var srpice = ${requestScope.Senic3Data.sprice };
    		var socount= ${requestScope.Comfirm_order_scenic.socount };
    		$("#QGprice").html('￥'+srpice*socount);
    		$("#QGprice1").html('￥'+srpice*socount);
    		
    		$(".submit").click(function(){
    			var url="<%=path %>/ScenicOrderServlet?";
		 		window.location.href=url;
    		});
    	})
    	
    </script> 
</head>
<body>

<!-------------------版头------------------->
<jsp:include flush="true" page="/qiantai/user/userHead.jsp"></jsp:include>

<!-----------------确认订单---------------->
<div id="confirm_order">
	<div class="cw1000">	

		

		<!-----------------景区信息---------------->
		<div class="info_mo">
			<table>
				<tr>
					<th class="cwt">商品信息</th>
					<th class="cwt">单价</th>
					<th class="cwt">数量</th>
					<th class="cwt">总价</th>
				</tr>
				<tr>
					<td><a href="#"><img class="pic" width=53 height=53 src="${requestScope.Senic3Data.sheadpath }" />${requestScope.Senic3Data.sname }</a></td>
					<td class="cwt">￥${requestScope.Senic3Data.sprice }</td>
					<td class="cwt">x${requestScope.Comfirm_order_scenic.socount }</td>
					<td id="QGprice" class="cwt"></td>
				</tr>
			</table>
		</div>
		<!-----------------景区信息---------------->
		<div class="info_mo">
			<table>
				<tr>
					<th colspan="2">景区信息</th>
				</tr>
				<tr>
					<td>景区名称：${requestScope.Senic3Data.sname }</td>
					<td>联系方式：${requestScope.Senic3Data.smobile }</td>
				</tr>
				<tr>
					<td>开放时间：${requestScope.Senic3Data.sopendate }</td>
					<td>详细地址：${requestScope.Senic3Data.saddress }</td>
				</tr>
			</table>
		</div>
		
			
		<!-----------------景区信息---------------->
		<div class="info_mo">
			<table>
				<tr>
					<th colspan="2">联系人信息</th>
				</tr>
				<tr>
					<td>报名人：${requestScope.Comfirm_order_scenic.socontactname }</td>
					<td>手机号：${requestScope.Comfirm_order_scenic.socontactmobile }</td>
				</tr>
			</table>
		</div>
		<div class="calculation">
			<input class="submit" type="submit" href="#" value="确定" />	
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