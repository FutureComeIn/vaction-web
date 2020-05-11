<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.bean.Goods"%>
<%@page import="com.yxw.dao.GoodsDao"%>
<%@page import="com.yxw.bean.GoodPhoto"%>
<%@page import="com.yxw.dao.GoodPhotoDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods_look.jsp' starting page</title>
    
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
    	int gno = Integer.parseInt(request.getParameter("gno").trim());
    	List<Goods> goods = new GoodsDao().queryGoodsByNno(gno);
    	request.setAttribute("goods",goods.get(0));
    	
    	List<GoodPhoto> gp=new GoodPhotoDao().queryGoodPhotoByPgno(gno);
    	request.setAttribute("goodPhoto",gp.get(0));
     %>
     <div class="x-body">
            	<table border="1px" align="center" width="91%" >
            		<tr height="45px">
            			<td align="right" width="20%" style=" background-color: lightgrey">名称：</td>
            			<td>${goods.gname }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" width="20%" style=" background-color: lightgrey">种类：</td>
            			<td>${goods.gtype }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">产地：</td>
            			<td>${goods.gplace }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">价格：</td>
            			<td>${goods.gprice }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">成交量：</td>
            			<td>${goods.gdealcount }</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">积分：</td>
            			<td>${goods.gpoint }</td>
            		</tr>
            	</table>
            	
            	<table border="1px" align="center" width="80%" >
            		<tr height="45px">
            			<td align="center" width="50%" style=" background-color: lightgrey">主图</td>
            			<td align="center" width="50%" style=" background-color: lightgrey">详情图</td>
            		</tr>
            		
            		<tr height="45px">
            			<td align="center">
							<img alt="" src="${goods.gheadphotopath }" width="340px">
            			</td>
            			<td align="center">
            				<img alt="" src="${goods.gdetailphotopath }" width="340px">
            			</td>
            		</tr>
            		
            	</table>
            	<br/>
            	<table border="1px" align="center" width="80%" >
            		<tr height="45px">
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图1</td>
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图2</td>
            		</tr>
            		
            		<tr height="45px">
            			<td align="center">
							<img alt="" src="${goodPhoto.gppath1 }" width="340px">
            			</td>
            			<td align="center">
            				<img alt="" src="${goodPhoto.gppath2 }" width="340px">
            			</td>
            		</tr>
            		<tr height="45px">
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图3</td>
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图4</td>
            		</tr>
            		
            		<tr height="45px">
            			<td align="center">
							<img alt="" src="${goodPhoto.gppath3 }" width="340px">
            			</td>
            			<td align="center">
            				<img alt="" src="${goodPhoto.gppath4 }" width="340px">
            			</td>
            		</tr>
            		<tr height="45px">
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图5</td>
            			<td align="center" width="50%" ></td>
            		</tr>
            		
            		<tr height="45px">
            			<td align="center">
							<img alt="" src="${goodPhoto.gppath5 }" width="340px">
            			</td>
            			<td align="center">
            			</td>
            		</tr>
            	</table>
            	
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
        <br/>
        <br/>
        <br/>
  </body>
</html>
