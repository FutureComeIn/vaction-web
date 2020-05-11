<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>订单详情</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css">    
</head>
<body>

<!-------------------版头------------------->
<div id="header">
    <div class="cw1000">
        <!-------------------logo------------------->
        <div class="logo"><a title="" href="<%=path %>/index.jsp"><img alt="" src="<%=path %>/images/logo.jpg" /></a></div>
		<!-------------------头部导航------------------->
		<div class="head_title">
			订单详情
		</div>
		<!-------------------用户------------------->
		<div class="user">
			<a class="user-hd" href="#">
				<img src="<%=path %>/images/user_head_pic.jpg"/><b></b>
				<div class="clear"></div>
			</a>
			<div class="user-bd">
				<div class="integral"><img src="<%=path %>/images/integral_ico.png"/>当前积分 609</div>
				<ul class="nav_sort">
					<li><a href="<%=path %>/qiantai/note/write_note.jsp"><i class="i2"></i>写游记</a></li>
					<li><a href="<%=path %>/qiantai/note/my_note.jsp"><i class="i9"></i>我的游记</a></li>
					<li><a href="<%=path %>/qiantai/user/collection_list.jsp"><i class="i3"></i>我的收藏</a></li>
					<li><a href="<%=path %>/qiantai/order/project_order.jsp"><i class="i4"></i>商品订单</a></li>
					<li><a href="<%=path %>/qiantai/order/scenic_order.jsp"><i class="i5"></i>旅游订单</a></li>
					<li><a href="<%=path %>/qiantai/note/note_comments.jsp"><i class="i6"></i>我的评论</a></li>
					<li><a href="<%=path %>/qiantai/user/my_info.jsp"><i class="i7"></i>设置</a></li>
					<li><a href="javascripte:;"><i class="i8"></i>退出</a></li>
				</ul>
			</div>
		</div>
        <div class="clear"></div>
    </div>
</div>

<!-----------------订单详情---------------->
<div id="order_details">
	<div class="cw1000">	
		<div class="public_box pd30">
			<div class="state">
				<p>当前订单状态： <span>未付款已付款</span></p>
				<p>请及时付款，不然就被抢光啦！</p>
				<a class="buy" href="<%=path %>/qiantai/order/confirm_order_food.jsp">付款</a>
				<a class="comment" href="<%=path %>/qiantai/order/post_comment.jsp">评价</a>
			</div>
			<div class="info">
				<table>
					<tr>
						<th>订单信息</th>
					</tr>
					<tr>
						<td><p>小提示：记下或拍下兑换码向商家出示即可消费，无需等待短信</p></td>
					</tr>
					<tr>
						<td>兑换码：1660 6051 0231</td>
					</tr>
				</table>
			</div>
			<div class="info">
				<table>
					<tr>
						<th colspan="3">订单信息</th>
					</tr>
					<tr>
						<td>收货人：张筱筱</td>
						<td>电话：13213526789</td>
						<td>邮编：471000</td>
					</tr>
					<tr>
						<td colspan="3">收货地址：河南省洛龙区开元大道关圣洁紫禁城一号7就好空间就看见对方</td>
					</tr>
				</table>
			</div>
			<div class="list_box">
				<table>
					<tbody>
						<tr>
							<th>商品名称</th>
							<th>单价</th>
							<th>数量</th>
							<th>总价</th>
						</tr>
						<tr>
							<td>
								<div class="pic"><a href="#"><img width="53" height="53" src="<%=path %>/images/09.jpg"></a></div>
								<div class="name">
									<a href="#">孟津特供香酥梨一斤</a>
									<p>下单日期：2017-03-06</p>
								</div>
								<div class="clear"></div>
							</td>
							<td style="text-align:center;">￥50.0</td>
							<td style="text-align:center;">2</td>
							<td rowspan="2" style="text-align:center;">￥100.0</td>
						</tr>
						<tr>
							<td>
								<div class="pic"><a href="#"><img width="53" height="53" src="<%=path %>/images/09.jpg"></a></div>
								<div class="name">
									<a href="#">孟津特供香酥梨一斤</a>
									<p>下单日期：2017-03-06</p>
								</div>
								<div class="clear"></div>
							</td>
							<td style="text-align:center;">￥50.0</td>
							<td style="text-align:center;">2</td>
						</tr>
						
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	<div class="clear"></div>
</div>
<!-----------------版底---------------->
<div id="footer">
	<p>河洛文化旅游发展有限公司 版权所有</p>
	<p>Copyright 2016 zgqygc.com All Rights Reserved | 豫ICP备10000000号　技术支持：闪迅</p>
</div>
</body>
</html>