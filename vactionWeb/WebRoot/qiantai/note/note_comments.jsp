<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>游记评论</title>
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
         			window.location.href="<%=path %>/DeleteCommentServlet?cno="+id;
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
		<div class="public_tag">
			<ul>
				<li><a class="cur" href="<%=path %>/QueryCommentByNoServlet?currentPage=1">游记评论</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<!-----------------游记评论---------------->
		<div class="comments_list">
			<ul>
			  <c:forEach items="${MycommentList}" var="Mycomment">
				<li class="pd_r150">
					<div class="note">
						<div class="pic"><img src="<%=path %>/images/user_head_pic.jpg"/></div>
						<div class="con">
							<a href="<%=path %>/queryContentOfNoteServlet?nno=${Mycomment.cobjectno}"><h3>${Mycomment.ntitle }</h3></a>
							<p>作者：<span>${Mycomment.uname }</span><label>${Mycomment.cdate }</label></p>
						</div>
					</div>
					<div class="text">
						<p>我评论：${Mycomment.ccontent }</p>
					</div>
					<div class="del" style="top:65px;">
						<a href="#" class="deleteById">
						<input type="hidden"  value="${Mycomment.cno}"/>
						<i class="del_ico"></i>删除评论</a>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
	<div class="div1" align="center">
                <a href="<%=path %>/QueryCommentByNoServlet?currentPage=1">首页</a>
			     <a href="<%=path %>/QueryCommentByNoServlet?currentPage=${(currentPage-1)>1?(currentPage-1):1}">上一页</a>
			     <a href="<%=path %>/QueryCommentByNoServlet?currentPage=${currentPage<totalPage?(currentPage+1):currentPage}">下一页</a>
			     <a href="<%=path %>/QueryCommentByNoServlet?currentPage=${requestScope.totalPage}">末页</a>
</div>
</div>
<!-----------------版底---------------->
<div id="footer">
	<p>河洛文化旅游发展有限公司 版权所有</p>
	<p>Copyright 2016 zgqygc.com All Rights Reserved | 豫ICP备10000000号　技术支持：闪迅</p>
</div>
</body>
</html>