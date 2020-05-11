<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.yxw.bean.Goods"%>
<%@page import="com.yxw.dao.TypeSearchAlldao"%>
<%@page import="com.yxw.bean.GoodPhoto"%>
<%@page import="com.yxw.util.DBUtil"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
			Goods good=(Goods)request.getSession().getAttribute("good");
			String sql="select *from tv_goodphoto where gpgno="+good.getGno();
			GoodPhoto goodphoto=(GoodPhoto)DBUtil.query(sql,GoodPhoto.class,null).get(0);
			request.getSession().setAttribute("goodphoto",goodphoto);

 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">    
	<script>
	$(function(){

		$("#Addcar").click(function(){
		   <c:if test="${sessionScope.user==null}">
                  alert("请先登录");
                  return;
           	</c:if>
			var $num=$("#qty_item_1");			
			var num=$num.attr("value");
			var total=$("#total_item_1").html();
			var total1=total.substring(1,total.length-3);
			window.location.href="<%=path%>/ShopcaraddServlet?scount="+num+"&sprice="+total1;
			
		})
		$("#buy").click(function(){
			<c:if test="${sessionScope.user==null}">
                  alert("请先登录");
                  return;
           	</c:if>
			var $num=$("#qty_item_1");			
			var num=$num.attr("value");
			var total=$("#total_item_1").html();
			var total1=total.substring(1,total.length-3)
			window.location.href="<%=path %>/BuyServlet?scount="+num+"&sprice="+total1;
			
		})
	})
	
	
	</script>

</head>
<body>

<!-------------------工具栏------------------->
<jsp:include flush="true" page="/head_qt.jsp"></jsp:include>

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
					<input class="inp_srh" name="keyboard"  placeholder="请输入您要搜索的关键词" >
					<input class="btn_srh" type="submit" name="submit" value="搜索">
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

