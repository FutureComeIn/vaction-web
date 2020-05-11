<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>景区信息</title>
    
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    <!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
    
    
	<link rel="stylesheet" href="<%=path %>/houtai/css/x-admin.css" media="all">
	<script src="houtai/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("button").click(function(){
				var url="houtai/scenicSpot/addScenic.jsp";
           		//var name="";
				//open(url,name,"width=620,height=740,top=150,left=700,scrollbars=no,resizable=no");
				window.location.href=url;
			})
		})
		
		function showPhoto(sno){
			var url="ScenicServlet?type=photo_select&sno="+sno;
            var name="";
			open(url,name,"width=810,height=640,top=300,left=800,scrollbars=no,resizable=no");
		}
		function addPhoto(sno){
			var url="houtai/scenicSpot/addScenicPhoto.jsp?sno="+sno;
            var name="";
			open(url,name,"width=420,height=400,top=300,left=800,scrollbars=no,resizable=no");
		}
		
		function showContent(content){
			alert(content);
		}
		function del(sno){
			var url="<%=path %>/ScenicServlet?type=del&sno="+sno;
			if(confirm("您确定删除该景区嘛")){
				window.location.href=url;
			}
		}
		function update(sno){
			var url="<%=path %>/ScenicServlet?type=update_select&sno="+sno;
			window.location.href=url;
		}
		function skippage(currentPage){
			var myform=document.getElementById("myform");
			var url="<%=path %>/ScenicServlet?type=admin_select&currentPage="+currentPage;
			myform.action=url;
			myform.submit();
		}
	</script>
  </head>
  <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>景区信息</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        
        <div class="x-body">
        
        	<form method="post" action="<%=path %>/ScenicServlet?type=admin_select" id="myform" align="center">
        		编号:<input type="text" name="sno" value=""/>&nbsp;&nbsp;
        		名称:<input type="text" name="sname" value="${search.sname }"/>&nbsp;&nbsp;
        		<input type="submit" value="搜索"/>
        	</form>
        	<button style="color:blue">添加景区</button>
            <table class="layui-table" style="text-align:center">
                <thead>
                    <tr>
                        <th>logo</th>
                        <th>ID</th>
                        <th>名称</th>
                        <th>文字介绍</th>
                        <th>咨询电话</th>
                        <th>开放时间</th>
                        <th>详细地址</th>
                        <th>价格(￥/人)</th>
                        <th>background</th>
                        <th>景区图片</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach items="${sdata.slist}" var="scenic">
                    <tr>
                        <td width="100" height="100"><img src="${scenic.sheadpath }" width="80" height="80"/></td>
                        <td>${scenic.sno }</td>
						<td>${scenic.sname }</td>
                        <td><a href="javascript:showContent('${scenic.scontent}');" style="text-decoration:none;cursor:pointer;color:red" >文字介绍</a></td>
                        <td>${scenic.smobile }</td>
                        <td>${scenic.sopendate }</td>
                        <td>${scenic.saddress }</td>
                        <td>${scenic.sprice }</td>
                        <td width="100" height="100"> <img src="${scenic.sbgpath }" width="100" height="100"/> </td>
                        <td>
                        <a href="javascript:;" style="text-decoration:none;cursor:pointer;color:blue" onclick="showPhoto(${scenic.sno})">图  片</a>
                           &nbsp;&nbsp;
                        <a href="javascript:;" style="text-decoration:none;cursor:pointer;color:blue" onclick="addPhoto(${scenic.sno})">更  新</a>
                        </td>
                        <td class="td-manage">
                            <a title="删除" href="javascript:;" onclick="del(${scenic.sno})" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                            
                             <a title="编辑" href="javascript:;" onclick="update(${scenic.sno})"
                            	style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            
                        </td>
                    </tr>
 
                    </c:forEach>
                    
                    <!-- 分页 -->
                    <tr>
                    	<td colspan="11">
                    		<input type="button" value="首页" onclick="skippage(1)"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    		<input type="button" value="上一页" onclick="skippage('${currentPage>1?currentPage-1:1}')"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    		<input type="button" value="下一页" onclick="skippage('${currentPage<sdata.pageNum?currentPage+1:sdata.pageNum}')"/>&nbsp;&nbsp;&nbsp;&nbsp;
                    		<input type="button" value="末页" onclick="skippage('${sdata.pageNum }')"/>
                    													<!-- 参数要加单引号，否则报 page为定义 -->
                    	</td>
                    </tr>
                </tbody>
            </table>
   </div>
  </body>
</html>
