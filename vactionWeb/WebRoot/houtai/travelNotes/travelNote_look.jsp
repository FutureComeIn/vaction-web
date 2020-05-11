<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.view.TravelNote"%>
<%@page import="com.yxw.viewdao.TravelNoteDao"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'travelNote_look.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=path %>/houtai/css/x-admin.css" media="all">
  </head>
  
  <body>
    <%
    	int nno = Integer.parseInt(request.getParameter("nno").trim());
    	List<TravelNote> tl = new TravelNoteDao().queryTravelNoteByNno(nno);
    	request.setAttribute("tl",tl.get(0));
    
     %>
     <div class="x-body">
            <form action="" method="post" class="layui-form layui-form-pane">
            	<table border="1px" align="center" width="80%" >
            		<tr height="45px">
            			<td align="right" width="20%" style=" background-color: lightgrey">标题：</td>
            			<td>${tl.ntitle }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">作者：</td>
            			<td>${tl.uname }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">是否已发表：</td>
            			<td>${tl.nsend }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">发表时间：</td>
            			<td>${tl.nsendtime }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">点赞数：</td>
            			<td>${tl.nlikecount }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">收藏数：</td>
            			<td>${tl.ncollectcount }</td>
            		</tr>
            		<tr >
            			<td align="right" style=" background-color: lightgrey" valign="top">内容：</td>
            			<td align="center">
            				<textarea rows="6" cols="50">${tl.ncontent }</textarea>
            			</td>
            		</tr>
            	</table>
            </form>
        </div>
        <script src="./lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="./js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer;

              //监听提交
              form.on('submit(save)', function(data){
                console.log(data);
                //发异步，把数据提交给php
                layer.alert("保存成功", {icon: 6},function () {
                    // 获得frame索引
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                });
                return false;
              });
            });
			
        </script>
        <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        </script>
        <br/>
        <br/>
        <br/>
  </body>
</html>
