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
    
    <title>商品信息</title>
    
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
              <a><cite>商品信息</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <button class="layui-btn" onclick="goods_add('添加商品','<%=path %>/houtai/goods/goods_add.jsp','4','','510')">
        	<i class="layui-icon">&#xe608;</i>添加
        </button>
        <table class="layui-table">
        	<tr>
        		<th>编号</th>
        		<th>名称</th>
        		<th>价格</th>
        		<th>成交量(单)</th>
        		<th>积分</th>
        		<th>种类</th>
        		<th>操作</th>
        	</tr>
        	<c:forEach items="${goodsList}" var="goods">
        		<tr>
        			<td>${goods.gno}</td>
        			<td>${goods.gname}</td>
        			<td>${goods.gprice}</td>
        			<td>${goods.gdealcount}</td>
        			<td>${goods.gpoint}</td>
        			<td>${goods.gtype}</td>
        			<td class="td-manage">
        					<a style="text-decoration:none"  onclick="goods_edit('商品信息修改','<%=path %>/houtai/goods/goods_edit.jsp?gno=${goods.gno }&gtype=${goods.gtype }','4','','510')"
                            href="javascript:;" title="修改">
                                <i class="layui-icon">&#xe631;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="goods_del('${goods.gno}')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                            <a title="查看" href="javascript:;" onclick="goods_look('商品查看','<%=path %>/houtai/goods/goods_look.jsp?gno=${goods.gno }','4','','510')"
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
            
            function goods_del(gno){
            	if(window.confirm("您确认删除吗？")){
            		var url = "<%=path%>/deleteGoodsServlet?gno="+gno;
            		window.location.href=url;
            	}
            }
            
            function goods_edit(title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
            
            function goods_add(title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
            
            function goods_look(title,url,id,w,h){
            	x_admin_show(title,url,w,h); 
            }
            
            </script>
  </body>
</html>
