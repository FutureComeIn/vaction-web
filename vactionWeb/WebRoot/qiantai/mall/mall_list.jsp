<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商城列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    <!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
	<link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
	<script>
		function Typechange(id){			
				var url="<%=path%>/typeServlet?gtype="+id;
				window.location.href=url;
		}
	
	</script>
</head>
<body>
<!-------------------工具栏---版头---------------->
	<jsp:include flush="true" page="/head_qt.jsp"></jsp:include>
	
<!-------------------版头------------------->
<div id="header">
    <div class="cw1200">
        <!-------------------logo------------------->
        <div class="logo fl"><a title="" href="<%=path %>/index.jsp"><img alt="" src="<%=path %>/images/t_logo.jpg"></a></div>
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
					<input class="inp_srh" name="keyboard"  placeholder="请输入您要搜索的关键词" >
					<input class="btn_srh" type="submit" name="submit" value="搜索">
				</form>
			</div>
			<script type="text/javascript" src="<%=path %>/js/jquery.select.js"></script>
            <!-------------------导航------------------->
            <div class="nav">
                <ul>
                	<li><a title=""  href="<%=path %>/index.jsp">首页</a></li>
	                <li><a title="" href="<%=path %>/ScenicServlet?type=qt_select">孟津旅游</a></li>
	                <li><a title="" class="cur" href="<%=path %>/QianQueryAllGoodsServlet">特产商城</a></li>
	                <li><a title="" href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=1">攻略游记</a></li>
                    
                </ul>
            </div>
        </div>
        <div class="clear"></div>
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
						<div class="name"><img src="<%=path %>/images/f_t_news_list.png"/></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------列表分类-------------------->
				<div id="list_sort">
					<span>产品类型：</span>
					<div class="list_1">
						<a class="cur" href="#" id="all" onclick="Typechange('all')">全部</a>
						<a href="#" id="Ncp" onclick="Typechange('Ncp')">农产品</a>
						<a href="#" id="Sg" onclick="Typechange('Sg')">水果</a>
						<a href="#" id="Gyp" onclick="Typechange('Gyp')">工艺品</a>
						<a href="#" id="Fsp" onclick="Typechange('Fsp')">副食品</a>
						<div class="clear"></div>
					</div>
                </div>
				<!------------------特产列表-------------------->
				<div id="mall_list">
					<c:forEach items="${goodList}" var="good">
					<ul>
						<li>
							<div class="pic"><a href="<%=path %>/StepServlet?gno=${good.gno}"><img class="scale-effect" src="${good.gheadphotopath}"/></a></div>
							<div class="con">
								<h3><a href="<%=path %>/StepServlet?gno=${good.gno}">${good.gname}</a></h3>
								<label>${good.gplace}</label>
							</div>
							<div class="price">
								<p>￥<label>${good.gprice}</label></p>
								<span>运费: 5.00</span>
							</div>
							<div class="other">
								<span>${good.gdealcount}人付款</span>
								<a href="<%=path %>/StepServlet?gno=${good.gno}">132条评论</a>
							</div>
							<div class="view">
								<a href="<%=path %>/StepServlet?gno=${good.gno}">查看详情</a>
							</div>
							<div class="clear"></div>
						</li>
						
					</ul>
					</c:forEach>
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
						<div class="name"><img src="<%=path %>/images/f_t_mobile_platform.png"/></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------移动平台-------------------->
				<div id="mobile_platform">
					<img src="<%=path %>/images/mp_pic.jpg"/>
					<img src="<%=path %>/images/mp_tag.png"/>
					<img src="<%=path %>/images/rwm.jpg"/>
					<p>微信订票/查询优惠政策请扫二维码</p>
				</div>
			</div>
			<!------------------公共盒子-------------------->
			<div class="public_box bg2">
				<div class="public_title">
					<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
						<div class="name"><img src="<%=path %>/images/f_t_culture.png"/></div>
						<div class="more"><a href="#">更多>></a></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------公共推荐-------------------->
				<div id="public_recom">
					<ul>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<!------------------公共盒子-------------------->
			<div class="public_box bg2">
				<div class="public_title">
					<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
						<div class="name"><img src="<%=path %>/images/f_t_project.png"/></div>
						<div class="more"><a href="#">更多>></a></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------公共推荐-------------------->
				<div id="public_recom">
					<ul>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<!------------------公共盒子-------------------->
			<div class="public_box bg2">
				<div class="public_title">
					<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
						<div class="name"><img src="<%=path %>/images/f_t_food.png"/></div>
						<div class="more"><a href="#">更多>></a></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------公共推荐-------------------->
				<div id="public_recom">
					<ul>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<div class="clear"></div>
					</ul>
				</div>
			</div>
			<!------------------公共盒子-------------------->
			<div class="public_box bg2">
				<div class="public_title">
					<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
						<div class="name"><img src="<%=path %>/images/f_t_life.png"/></div>
						<div class="more"><a href="#">更多>></a></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------公共推荐-------------------->
				<div id="public_recom">
					<ul>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<li>
							<a href="#">
								<div class="pic"><img class="scale-effect" src="<%=path %>/images/2016122223895.jpg"/></div>
								<p>洛阳古城慢时</p>
							</a>
						</li>
						<div class="clear"></div>
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