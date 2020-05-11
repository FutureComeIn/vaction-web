<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>我的收藏</title>
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
         	$(".deleteById").click(function(){
         		if(confirm("你确定删除吗？")){
         			var id=$(this).parent().find("input").val();
         			window.location.href="<%=path %>/DeleteCollectionServlet?cno="+id;
         		}
         	});
         })
     </script>         
</head>
<body>

<!-------------------版头------------------->
<jsp:include page="/qiantai/user/userHead.jsp" flush="true"></jsp:include>

<!-----------------框架---------------->
<div class="cw1000">
	<div class="public_box pd30">
		<div class="list_title">
			<h2>我的收藏</h2>
		</div>
		<!-----------------游记列表---------------->
		<div class="note_list">
			<ul>
			<c:forEach items="${MycollectionList}" var="Mycollection">
				<li class="pd_r150">
					<div class="pic"><img alt="" src="${Mycollection.nsendfmPath }"/></div>
					<div class="con">
						<a href="<%=path %>/queryContentOfNoteServlet?nno=${Mycollection.cnno}"><h3>${Mycollection.ntitle }</h3></a>
						<div class="user">
							<span><img src="<%=path %>/images/user_head_pic.jpg" />作者：<font>${Mycollection.uname }</font></span>
							<span>${Mycollection.cdate }</span>
						</div>
						<p>${Mycollection.ncontent }</p>
					</div>
					<div class="operation">
						<a href="#" class="deleteById">
						<input type="hidden"  value="${Mycollection.cno}"/>
						<i class="del_ico"></i>删除</a>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
	<div class="div1" align="center">
                <a href="<%=path %>/QueryCollectionServlet?currentPage=1">首页</a>
			     <a href="<%=path %>/QueryCollectionServlet?currentPage=${(currentPage-1)>1?(currentPage-1):1}">上一页</a>
			     <a href="<%=path %>/QueryCollectionServlet?currentPage=${currentPage<totalPage?(currentPage+1):currentPage}">下一页</a>
			     <a href="<%=path %>/QueryCollectionServlet?currentPage=${requestScope.totalPage}">末页</a>
</div>
</div>
<!-----------------版底---------------->
<div id="footer">
	<p>河洛文化旅游发展有限公司 版权所有</p>
	<p>Copyright 2016 zgqygc.com All Rights Reserved | 豫ICP备10000000号　技术支持：闪迅</p>
</div>
</body>
</html>