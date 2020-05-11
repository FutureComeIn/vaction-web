<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>后台</title>
    <link rel="stylesheet" href="<%=path %>/houtai/css/x-admin.css" media="all">
    <script type="text/javascript">
    	function exitAdmin(){
    		if(confirm("您确认退出吗")){
    			window.location.href="<%=path %>/houtai/login.jsp";
    		}
    	}
    </script>
  </head>
  
  <body>
    <div class="layui-layout layui-layout-admin">
            <div class="layui-header header header-demo" style="background-image:url(<%=path %>/houtai/images/rplogo1.jpg);background-repeat:no-repeat;" >
                <div class="layui-main">
                    
                    <ul class="layui-nav" lay-filter="">
                      <li class="layui-nav-item"><img src="<%=path %>/houtai/images/0.jpg" class="layui-circle" style="border: 2px solid #A9B7B7;" width="35px" alt=""></li>
                      <li class="layui-nav-item">
                        <a href="javascript:;">admin</a>
                        <dl class="layui-nav-child"> <!-- 二级菜单 -->
                          <dd><a href="javascript:;" onclick="exitAdmin()">退出</a></dd>
                        </dl>
                      </li>
                      <li class="layui-nav-item x-index"><a href="<%=path %>/QiantaiServlet">前台首页</a></li>
                    </ul>
                </div>
            </div>
            <div class="layui-side layui-bg-black x-side">
                <div class="layui-side-scroll">
                    <ul class="layui-nav layui-nav-tree site-demo-nav" lay-filter="side">
                    	<!--个人信息-->
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;" _href="<%=path %>/houtai/admin/adminInfo.jsp">
                                <cite>个人信息</cite>
                            </a>
                        </li>
                        <!--用户管理-->
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;" _href="UserServlet?type=admin_select">
                                <cite>用户管理</cite>
                            </a>
                        </li>
                        <!--景区信息-->
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;" _href="ScenicServlet?type=admin_select">
                                <cite>景区信息</cite>
                            </a>
                        </li>
                        <!--商品信息-->
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;" _href="<%=path %>/queryAllGoodsServlet?type=htselect">
                                <cite>商品信息</cite>
                            </a>
                        </li>
                        <!--游记信息-->
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;" _href="<%=path %>/queryAllTravelNotesServlet">
                                <cite>游记信息</cite>
                            </a>
                        </li>
                        <!--网站信息管理-->
                        <li class="layui-nav-item">
                            <a class="javascript:;" href="javascript:;">
                                <i class="layui-icon" style="top: 3px;">&#xe629;</i><cite>网站信息管理</cite>
                            </a>
                            <dl class="layui-nav-child">
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="<%=path %>/houtai/webInfo/Home.jsp">
                                            <i class="layui-icon"></i><cite>首页</cite>
                                        </a>
                                    </dd>
                                </dd>
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="<%=path %>/houtai/webInfo/About_us.jsp">
                                            <i class="layui-icon"></i><cite>关于我们</cite>
                                        </a>
                                    </dd>
                                </dd>
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="<%=path %>/houtai/webInfo/New.jsp">
                                            <i class="layui-icon"></i><cite>心理新闻</cite>
                                        </a>
                                    </dd>
                                </dd>
                                <dd class="">
                                    <dd class="">
                                        <a href="javascript:;" _href="<%=path %>/houtai/webInfo/Download.jsp">
                                            <i class="layui-icon"></i><cite>资源下载</cite>
                                        </a>
                                    </dd>
                                </dd>
                            </dl>
                        </li>
                    </ul>
                </div>

            </div>
            
            <div class="layui-tab layui-tab-card site-demo-title x-main" lay-filter="x-tab" lay-allowclose="true">
                <div class="x-slide_left"></div>
                <ul class="layui-tab-title">
                    <li class="layui-this">
                       	 个人信息
                        <i class="layui-icon layui-unselect layui-tab-close">ဆ</i>
                    </li>
                </ul>
                <div class="layui-tab-content site-demo site-demo-body">
                    <div class="layui-tab-item layui-show">
                        <iframe frameborder="0" src="<%=path %>/houtai/admin/adminInfo.jsp" class="x-iframe"></iframe>
                    </div>
                </div>
            </div>
            <div class="site-mobile-shade">
            </div>
        </div>
        
        <script src="<%=path %>/houtai/lib/layui/layui.js" charset="utf-8"></script>
        <script src="<%=path %>/houtai/js/x-admin.js"></script>
        <script>
	        var _hmt = _hmt || [];
	        (function() {
	          var hm = document.createElement("script");
	          var s = document.getElementsByTagName("script")[0]; 
	          s.parentNode.insertBefore(hm, s);
	        })();
        </script>
  </body>
</html>
