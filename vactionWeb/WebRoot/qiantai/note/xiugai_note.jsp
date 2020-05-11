<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>修改游记</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css">
     <script src="<%=path %>/js/jquery-1.8.2.min.js"></script>
    <script>
        $(function(){
        	$("#express").click(function(){
        		alert(1);
        		$("#myform").attr("action","${pageContext.request.contextPath }/SaveNoteServlet?flag=1");
        		document.myform.submit();
        	});
        	$("#save").click(function(){
        		$("#myform").attr("action","${pageContext.request.contextPath }/SaveXiugaiNoteServlet?nno=${requestScope.travelNote.nno}");
        		document.myform.submit();
        	});
        	
        	$("#exit").click(function(){
        	alert(1);
        		$("#myform").attr("action","${pageContext.request.contextPath }/QueryNoteServlet?type=DraftNote&currentPage=1");
        		document.myform.submit();
        	});
        })
    </script>    
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
				<li><a title="" class="cur" href="<%=path %>/index.jsp">首页</a></li>
	                <li><a class="tta" title="" href="<%=path %>/ScenicServlet?type=qt_select">孟津旅游</a></li>
	                <li><a title="" href="<%=path %>/QianQueryAllGoodsServlet">特产商城</a></li>
	                <li><a title="" href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=1">攻略游记</a></li>
				
				<div class="clear"></div>
			</ul>
		</div>
		<!-------------------用户------------------->
		<div class="user">
			<a class="user-hd" href="#">
				<img src="<%=path %>/images/user_head_pic.jpg"/><b></b>
				<div class="clear"></div>
			</a>
			<div class="user-bd">
				<div class="integral"><img src="<%=path %>/images/integral_ico.png"/>当前积分 ${user.upoint }</div>
				<ul class="nav_sort">
								<li><a href="<%=path %>/qiantai/note/write_note.jsp"><i class="i2"></i>写游记</a></li>
								<li><a href="<%=path %>/QueryNoteByUserIdServlet"><i class="i9"></i>我的游记</a></li>
								<li><a href="<%=path %>/QueryCollectionServlet?currentPage=1"><i class="i3"></i>我的收藏</a></li>
								<li><a href="<%=path %>/qiantai/order/project_order.jsp"><i class="i4"></i>商品订单</a></li>
								<li><a href="<%=path %>/qiantai/order/scenic_order.jsp"><i class="i5"></i>旅游订单</a></li>
								<li><a href="<%=path %>/QueryCommentByNoServlet?currentPage=1"><i class="i6"></i>我的评论</a></li>
								<li><a href="<%=path %>/qiantai/user/my_info.jsp"><i class="i7"></i>设置</a></li>
								<li><a href="#"><i class="i8"></i>退出</a></li>
				</ul>
			</div>
		</div>
        <div class="clear"></div>
    </div>
</div>
<!-----------------发布封面---------------->
<form id="myform" action="" method="post" enctype="multipart/form-data" name="myform">
<div id="write_cover">
	<div class="replace_name"><div class="cw1000"><input type="text" name="title" placeholder="填写游记标题" maxlength="48" value="${requestScope.travelNote.ntitle}"/></div></div>
</div>
<!-----------------框架---------------->
<div class="cw1000">
	<!--<img style="margin-top:30px;" src="<%=path %>/images/bjq.jpg"/>  -->
	<textarea rows="14" cols="100" name="content">
		${requestScope.travelNote.ncontent}
	</textarea>
	<input type="file" name="fpath"/></br>
	<!-----------------发布按钮---------------->
	<div id="write_button">
		<a class="exit" id="exit" href="#">取消</a>
		<input class="express" id="express" type="button" value="发表" />
		<span>或</span>
		<input class="save" id="save" type="button"  value="保存" />
		<div class="clear"></div>
	</div>
</div>
</form>
<!-----------------版底---------------->
<div id="footer">
	<p>河洛文化旅游发展有限公司 版权所有</p>
	<p>Copyright 2016 zgqygc.com All Rights Reserved | 豫ICP备10000000号　技术支持：闪迅</p>
</div>
</body>
</html>