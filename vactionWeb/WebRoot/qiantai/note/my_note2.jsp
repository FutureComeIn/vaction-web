<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>我的游记——我的草稿</title>
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
         			window.location.href="<%=path %>/DeleteNoteServlet?type=deleteDraft&noteNo="+id;
         		}
         	});
         	$(".update").click(function(){
         		if(confirm("你确定发表吗？")){
         			var id=$(this).parent().find("input").val();
         			window.location.href="<%=path %>/UpdateNoteServlet?noteNo="+id;
         		}
         	});
         })
         
         function updateNote(nno){
			window.location.href="<%=path %>/XiugaiNoteServlet?nno="+nno;
         }
         
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
				<li><a href="<%=path %>/QueryNoteByUserIdServlet?currentPage=1">已发表游记</a></li>
				<li><a class="cur" href="<%=path %>/QueryNoteServlet?type=DraftNote&currentPage=1">我的草稿</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<!-----------------游记列表---------------->
		<div class="note_list">
			<ul>
			     <c:forEach items="${DraftNoteList}" var="DraftNote">
				<li class="pd_r150">
					<div class="pic"><img alt="" src="${DraftNote.nsendfmPath}"/></div>
					<div class="con">
						<a href="<%=path %>/queryContentOfNoteServlet?nno=${DraftNote.nno}"><h3>${DraftNote.ntitle }</h3></a>
						<div class="user">
							<span><img alt="" src="${DraftNote.utxPath }" />作者：<font>${DraftNote.uname }</font></span>
							<span>发表时间:${DraftNote.nsendtime }</span>
						</div>
						<p>${DraftNote.ncontent }</p>
					</div>
					<div class="operation">
						<a href="javascript:;" class="update"><i class="express_ico"></i>发表</a>
						<a href="javascript:;" onclick="updateNote('${DraftNote.nno}')"><i class="edit_ico"></i>修改</a>
						<a href="javascript:;" class="deleteById">
						<input type="hidden"  value="${DraftNote.nno}"/>
						<i class="del_ico"></i>删除</a>
					</div>
				</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
	<div class="div1" align="center">
                <a href="<%=path %>/QueryNoteServlet?type=DraftNote&currentPage=1">首页</a>
			     <a href="<%=path %>/QueryNoteServlet?type=DraftNote&currentPage=${(currentPage-1)>1?(currentPage-1):1}">上一页</a>
			     <a href="<%=path %>/QueryNoteServlet?type=DraftNote&currentPage=${currentPage<totalPage?(currentPage+1):currentPage}">下一页</a>
			     <a href="<%=path %>/QueryNoteServlet?type=DraftNote&currentPage=${requestScope.totalPage}">末页</a>
</div>
</div>
<!-----------------版底---------------->
<div id="footer">
	<p>河洛文化旅游发展有限公司 版权所有</p>
	<p>Copyright 2016 zgqygc.com All Rights Reserved | 豫ICP备10000000号　技术支持：闪迅</p>
</div>
</body>
</html>