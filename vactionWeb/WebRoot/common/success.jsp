<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.yxw.bean.User"%>
<%
	String path = request.getAttribute("path").toString();
	String message = request.getAttribute("message").toString();
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<html>
<script language="javascript">
    <% if(message != null) { %>
		alert("<%=message%>");
	<% } %>
	<% if(!"".equals(path)) { %>
		document.location.href = "<%=path%>";
	<% } else {
	%>
		window.history.back();
		//window.history.go(-2);//回退到上上个界面，所以没执行UserServlet,所以user为null,不能切换
	<% } %>
</script>
<body> 
</body> 
</html>
