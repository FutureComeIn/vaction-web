<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>游记信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/houtai/css/x-admin.css" media="all">
    </head>
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>游记信息</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <table class="layui-table">
        	<tr>
        		<th>作者</th>
        		<th>标题</th>
        		<th>发布时间</th>
        		<th>是否发表</th>
        		<th>操作</th>
        	</tr>
        	<c:forEach items="${travelNoteList}" var="travelNote">
        		<tr>
        			<td>${travelNote.uname}</td>
        			<td>${travelNote.ntitle}</td>
        			<td>${travelNote.nsendtime}</td>
        			<td>${travelNote.nsend}</td>
        			<td class="td-manage">
                            <a title="删除" href="javascript:;" onclick="travelNote_del('${travelNote.nno }')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                            <a title="查看" href="javascript:;" onclick="travelNote_look('游记查看','<%=path%>/houtai/travelNotes/travelNote_look.jsp?nno=${travelNote.nno }','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon"><img src="<%=path %>/houtai/images/look3.png" width="15" height="15"></i>
                            </a>
                        </td>
        		</tr>
        	</c:forEach>
        </table>
        <script src="<%=path %>/houtai/lib/layui/layui.js" charset="utf-8"></script>
        <script src="<%=path %>/houtai/js/x-layui.js" charset="utf-8"></script>
        <script>
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
              var start = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                  end.min = datas; //开始日选好后，重置结束日的最小日期
                  end.start = datas //将结束日的初始值设定为开始日
                }
              };
              
              var end = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                  start.max = datas; //结束日选好后，重置开始日的最大日期
                }
              };
              
            });
            function travelNote_look (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
            
            function travelNote_del(nno){
            	if(window.confirm("您确认删除吗？")){
            		var url = "<%=path%>/deleteTravelNoteServlet?nno="+nno;
            		window.location.href=url;
            	}
            }
            </script>
  </body>
</html>
