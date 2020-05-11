<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
   <title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    <!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">     
</head>
<body>
<!-------------------二维码看手机------------------->
<div id="phone_rwm">
	<img src="<%=path %>/images/phone_rwm.png">
	<p>手机扫一扫二维码<br>观看手机端</p>
</div>

<!-------------------工具栏-- 版头----------------->
<jsp:include flush="true" page="/head_qt.jsp"></jsp:include>
	<!--此处:jsp:include jsp:include 要写在一行且空格都不能有(且不能出现在注释里) -->

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
                    <li><a title="" class="cur" href="<%=path %>/index.jsp">首页</a></li>
	                <li><a class="tta" title="" href="<%=path %>/ScenicServlet?type=qt_select">孟津旅游</a></li>
	                <li><a title="" href="<%=path %>/QianQueryAllGoodsServlet">特产商城</a></li>
	                <li><a title="" href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=1">攻略游记</a></li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>

<!------------------banner-------------------->
<script src="js/jquery.superslide.2.1.1.js" type="text/javascript"></script>
<div class="h_banner">
	<ul class="h_b_list">
		<li><a style="background:url(<%=path %>/images/banner1.jpg) no-repeat center;" href="#"></a></li>
		<li><a style="background:url(<%=path %>/images/banner2.png) no-repeat center;" href="#"></a></li>
		<li><a style="background:url(<%=path %>/images/banner3.jpg) no-repeat center;" href="#"></a></li>
		<li><a style="background:url(<%=path %>/images/banner4.png) no-repeat center;" href="#"></a></li>
	</ul>
	<a class="prev" href="javascript:void(0)"></a>
	<a class="next" href="javascript:void(0)"></a>
</div>

	<script>
	/*鼠标移过，左右按钮显示*/
	$(".h_banner").hover(function(){
		$(this).find(".prev,.next").fadeTo("show",0.5);
	},function(){
		$(this).find(".prev,.next").hide();
	})
	/*鼠标移过某个按钮 高亮显示*/
	$(".prev,.next").hover(function(){
		$(this).fadeTo("show",1);
	},function(){
		$(this).fadeTo("show",0.7);
	})
	$(".h_banner").slide({ titCell:".num ul" , mainCell:".h_b_list" , effect:"fold", autoPlay:true, delayTime:700 , autoPage:true });
	</script>
	

<!------------------广告-------------------->
<div class="h_gg">
    <a title="" href="javascript:;"><img alt="" src="images/g1.jpg"/></a>
    <a title="" href="javascript:;"><img alt="" src="images/g2.jpg"/></a>
    <a title="" href="javascript:;"><img alt="" src="images/g3.jpg"/></a>
    <a title="" href="javascript:;"><img alt="" src="images/g4.jpg"/></a>
</div>



<div class="h_bg1_g"></div>


<!------------------孟津旅游-------------------->
<div id="h_scenic">
    <div class="cw1200">
        <div class="title"><img alt="" src="images/h_title2.png"/></div>
        <div class="con">
            <div class="tag"><img alt="" src="images/h_title2_t.jpg"/></div>
            <div class="box">
                <ul>
                	<c:forEach items="${qtslist }" var="qtscenic">
                	
                    <li><a title="" href="<%=path %>/ScenicServlet?type=qt_select1&sno=${qtscenic.sno }"><img alt="" class="scale-effect" src="${qtscenic.sheadpath }"/><span>${qtscenic.sname }</span></a></li>
                  
                   </c:forEach>
                   
                    <div class="clear"></div>
                </ul>
                <div class="more"><a href="<%=path %>/ScenicServlet?type=qt_select">热门景区<span>+</span></a></div>
                
            </div>
            
        </div>
    </div>
</div>

<!------------------孟津特产-------------------->
<div id="h_project">
    <div class="cw1200">
        <div class="title"><img alt="" src="images/h_title4.png"/></div>
        <div class="con">
            <ul>
            	<c:forEach items="${qtglist }" var="good">
                <li>
                    <a title="" href="<%=path %>/StepServlet?gno=${good.gno}">
                        <img alt="" class="scale-effect" src="${good.gheadphotopath }"/>
                        <p>${good.gname }</p>
                    </a>
                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>  


<!------------------美丽乡村-------------------->
<div id="h_note">
    <div class="cw1200">
        <div class="title"><img alt="" src="images/h_title5.png"/></div>
        <div class="con">
            <ul>
            	<c:forEach items="${qtnlist }" var="note">
                <li>
                    <div class="box">
                        <div class="pic">
                            <a title="" href="<%=path %>/queryContentOfNoteServlet?nno=${note.nno}"><img alt="" class="scale-effect" src="${note.nsendfmPath }"/></a>
                        </div>
                        <div class="user">
                            <div class="head"><img alt="" src="${note.utxPath }"/></div>
                            <p>${note.uname }</p>
                            <span><label><img alt="" src="images/state_icon1.png"/>${note.nlikecount }</label><label><img src="images/state_icon2.png"/>${note.ncollectcount }</label></span>
                        </div>
                        <div class="cont">
                            <a title="" href="<%=path %>/queryContentOfNoteServlet?nno=${note.nno}"><h3>${note.ntitle }</h3></a>
                            <p>${note.ncontent }</p>
                        </div>
                    </div>
                </li>
				 </c:forEach>
                <div class="clear"></div>
            </ul>
        </div>
    </div>
</div>


	<!-----------------版底---------------->
	<div id="footer">
	    <div class="cw1200">
	        <div class="line"><img alt="" src="images/b_line.png"/></div>
	        <div class="b_logo"><img alt="" src="images/b_logo.png"/></div>
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
