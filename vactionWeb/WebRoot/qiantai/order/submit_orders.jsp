<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>提交订单</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css">   
    
    <script type="text/javascript">
	  function down(){
	  	 var num = document.getElementById("num").value;
	  	 var price = document.getElementById("price").innerHTML;
	  	 if(num>0){
	  	 	num=num-1;
	  	 	document.getElementById("num").value=num;
	  	 }else{
	  	 	num=0;
	  	 	document.getElementById("num").value=num;
	  	 }
	  	 document.getElementById("Qprice").innerHTML=price*num;
	  	 document.getElementById("QGprice").innerHTML=price*num;
	  }
	  function add(){
	  	 var num = document.getElementById("num").value;
	  	 var price = document.getElementById("price").innerHTML;
	  	 document.getElementById("num").value=++num;
	  	 document.getElementById("Qprice").innerHTML=price*num;
	  	 document.getElementById("QGprice").innerHTML=price*num;
	  }
	  function connect(){
	  	 var radio = document.getElementsByName("radio3");
		 //alert(radio.length);
		 for(i=0;i<radio.length;i++){
			 if(radio[i].checked){
		 		document.getElementById("soname").value=radio[i].value.substring(0,radio[i].value.indexOf("+"));
		 		document.getElementById("sophone").value=radio[i].value.substring(radio[i].value.indexOf("+")+1);
		 	 }
		 }
		 $(".am-popup").attr("style","display:none");
	  } 
					
	  function submit(){
	  	 var uno=document.getElementById("uno").value;
	  	 
	  	 var sosno = ${requestScope.Senic2Data.sno};
	  	 var socount = document.getElementById("num").value;
	  	 var soprice = document.getElementById("price").innerHTML;
	  	 var socontactname = document.getElementById("soname").value;
	  	 var socontactmobile = document.getElementById("sophone").value;
	  	 var sodate = document.getElementById("sodate").innerHTML;
	  	 if(socontactname=="" || socontactmobile=="" ){
	  	 	alert("请输入联系人信息");
	  	 }else{
	  	 	var url="<%=path %>/Confirm_order_scenicServlet?sosno="+sosno+"&&socount="+socount+"&&soprice="+soprice+"&&socontactname="+socontactname+"&&socontactmobile="+socontactmobile+"&&sodate="+sodate+"&uno="+uno;
		 	window.location.href=url;
	  	 }
	  }
	</script>
	<script>
		$(function(){
			<% 
				Date date = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String sodate = sdf.format(date);
			%>
			var sodate = '<%=sodate%>';
			$("#sodate").html(sodate);
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

<!-----------------提交订单---------------->
<div id="submit_orders">
	<div class="cw1000">	
		<div class="main_title">
			<ul>
				<li style="width:35%;">商品信息</li>
				<li style="width:15%;">单价</li>
				<li style="width:30%;">数量</li>
				<li style="width:20%;">总价</li>
			</ul>
		</div>
		<div class="list_box">
			<ul>
				<li>
					<div class="con">
						<div class="info" style="width:35%;">
							<div class="pic"><a href="#"><img width=53 height=53 src="${Senic2Data.sheadpath}" /></a></div>
							<div class="name">
								<a href="#">${requestScope.Senic2Data.sname}</a>
								<p>下单日期：<a id="sodate"></a></p>
							</div>
							<div class="clear"></div>
						</div>
						<div class="price" style="width:15%;"><label id="price">${requestScope.Senic2Data.sprice}</label></div>
						<div class="number" style="width:30%;">
							<div class="Spinner">
								<a  class="DisDe" href="javascript:void(0)" onclick="down()"><i>-</i></a>
								<input readonly="true" id="num" class="Amount" value="1" autocomplete="off" maxlength="3" />
								<a class="Increase" href="javascript:void(0)" onclick="add()"><i>+</i></a>
							</div>
						</div>
						
						<div class="price" style="width:20%;"><span id="Qprice">${requestScope.Senic2Data.sprice}</span></div>
						<div class="clear"></div>
					</div>
				</li>
				
			</ul>
		</div>
		<!-----------------景区信息---------------->
		<div class="info_mo">
			<table>
				<tr>
					<th colspan="2">景区信息</th>
				</tr>
				<tr>
					<td>景区名称：${requestScope.Senic2Data.sname}</td>
					<td>联系方式：${requestScope.Senic2Data.smobile}</td>
				</tr>
				<tr>
					<td>开放时间：${requestScope.Senic2Data.sopendate}</td>
					<td>详细地址：${requestScope.Senic2Data.saddress}</td>
				</tr>
			</table>
		</div>
		
		<div class="contact">
			<ul>
				<li class="title">
					<h2><i class="am-icon-user"></i> 联系人信息</h2>
					<a href="#" class="add_book" data-am-modal="{target: '#my-popup'}">选择已有联系人</a>
					<div class="am-popup" id="my-popup">
					  <div class="am-popup-inner">
						<div class="am-popup-hd">
						  <h4 class="am-popup-title">联系人列表</h4>
						  <span data-am-modal-close
								class="am-close">&times;</span>
						</div>
						<div class="am-popup-bd">
						  <ul>
						 	 <c:forEach items="${clist }" var="contact">
								<li><i class="am-icon-user"></i><span class="name">${contact.cname }</span>${contact.cmobile }
									<label class="am-radio-inline">
								 	 <input id="connect" type="radio" name="radio3" value="${contact.cname }+${contact.cmobile }" data-am-ucheck>
									</label>
								</li>
							</c:forEach>
						  </ul>
						  <input class="submit" type="submit" onclick="connect()" value="确定"/>
						</div>
					  </div>
					</div>
					
					
				</li>
				<li>
					<input type="hidden" name="uno" id="uno" value="${user.uno }" />
					<span class="name">姓名：</span>
					<input id="soname" type="text" class="text" placeholder="请填写真实姓名">
				</li>
				<li>
					<span class="name">手机：</span>
					<input id="sophone" type="text"  class="text" placeholder="请填写手机号">
					<p>（消费时所需的兑换码会发送至您的手机，请您保持手机畅通）</p>
				</li>
			</ul>
			
		</div>
		<div class="tip">
			<h2>供应商信息</h2>
			<p>本产品由河洛旅游或其关联公司旅行社及具有资质的合作旅行社提供相关服务</p>
		</div>
		<div class="calculation">
			<a onclick="submit()">提交订单</a>
			<span>合计（含运费0.00元）： ￥<b id=QGprice>${requestScope.Senic2Data.sprice}</b></span>
			
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