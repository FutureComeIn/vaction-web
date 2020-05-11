<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>确认订单2</title>
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
    			 var radio = document.getElementsByName("radio3");
		 		 //alert(radio.length);
				 for(i=0;i<radio.length;i++){
				 	if(radio[i].checked){
		 		 		var ppaymethod = radio[i].value;
		 		 		//alert(ppaymethod);
		 		 	}
		 		}
    			var psosono = ${requestScope.Comfirm_order_scenic.sono };
    			var ptype = "已付款";
    			if(ppaymethod==null){
    				alert("请选择付款方式");
    			}else{
    				alert("支付成功");
    					var num = <%= request.getParameter("num")%>;
    					var url="<%=path %>/ScenicOrderPayServlet?ppaymethod="+ppaymethod+"&&ptype="+ptype+"&&psosono="+psosono+"&&num="+num;
		 				window.location.href=url;
    			}
    			
    		});
    	})
    	
    </script> 
</head>
<body>

<!-------------------版头------------------->
<div id="header">
    <div class="cw1000">
        <!-------------------logo------------------->
        <div class="logo"><a title="" href="<%=path %>/index.jsp"><img alt="" src="images/logo.jpg" /></a></div>
		<!-------------------头部导航------------------->
		<div class="head_title">
			提交订单
		</div>
		<!-------------------用户------------------->
		
		<div class="user">
			<a class="user-hd" href="#">
				<img src="<%=path %>/images/user_head_pic.jpg" onMouseMove="show1()"/><b></b>
				<div class="clear"></div>
			</a>
			<div class="user-bd" id="userInfo">
				<div class="integral"><img src="<%=path %>/images/integral_ico.png"/>当前积分${user.upoint }</div>
				<ul class="nav_sort">
					<li><a href="<%=path %>/qiantai/note/write_note.jsp"><i class="i2"></i>写游记</a></li>
					<li><a href="<%=path %>/QueryNoteByUserIdServlet"><i class="i9"></i>我的游记</a></li>
					<li><a href="<%=path %>/QueryCollectionServlet?currentPage=1"><i class="i3"></i>我的收藏</a></li>
					<li><a href="<%=path %>/qiantai/order/project_order.jsp"><i class="i4"></i>商品订单</a></li>
					<li><a href="<%=path %>/ScenicOrderTypeServlet?i=abc"><i class="i5"></i>旅游订单</a></li>
					<li><a href="<%=path %>/QueryCommentByNoServlet?currentPage=1"><i class="i6"></i>我的评论</a></li>
					<li><a href="<%=path %>/qiantai/user/my_info.jsp"><i class="i7"></i>设置</a></li>
					<li><a href="#"><i class="i8"></i>退出</a></li>
				</ul>
			</div>
		</div>
        <div class="clear"></div>
    </div>
</div>
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
		
		<div class="pay_method">
			<h2>支付方式</h2>
			<ul>
				<li><a class="cur">支付宝支付</a><span><input type="radio" name="radio3" value="支付宝支付"/>← 选择支付宝支付商品金额</span></li>
				<li><a >微信支付</a><span><input type="radio" name="radio3" value="微信支付"/>← 选择微信钱包支付商品金额</span></li>
			</ul>
		</div>
		<div class="calculation">
		
			<input class="submit" type="submit" href="#" value="结算" />
			<span>应付金额： <b id="QGprice1"></b></span>
			
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