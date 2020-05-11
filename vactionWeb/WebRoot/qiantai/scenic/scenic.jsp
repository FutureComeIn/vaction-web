<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.bean.User"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>景区</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    <!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
    <script type="text/javascript">
    
    	//立即预定 判断
    	function orderbuy(sno){
    		<c:if test="${sessionScope.user==null}">
                  alert("请先登录");
                  return;
           	</c:if>
           	window.location.href="<%=path %>/Submit_orderServlet?sno="+sno;
    	}
    	
    	//不登录不能进入 个人主页
    	function show1(){
    		<c:if test="${sessionScope.user==null}">
                  $("#userInfo").attr("style","display:none");
                  alert("请先登录");
                  return;
           	</c:if>
           	
    	}
    	
    	//传到login.jsp界面拿不到 &符号及后面的值,只有使用 input传过去可以得到
        function login(){
        	$("#loginDiv").show();
        }
        
        //登录：选择异步方法 
        function doLogin(){
          var userName=$("#userName").val();
          var userPwd=$("#userPwd").val();
          $.ajax({
          url:'<%=path%>/DoLogin?type=login',//请求的地址
				data:{'userName':userName,'userPwd':userPwd},//请求的数据
				type:'post',//请求的类型
				async:true,//是否异步
				dataType:'text',//请求成功后 返回的数据格式
					
				 //异步请求成功拿到数据后的回调函数
				 success:function(data){
					if(data=="ok"){
						alert("登录成功...");
						window.location.reload(); //自动刷新当前界面
					}else{
						alert("用户名或密码错误...");
					}
				 }	
          });
        }
        
        function test(){
    		document.myForm2.submit();
    	}
        
          //签到
    	$(function(){
		    var url=window.location.href;
		   var start=url.lastIndexOf("Web/");
		    url=url.substring(start+4);
		    $("#url2").eq(0).val(url);

		    
		    $("#sign").click(function(){
    			//使用c:if 要导入 taglib 包
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
	<div id="loginDiv" style="position:absolute;top:-4px;left:520px;border:1px solid red;display:none">
		<input type="text" name="userName" id="userName" placeholder="用户名"/>
		<input type="password" name="userPwd" id="userPwd" placeholder="密码"/>
		<button onclick="doLogin()">登录</button>
	</div>

<!-------------------工具栏(scenic.jsp用include导实现不了点击的图片轮看)------------------->
<div id="toolbar">
	    <div class="cw1200">
	    	<form method="post" action="<%=path %>/signServlet?uno=${user.uno }" name="myForm2">
	        		<input type="hidden" value="" id="url2" name="url2" />
	        </form>
	        
	        <ul class="fl">
	        	
	           <li class="tb"><p>欢迎访问河洛文化旅游网！</p></li>
	            
	            <li class="tb" id="sign"><a href="javascript:;" data-am-modal="{target: '#my-alert'}">签到</a><span>|</span></li>
	            <li class="tb" style="display:none;" id="sign_in"><a href="javascript:;" style="color:blue;">已签到</a><span>|</span></li>
	            
	            <li class="tb" id="login"> <a href="javascript:;" onclick="login()">登录</a>  <span>|</span></li>
	            <li class="tb" style="display:none;" id="login_in"><a href="javascript:;" style="color:red;">您好,${user.uname }!已登录</a><span>|</span></li>
	            
	            <li class="tb"><a href="<%=path %>/qiantai/user/register.jsp">注册</a></li>
	        	
	        	<li class="tb"><a href="javascript:;" onclick="exitUser()">注销</a></li>
	        </ul>
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
							<img src="<%=path %>/images/user_head_pic.jpg" onmousemove="show1()"/><b></b>
							<div class="clear"></div>
						</a>
						<div class="user-bd">
							<div class="integral"><img src="<%=path %>/images/integral_ico.png"/>当前积分 ${user.upoint }</div>
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

	

<!-------------------版头------------------->
<div id="header">
    <div class="cw1200">
        <!-------------------logo------------------->
        <div class="logo fl"><a href="<%=path %>/index.jsp"><img src="<%=path %>/images/t_logo.jpg"></a></div>
        <div class="search_nav fl">
            <!-------------------搜索------------------->
            <div class="search radius6">
				<form name="searchform" method="post" action="/e/search/index.php">
					<input name='ecmsfrom' type='hidden' value='9'>
					<input type="hidden" name="show" value="title,newstext">
					<select name="classid" id="choose">
						<option value="0">景区</option>
						<option value="1">特产</option>
						<option value="4">游记</option>
					</select> 
					<input class="inp_srh" name="keyboard"  placeholder="请输入您要搜索的关键词" />
					<input class="btn_srh" type="submit" name="submit" value="搜索" />
				</form>
			</div>
			<script type="text/javascript" src="<%=path %>/js/jquery.select.js"></script>
            <!-------------------导航------------------->
            <div class="nav">
                <ul>
                    <li><a title="" href="<%=path %>/index.jsp">首页</a></li>
	                <li><a title="" class="cur" href="<%=path %>/ScenicServlet?type=qt_select">孟津旅游</a></li>
	                <li><a title="" href="<%=path %>/QianQueryAllGoodsServlet">特产商城</a></li>
	                <li><a title="" href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=1">攻略游记</a></li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<!------------------景区版头-------------------->
<div id="scenic_head" style="background:url(${qt_scenic.sbgpath }) no-repeat center;background-size:100%;">
	<div class="cw1200">
		<div class="title"><p>${qt_scenic.sname }</p></div>
		<a href="#" class="view_gallery" id="botn">查看图库<i class="am-icon-chevron-circle-right"></i></a>
		
		<ul style="display:none;" data-am-widget="gallery" class="am-gallery am-avg-sm-2 am-avg-md-3 am-avg-lg-4 am-gallery-default" data-am-gallery="{ pureview: true }" >
		  <li>
			<div class="am-gallery-item">
				<a href="${qt_sphoto.spphoto1 }" class="">
				  <img src="${qt_sphoto.spphoto1 }"  alt="远方 有一个地方 那里种有我们的梦想"/>
				  <div style="display:none;">
					<h3 class="am-gallery-title">远方 有一个地方 那里种有我们的梦想</h3>
					<div class="am-gallery-desc">2375-09-26</div>
					</div>
				</a>
			</div>
		  </li>
		  <li>
			<div class="am-gallery-item">
				<a href="${qt_sphoto.spphoto2 }" class="">
				  <img src="${qt_sphoto.spphoto2 }"  alt="某天 也许会相遇 相遇在这个好地方"/>
					<h3 class="am-gallery-title">某天 也许会相遇 相遇在这个好地方</h3>
					<div class="am-gallery-desc">2375-09-26</div>
				</a>
			</div>
		  </li>
		  <li>
			<div class="am-gallery-item">
				<a href="${qt_sphoto.spphoto3 }" class="">
				  <img src="${qt_sphoto.spphoto3 }"  alt="不要太担心 只因为我相信"/>
					<h3 class="am-gallery-title">不要太担心 只因为我相信</h3>
					<div class="am-gallery-desc">2375-09-26</div>
				</a>
			</div>
		  </li>
		  <li>
			<div class="am-gallery-item">
				<a href="${qt_sphoto.spphoto4 }" class="">
				  <img src="${qt_sphoto.spphoto4 }"  alt="终会走过这条遥远的道路"/>
					<h3 class="am-gallery-title">终会走过这条遥远的道路</h3>
					<div class="am-gallery-desc">2375-09-26</div>
				</a>
			</div>
		  </li>
		  <li>
			<div class="am-gallery-item">
				<a href="${qt_sphoto.spphoto5 }" class="">
				  <img src="${qt_sphoto.spphoto5 }"  alt="终会走过这条遥远的道路"/>
					<h3 class="am-gallery-title">终会走过这条遥远的道路</h3>
					<div class="am-gallery-desc">2375-09-26</div>
				</a>
			</div>
		  </li>
		</ul>
		<script>
			$("#botn").live("click",function(){
				$(".am-gallery-item img").click();
			});
		
			$(document).ready(function(){
				$(".am-icon-chevron-left").attr("class", "am-icon-close");
			});
		</script>
	</div>
</div>


<!------------------子页框架-------------------->
<div id="sub_from">
    <div class="cw1200">
		<div class="w810 fl">
			<!------------------公共盒子-------------------->
			<div class="public_box bg1">
				<div class="public_title">
					<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
						<div class="name"><img src="<%=path %>/images/f_t_article.png"/></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------景区介绍-------------------->
				<div id="article">
					<div class="con">
						<p>${qt_scenic.scontent }</p>
					</div>
					<div class="map">
						<img style="max-width:100%;" src="<%=path %>/images/map.jpg"/>
					</div>					
				</div>
			</div>
		</div>
		<div class="w380 fr">
			<!------------------公共盒子-------------------->
			<div class="public_box bg2">
				<div class="public_title">
					<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
						<div class="name"><img src="<%=path %>/images/f_t_online_book.png"/></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------在线预订-------------------->
				<div id="online_book">
					<ul>
						<li>景区名称：<span>${qt_scenic.sname }</span></li>
						<li>电话咨询：<span>${qt_scenic.smobile }</span></li>
						<li>开放时间：<span>${qt_scenic.sopendate }</span></li>
						<li>详细地址：<span>${qt_scenic.saddress }</span></li>
						<li>费用：<label>${qt_scenic.sprice }</label></li>
					</ul>
					<input type="hidden" value="${user.uno }" id="uno"/>
					<a class="buy" href="javascript:;" onclick="orderbuy(${qt_scenic.sno})">立即预订</a>
				</div>
			</div>
			
			<!------------------公共盒子-------------------->
			<div class="public_box bg2">
				<div class="public_title">
					<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
						<div class="name"><img src="<%=path %>/images/f_t_surrounding_hotel.png"/></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------周边酒店-------------------->
				<div class="peripheral_recom">
					<ul>
						<li>
							<div class="pic"><a title="" href="#"><img alt="" class="scale-effect" src="<%=path %>/images/nt_1.jpg"/></a></div>
							<div class="con">
								<a href="#">春艳牡丹</a>
								<p>志斋是研究唐代三百年文治武功和书法艺术的史料宝库</p>
								<span>距离35公里</span>
							</div>
							<div class="clear"></div>
						</li>
						<li>
							<div class="pic"><a title="" href="#"><img alt="" class="scale-effect" src="<%=path %>/images/nt_1.jpg"/></a></div>
							<div class="con">
								<a href="#">春艳牡丹</a>
								<p>志斋是研究唐代三百年文治武功和书法艺术的史料宝库</p>
								<span>距离35公里</span>
							</div>
							<div class="clear"></div>
						</li>
						<li>
							<div class="pic"><a title="" href="#"><img alt="" class="scale-effect" src="<%=path %>/images/nt_1.jpg"/></a></div>
							<div class="con">
								<a href="#">春艳牡丹</a>
								<p>志斋是研究唐代三百年文治武功和书法艺术的史料宝库</p>
								<span>距离35公里</span>
							</div>
							<div class="clear"></div>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="clear"></div>
    </div>
</div>

<!-----------------版底---------------->
<div id="footer">
    <div class="cw1200">
        <div class="line"><img src="<%=path %>/images/b_line.png"/></div>
        <div class="b_logo"><img src="<%=path %>/images/b_logo.png"/></div>
        <div class="con">
            <p>河洛文化旅游发展有限公司 版权所有</p>
            <p>地址：河南省洛阳市孟津县旅游游客接待中心　邮编：471000　电话：0379-60000000　业务电话：0379-6000000</p>
            <p>Copyright 2016 zgqygc.com All Rights Reserved | 豫ICP备10000000号　技术支持：闪迅</p>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>