<!------------------子页框架-------------------->
<div id="sub_from" style="padding-top:10px;">
    <div class="cw1200">
		<!------------------公共盒子-------------------->
		<div class="public_box bg1">
			<div class="public_title">
				<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
				<div class="con">
					<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
					<div class="name"><img src="<%=path %>/images/f_t_item_info.png"/></div>
				</div>
				<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
				<div class="clear"></div>
			</div>
			<!------------------特产信息-------------------->
			<div id="item_info">
				<!-----------------主图---------------->
				<div class="preview">
					<div id="vertical" class="bigImg">
						<img src="${good.gheadphotopath }" id="midimg" />
						<div style="display:none;" id="winSelector"></div>
					</div>
					<div id="imageMenu">
						<ul>
							<li id="onlickImg"><img src="${goodphoto.gppath1 }"/></li>
							<li><img src="${goodphoto.gppath2 }"/></li>
							<li><img src="${goodphoto.gppath3}"/></li>
							<li><img src="${goodphoto.gppath4}"/></li>
							<li><img src="${goodphoto.gppath5}"/></li>
						</ul>
					</div>
					<div id="bigView" style="display:none;"><img width="800" height="800" /></div>
				</div>
				<!-----------------内容信息---------------->
				<div class="cont_info">
					<div class="name"><h2>${good.gname }</h2></div>
					<!-------------商品属性（价位数量）---------------->
					<div class="p_number">
						<div class="unit_price">
							<ul>
								<li class="fl">商品单价：<strong id="price_item_1">￥${good.gprice }</strong></li>
								<li class="fr">已成交：${good.gdealcount }笔</li>
								<div class="clear"></div>
							</ul>
						</div>
						<!------------商品规格-------------->
						<script type="text/javascript">
							$(function(){
							$(".yListr ul li em").click(function(){
								$(this).addClass("yListrclickem").siblings().removeClass("yListrclickem");
							})
							})
						</script>
						<div class="yListr">
							<ul>
								<li>
									<span>颜色</span>
									<em class="yListrclickem">深灰色<i></i></em>
									<em>金色<i></i></em>
									<em>银色<i></i></em>
								</li>
								<li>
									<span>尺寸</span>
									<em class="yListrclickem">港版（二网）<i></i></em>
									<em>类型<i></i></em>
								</li>
							</ul>
						</div>
						<!-------------数量增减变动价格（产品页）-------------->
						<script type="text/javascript" src="js/payfor.js"></script>
						<div class="add_chose">
							<label>数量：</label>
							<a class="reduce" onClick="setAmount.reduce('#qty_item_1')" href="javascript:void(0)">-</a>
							<input type="text" name="qty_item_1" value="1" id="qty_item_1" onKeyUp="setAmount.modify('#qty_item_1')" class="text" />
							<a class="add" onClick="setAmount.add('#qty_item_1')" href="javascript:void(0)">+</a>
							<div class="clear"></div>
						</div>
						<div class="buy">
							<ul>
								<li>总价：<span class="total-font" id="total_item_1">￥${good.gprice }</span></li>
								<li><span class="jifen">购买商品可获得：${good.gpoint }积分</span></li>
								<li><a class="go_buy" id="buy" style="cursor: pointer;">立即购买</a><a class="car_buy" id="Addcar" style="cursor: pointer;">加入购物车</a></li>
								<li>运费：<span class="tp_bg">卖家承担运费</span></li>
								<li>提醒：<span class="tp_bg">此商品为鲜活易腐类，不支持7天无理由退货</span></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="clear"></div>	
		</div>
		<div class="w810 fl">
			<!------------------公共盒子-------------------->
			<div class="public_box bg1">
				<div class="public_title">
					<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
						<div class="name"><img src="<%=path %>/images/f_t_project_d.png"/></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------特产详情-------------------->
				<div id="project_details">
					<img alt="" src="${good.gdetailphotopath}"/>
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
						<div class="name"><img src="<%=path %>/images/f_t_hot_project.png"/></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------商品推荐-------------------->
				<div id="project_recom">
					<c:forEach items="${goodList}" var="goods">
					<ul>
						<li>
							<div class="pic"><a href="<%=path %>/StepServlet?gno=${goods.gno}"><img class="scale-effect" src="${goods.gheadphotopath}"/></a></div>
							<div class="con">
								<a href="<%=path %>/StepServlet?gno=${goods.gno}">${goods.gname }</a>
								<p>￥<label>${goods.gprice}</label></p>
							</div>
							<div class="clear"></div>
						</li>
						
					</ul>
					</c:forEach>
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
        <div >
            <p>河洛文化旅游发展有限公司 版权所有</p>
            <p>地址：河南省洛阳市孟津县旅游游客接待中心　邮编：471000　电话：0379-60000000　业务电话：0379-6000000</p>
            <p>Copyright 2016 zgqygc.com All Rights Reserved | 豫ICP备10000000号　技术支持：闪迅</p>
        </div>
        <div class="clear"></div>
    </div>
</div>


