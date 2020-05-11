<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人主页公共头部</title>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css">   
    
  </head>
  
  <body>
    	
	<!-------------------版头------------------->
	<div id="header">
	    <div class="cw1000">
	        <!-------------------logo------------------->
	        <div class="logo"><a title="" href="<%=path %>/index.jsp"><img alt="" src="<%=path %>/images/logo.jpg" /></a></div>
			<!-------------------导航------------------->
			<div class="nav">
				<ul>
				
					<li><a title="" class="cur" href="<%=path %>/index.jsp">首页</a><span>|</span></li>
	                <li><a class="tta" title="" href="<%=path %>/ScenicServlet?type=qt_select">孟津旅游</a><span>|</span></li>
	                <li><a title="" href="<%=path %>/QianQueryAllGoodsServlet">特产商城</a><span>|</span></li>
	                <li><a title="" href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=1">攻略游记</a></li>
					<div class="clear"></div>
				</ul>
			</div>
			<!-------------------用户------------------->
			<div class="user">
				<a class="user-hd" href="#">
					<img src="${user.utxPath }"/><b></b>
					<div class="clear"></div>
				</a>
				<div class="user-bd">
					<div class="integral"><img src="<%=path %>/images/integral_ico.png"/>当前积分 ${user.upoint }</div>
					<ul class="nav_sort">
						
						<li><a href="<%=path %>/qiantai/note/write_note.jsp"><i class="i2"></i>写游记</a></li>
					<li><a href="<%=path %>/QueryNoteByUserIdServlet"><i class="i9"></i>我的游记</a></li>
					<li><a href="<%=path %>/QueryCollectionServlet?currentPage=1"><i class="i3"></i>我的收藏</a></li>
					<li><a href="<%=path %>/qiantai/order/project_order.jsp"><i class="i4"></i>商品订单</a></li>
					<li><a href="<%=path %>/ScenicOrderTypeServlet?i=abc"><i class="i5"></i>旅游订单</a></li>
					<li><a href="<%=path %>/QueryCommentByNoServlet?currentPage=1"><i class="i6"></i>我的评论</a></li>
					<li><a href="<%=path %>/qiantai/user/my_info.jsp"><i class="i7"></i>设置</a></li>
					<li><a href="javascripte:;"><i class="i8"></i>退出</a></li>
					</ul>
				</div>
			</div>
	        <div class="clear"></div>
	    </div>
	</div>
	
	<!-----------------用户banner---------------->
	<div id="user_banner">
		<div class="pic">
			<a href="<%=path %>/qiantai/user/my_head.jsp">
				<img src="${user.utxPath }"/>
				<div>更换头像</div>
			</a>
		</div>
		<div class="con">
			<h2>${user.uname }</h2>
			<p>${user.usignature }</p>
		</div>
	</div>
	
	<!-----------------快捷导航---------------->
	<div id="quick_nav">
		<a href="<%=path %>/qiantai/note/write_note.jsp"><span class="ico2"><img src="<%=path %>/images/nav_ico2.png"/></span>发布游记</a>
	<a href="<%=path %>/QueryNoteByUserIdServlet"><span class="ico7"><img src="<%=path %>/images/nav_ico7.png"/></span>我的游记</a>
	<a href="<%=path %>/QueryCollectionServlet?currentPage=1"><span class="ico3"><img src="<%=path %>/images/nav_ico3.png"/></span>我的收藏</a>
	<a href="<%=path %>/qiantai/order/project_order.jsp"><span class="ico4"><img src="<%=path %>/images/nav_ico4.png"/></span>商品订单</a>
	<a href="<%=path %>/ScenicOrderTypeServlet?i=abc"><span class="ico5"><img src="<%=path %>/images/nav_ico5.png"/></span>旅游订单</a>
	<a href="<%=path %>/QueryCommentByNoServlet?currentPage=1"><span class="ico6"><img src="<%=path %>/images/nav_ico6.png"/></span>我的评论</a>
	</div>


  </body>
</html>
