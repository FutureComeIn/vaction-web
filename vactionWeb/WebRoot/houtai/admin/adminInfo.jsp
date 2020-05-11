<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员个人信息</title>
	<link rel="stylesheet" href="<%=path %>/houtai/css/x-admin.css" media="all">
	<script src="houtai/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$(".update").click(function(){
    			if(confirm("您确认修改吗")){
    				var ano=$("input").eq(0).val();
    			var name=$("input").eq(1).val();
    			var mobile=$("input").eq(3).val();
    			if(name==""){
    				alert("登录名不能为空 ");
    				$("input:first").focus();
    				return;
    			}
    			if(mobile==""){
    				alert("电话不能为空");
    				$("input").eq(3).focus();
    				return;
    			}
    			
    			window.location.href="<%=path %>/AdminServlet?type=update&ano="+ano+"&name="+name+"&mobile="+mobile;
    			}
    		})
    	})
    
    </script>
   </head>
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>个人信息</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新">
               <i class="layui-icon" style="line-height:30px">ဂ</i>
            </a>
        </div>
        <div class="x-body">
            <form class="layui-form x-center" action="javascript:;" name="form1">
                    	<table height="200">
                    		<input type="hidden" name="ano" value="${sessionScope.admin.ano }"/>
                    		<tr>
                    			<td>登&nbsp;&nbsp;陆&nbsp;&nbsp;名：</td>
                    			<td><input type="text" name="loginName" size="15px" value="${sessionScope.admin.aname}"></td>
                    		</tr>
                    		<tr>
                    			<td>登陆密码：</td>
                    			<td><input type="password" name="loginPwd" size="15px" value="${sessionScope.admin.apsw }" readonly="readonly">
                    		</tr>
                    		<tr>
                    			<td>手&nbsp;&nbsp;机&nbsp;&nbsp;号：</td>
                    			<td><input type="text" name="mobile" size="15px" value="${sessionScope.admin.amobile }"></td>
                    		</tr>
                    		<tr>
                    			<td colspan="2" align="center"> 
                    				<input type="button" value="修改" class="update" />
                    			</td>
                    		</tr>
                    	</table>
            </form>
        </div> 
        <script src="<%=path %>/houtai/lib/layui/layui.js" charset="utf-8"></script>
        <script src="<%=path %>/houtai/js/x-layui.js" charset="utf-8"></script>
        <script>
        	/*
            layui.use(['laydate','element','laypage','layer'], function(){
                $ = layui.jquery;//jquery
              laydate = layui.laydate;//日期插件
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层

              //以上模块根据需要引入
			   laypage({
                cont: 'page'
                ,pages: 100
                ,first: 1
                ,last: 100
                ,prev: '<em><</em>'
                ,next: '<em>></em>'
              }); 
            });
			*/
        </script>
      
  </body>
</html>
