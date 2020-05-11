<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>发布游记</title>
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
        		$("#myform").attr("action","${pageContext.request.contextPath }/SaveNoteServlet?flag=1");
        		document.myform.submit();
        	});
        	$("#save").click(function(){
        		$("#myform").attr("action","${pageContext.request.contextPath }/SaveNoteServlet?flag=2");
        		document.myform.submit();
        	});
        })
    </script>    
</head>
<body>

<!-------------------版头------------------->
<jsp:include page="/qiantai/user/userHead.jsp" flush="true"></jsp:include>

<!-----------------发布封面---------------->
<form id="myform" action="" method="post" enctype="multipart/form-data" name="myform">
<div id="write_cover">
	<div class="replace_name"><div class="cw1000"><input type="text" name="title" placeholder="填写游记标题" maxlength="48" /></div></div>
</div>
<!-----------------框架---------------->
<div class="cw1000">
	<!--<img style="margin-top:30px;" src="<%=path %>/images/bjq.jpg"/>  -->
	<textarea rows="14" cols="100" name="content">
	
	</textarea><br/>
	选择封面：<input type="file" name="fpath"/></br>
	<!-----------------发布按钮---------------->
	<div id="write_button">
		<a class="exit" href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=1">退出</a>
		<input class="express" id="express" type="button" value="发表" />
		<span>或</span>
		<input class="save" id="save" type="button"  value="保存草稿" />
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