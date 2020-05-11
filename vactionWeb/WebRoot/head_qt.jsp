<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.bean.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>头部工具栏</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    <!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">   
    <script type="text/javascript">
    	//不登录不能进入 个人主页
    	function show1(){
    		<c:if test="${sessionScope.user==null}">
                  $("#userInfo").attr("style","display:none");
                  alert("请先登录");
                  return;
           	</c:if>
           	
    	}
    	
    	//登录（不选择异步时使用的方法）
    	 $(function(){
		    var url=window.location.href;
		    var start=url.lastIndexOf("Web/");
		    url=url.substring(start+4);
		    $("#url").eq(0).val(url);
		    //alert($("#url").eq(0).val());
    	})
    	function login(){
    		document.myForm.submit();
    	}
    	
    	//签到
    	$(function(){
		    var url=window.location.href;
		    var start=url.lastIndexOf("Web/");
		    url=url.substring(start+4);
		    $("#url2").eq(0).val(url);
		    //alert($("#url").eq(0).val());
    	})
    	function test(){
    		document.myForm2.submit();
    	}
    	$(function(){
    		$("#sign").click(function(){
    		
    			<c:if test="${sessionScope.user==null}">
                  alert("请先登录");
                  $("#sign_layer").attr("style","display:none");
                  return;
           		</c:if>
           		
    			$("#sign").attr("style","display:none");
    			$("#sign_in").attr("style","display:block");
    			setTimeout(test,2000);
    		});
    	})
    		
    	
    	$(function(){
    		//签到切换
    		<%
    			String msg=(String)request.getSession().getAttribute("sign");
    			if("yes".equals(msg)){
    		%>
    			$("#sign").attr("style","display:none");
    			$("#sign_in").attr("style","display:block");
    		<%
    			}	
    		%>
    		//登录切换
    		<%
    			User user=(User)request.getSession().getAttribute("user");
    			//System.out.println("qt_user:"+user);
    			if(null!=user){
    		%>
    				$("#login").attr("style","display:none");
    				$("#login_in").attr("style","display:block");	
    		<%	
    			}
    		%>
    	})
		
		function exitUser(){
			if(confirm("您确定退出吗")){
				window.location.href="<%=path %>/UserServlet?type=exitUser";
			}
		}
		
		function goHoutai(){
			window.location.href="<%=path %>/UserServlet?type=exitUserHt";
		}
    </script>
  </head>
  
<body>
    <!-------------------工具栏------------------->
	<div id="toolbar">
	    <div class="cw1200">
	    	<form method="post" action="<%=path %>/signServlet?uno=${user.uno }" name="myForm2">
	        		<input type="hidden" value="" id="url2" name="url2" />
	        </form>
	        
	    	<form method="post" action="<%=path %>/qiantai/user/login.jsp" name="myForm">
	        	<input type="hidden" value="" id="url" name="url" />
	        <ul class="fl">
	            <li class="tb"><p>欢迎访问河洛文化旅游网！</p></li>
	            
	            <li class="tb" id="sign"><a href="javascript:;" data-am-modal="{target: '#my-alert'}">签到</a><span>|</span></li>
	            <li class="tb" style="display:none;color:orange" id="sign_in"><a href="javascript:;" style="color:blue;">已签到</a><span>|</span></li>

	            
	            <li class="tb" id="login"><a href="javascript:;" onclick="login()">登录</a><span>|</span></li>
	            <li class="tb" style="display:none;" id="login_in"><a href="javascript:;" style="color:red;">您好,${user.uname }!已登录</a><span>|</span></li>
	            
	            <li class="tb"><a href="<%=path %>/qiantai/user/register.jsp">注册</a><span>|</span></li>
	            
	            <li class="tb"><a href="javascript:;" onclick="exitUser()">注销</a></li>
	        </ul>
	        
	        </form>
	        
	         <!-------------------签到弹出层------------------->
			<div id="sign_layer">
				<div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
				  <div class="am-modal-dialog">
					<div class="win-m">
						<p class="p1">签到成功</p>
						<p class="p1">获得<span class="already-sign">20</span>积分</p>
						<p class="p2">每天签到都可以获得积分哦</p>
						<div class="am-modal-footer">
						  <span class="am-modal-btn">知道了</span>
						</div>
					</div>
					
				  </div>
				</div>
			</div>
			
	        <ul class="fr">
	            <li class="tb">
					<a href="javascript:;">我的河洛</a>
					<!-------------------用户------------------->
					<div class="user">
						<a class="user-hd" href="#">
							<img src="<%=path %>/images/user_head_pic.jpg" onMouseMove="show1()"/><b></b>
							<div class="clear"></div>
						</a>
						<div class="user-bd" id="userInfo">
							<div class="integral"><img src="<%=path %>/images/integral_ico.png"/>当前积分${user.upoint }</div>
							<ul class="nav_sort">
								<li><a href="<%=path %>/qiantai/note/write_note.jsp"><i class="i2"></i>写游记</a></li>
								<li><a href="<%=path %>/QueryNoteByUserIdServlet"><i class="i9"></i>我的游记</a></li>
								<li><a href="<%=path %>/QueryCollectionServlet?currentPage=1"><i class="i3"></i>我的收藏</a></li>
								<li><a href="<%=path %>/qiantai/order/project_order.jsp"><i class="i4"></i>商品订单</a></li>
								<li><a href="<%=path %>/ScenicOrderTypeServlet?i=abc"><i class="i5"></i>旅游订单</a></li>
								<li><a href="<%=path %>/QueryCommentByNoServlet?currentPage=1"><i class="i6"></i>我的评论</a></li>
								<li><a href="<%=path %>/qiantai/user/my_info.jsp"><i class="i7"></i>设置</a></li>
								<li><a href="#"><i class="i8"></i>退出</a></li>
							</ul>
						</div>
					</div>
					<span>|</span>
				</li>
	            <li class="tb"><a href="<%=path %>/qiantai/order/shop_car.jsp" onmousemove="show1()"><i class="cart_ico"></i>购物车</a><span>|</span></li>
	            <li class="tb"><a href="javascript:;" onclick="goHoutai()">后台管理</a><span>|</span></li>
	            <li class="tb"><img src="<%=path %>/images/tel_ico.gif"/><font>40000-40000</font></li>
	        </ul>
	        <div class="clear"></div>
	    </div>
	</div>
	

 </body>
</html>