<!-----------------产品主图特效---------------->
<script type="text/javascript">
$(document).ready(function(){
	// 图片上下滚动
	var count = $("#imageMenu li").length - 5; /* 显示 6 个 li标签内容 */
	var interval = $("#imageMenu li:first").width();
	var curIndex = 0;
	
	$('.scrollbutton').click(function(){
		if( $(this).hasClass('disabled') ) return false;
		
		if ($(this).hasClass('smallImgUp')) --curIndex;
		else ++curIndex;
		
		$('.scrollbutton').removeClass('disabled');
		if (curIndex == 0) $('.smallImgUp').addClass('disabled');
		if (curIndex == count-1) $('.smallImgDown').addClass('disabled');
		
		$("#imageMenu ul").stop(false, true).animate({"marginLeft" : -curIndex*interval + "px"}, 600);
	});
	
	// 解决 ie6 select框 问题
	$.fn.decorateIframe = function(options) {
        if ($.browser.msie && $.browser.version < 7) {
            var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
            $(this).each(function() {
                var $myThis = $(this);
                //创建一个IFRAME
                var divIframe = $("<iframe />");
                divIframe.attr("id", opts.iframeId);
                divIframe.css("position", "absolute");
                divIframe.css("display", "none");
                divIframe.css("display", "block");
                divIframe.css("z-index", opts.iframeZIndex);
                divIframe.css("border");
                divIframe.css("top", "0");
                divIframe.css("left", "0");
                if (opts.width == 0) {
                    divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                if (opts.height == 0) {
                    divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
                }
                divIframe.css("filter", "mask(color=#fff)");
                $myThis.append(divIframe);
            });
        }
    }
    $.fn.decorateIframe.defaults = {
        iframeId: "decorateIframe1",
        iframeZIndex: -1,
        width: 0,
        height: 0
    }
    //放大镜视窗
    $("#bigView").decorateIframe();

    //点击到中图
    var midChangeHandler = null;
	
    $("#imageMenu li img").bind("click", function(){
		if ($(this).attr("id") != "onlickImg") {
			midChange($(this).attr("src").replace("small", "mid"));
			$("#imageMenu li").removeAttr("id");
			$(this).parent().attr("id", "onlickImg");
		}
	}).bind("mouseover", function(){
		if ($(this).attr("id") != "onlickImg") {
			window.clearTimeout(midChangeHandler);
			midChange($(this).attr("src").replace("small", "mid"));
			$(this).css();
		}
	}).bind("mouseout", function(){
		if($(this).attr("id") != "onlickImg"){
			$(this).removeAttr("style");
			midChangeHandler = window.setTimeout(function(){
				midChange($("#onlickImg img").attr("src").replace("small", "mid"));
			}, 1000);
		}
	});

    function midChange(src) {
        $("#midimg").attr("src", src).load(function() {
            changeViewImg();
        });
    }

    //大视窗看图
    function mouseover(e) {
        if ($("#winSelector").css("display") == "none") {
            $("#winSelector,#bigView").show();
        }

        $("#winSelector").css(fixedPosition(e));
        e.stopPropagation();
    }


    function mouseOut(e) {
        if ($("#winSelector").css("display") != "none") {
            $("#winSelector,#bigView").hide();
        }
        e.stopPropagation();
    }


    $("#midimg").mouseover(mouseover); //中图事件
    $("#midimg,#winSelector").mousemove(mouseover).mouseout(mouseOut); //选择器事件

    var $divWidth = $("#winSelector").width(); //选择器宽度
    var $divHeight = $("#winSelector").height(); //选择器高度
    var $imgWidth = $("#midimg").width(); //中图宽度
    var $imgHeight = $("#midimg").height(); //中图高度
    var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度

    function changeViewImg() {
        $("#bigView img").attr("src", $("#midimg").attr("src").replace("mid", "big"));
    }

    changeViewImg();

    $("#bigView").scrollLeft(0).scrollTop(0);
    function fixedPosition(e) {
        if (e == null) {
            return;
        }
        var $imgLeft = $("#midimg").offset().left; //中图左边距
        var $imgTop = $("#midimg").offset().top; //中图上边距
        X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
        Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
        X = X < 0 ? 0 : X;
        Y = Y < 0 ? 0 : Y;
        X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
        Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;

        if ($viewImgWidth == null) {
            $viewImgWidth = $("#bigView img").outerWidth();
            $viewImgHeight = $("#bigView img").height();
            if ($viewImgWidth < 200 || $viewImgHeight < 200) {
                $viewImgWidth = $viewImgHeight = 800;
            }
            $height = $divHeight * $viewImgHeight / $imgHeight;
            $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);
            $("#bigView").height($height);
        }

        var scrollX = X * $viewImgWidth / $imgWidth;
        var scrollY = Y * $viewImgHeight / $imgHeight;
        $("#bigView img").css({ "left": scrollX * -1, "top": scrollY * -1 });
        $("#bigView").css({ "top": 75, "left": $(".preview").offset().left + $(".preview").width() + 15 });

        return { left: X, top: Y };
    }

});
</script>
</body>
</html>