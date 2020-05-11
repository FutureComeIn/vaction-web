<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>景区订单</title>
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
    		$("#allOrder").click(function(){
    			$("#allOrder").attr("class","cur");
    			$("#payOrder").removeAttr("class");
    			var i="abc";
    			window.location.href="<%=path%>/ScenicOrderTypeServlet?i="+i;
    		});
    		$("#payOrder").click(function(){
    			$("#payOrder").attr("class","cur");
    			$("#allOrder").removeAttr("class");
    			var i="def"
    			window.location.href="<%=path%>/ScenicOrderTypeServlet?i="+i;
    		});
    	})
    	
    	function change(){
    		if('${num}'==2){
    			$("#payOrder").attr("class","cur");
    		}else{
    			$("#allOrder").attr("class","cur");
    		}
    		
    		
    		var type1=document.getElementsByName("type1");
    		var type2=document.getElementsByName("type2");
    		for(var i=0;i<$(".haha").size();i++){
    			if($(".haha").eq(i).html()=="已付款"){
	    			type1[i].style.display="";
	    			type2[i].style.display="none";
	    		}else{
	    			type2[i].style.display="";
	    			type1[i].style.display="none";
	    		}
    		}
    		
    	}	
    	function del(sono){
    		if(confirm("您确认删除吗")){
    			window.location.href="<%=path %>/DeleteSOrderServlet?sono="+sono;
    		}
    		
    	}
    </script>
</head>
<body onload="change()">

	<jsp:include flush="true" page="/qiantai/user/userHead.jsp"></jsp:include>
	
	<!-----------------框架---------------->
<div class="cw1000">
	<div class="public_box pd10">
		<div class="list_title">
			<h2>旅游订单</h2>
		</div>
		<div class="public_tag">
			<ul>
				<li><a id="allOrder" href="javascript:;" >全部订单</a></li>
				<li><a id="payOrder" href="javascript:;" >待付款</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<!-----------------景区订单---------------->
		<div class="order_list">
			<div class="column_title">
				<ul>
					<li style="width:35%;">订单信息</li>
					<li style="width:10%;">数量</li>
					<li style="width:10%;">单价</li>
					<li style="width:10%;">总价</li>
					<li style="width:20%;">订单状态</li>
					<li style="width:15%;">操作</li>
				</ul>
			</div>
			<div class="list_con">
				<ul>
					<c:forEach items="${scenicQueryOrder}" var="ScenicOrder">
					<li>
						<div class="serial">订单编号：${ScenicOrder.sono }<a href="javascript:;" onclick="del(${ScenicOrder.sono })"><i class="del"></i>删除</a></div>
						<div class="cont">
							<div class="con">
								<div class="info" style="width:35%;">
									<div class="pic"><a href="#"><img width=53 height=53 src="<%=path %>/${ScenicOrder.sheadpath }" /></a></div>
									<div class="name">
										<a href="#">${ScenicOrder.sname }</a>
										<p>下单日期：${ScenicOrder.sodate }</p>
									</div>
									<div class="clear"></div>
								</div>
								<div class="number" style="width:10%;">x${ScenicOrder.socount }</div>
								<div class="price" style="width:10%;">￥${ScenicOrder.soprice }</div>
								<div class="m_price" style="width:10%;"><div class="middle">￥${ScenicOrder.ppaymoney }</div></div>
								<div class="state" style="width:20%;">
									<div class="middle">
										<p id="ptype" class="haha">${ScenicOrder.ptype }</p>
										<a href="<%=path %>/CheckSOMasServlet?sono=${ScenicOrder.sono}&&sosno=${ScenicOrder.sosno}">订单详情</a>
									</div>
								</div>
								<div  id="type1" name="type1" class="operation" style="width:15%;">
									<div class="middle">
										<a class="evaluation" href="#"></a>
									</div>
								</div>
								<div id="type2" name="type2" class="operation" style="width:15%;">
									<div class="middle">
										<a class="buy" href="<%=path %>/PayScenicOrderServlet?sono=${ScenicOrder.sono}&&sosno=${ScenicOrder.sosno}">去付款</a>
									</div>
								</div>
								<div class="clear"></div>
							</div>
						</div>
					</li>
					</c:forEach>
				</ul>
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