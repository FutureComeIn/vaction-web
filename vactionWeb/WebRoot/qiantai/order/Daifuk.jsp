<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.view.Orderss"%>
<%@page import="com.yxw.util.DBUtil"%>
<%@page import="com.yxw.bean.GoodOrder"%>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
	String sql="select *from(select *from(select *from tv_goodorder g inner join tv_orderdetail o on g.gono=o.odgono) go inner join tv_goods gd on go.odgno=gd.gno) yy where yy.odtype='未付款'";
	String sql1="select *from tv_goodorder";
	List<Orderss> odList=DBUtil.query(sql,Orderss.class,null);

	System.out.println("odList:"+odList);
	List<GoodOrder> goList=DBUtil.query(sql1,GoodOrder.class,null);
	System.out.println("goList:"+goList);
	request.getSession().setAttribute("odList",odList);
	request.getSession().setAttribute("goList",goList);

 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>商品订单</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css">    
</head>
<script>
	function del(gono){
	if(window.confirm("是否确认删除订单？")){
		alert("删除成功！");
		window.location.href="<%=path%>/OrderDelServlet?gono="+gono;
	}
		
	}


</script>
<body>

<!-------------------版头------------------->
<jsp:include page="/qiantai/user/userHead.jsp" flush="true"></jsp:include>
<!-----------------框架---------------->
<div class="cw1000">
	<div class="public_box pd10">
		<div class="list_title">
			<h2>商品订单</h2>
		</div>
		<div class="public_tag">
			<ul>
				<li><a  href="<%=path %>/qiantai/order/project_order.jsp">全部订单</a></li>
				<li><a class="cur" href="#">待付款</a></li>
				<div class="clear"></div>
			</ul>
		</div>
		<!-----------------商品订单---------------->
		<div class="order_list">
			<div class="column_title">
				<ul>
					<li style="width:35%;">订单信息</li>
					<li style="width:10%;">数量</li>
					<li style="width:10%;">单价</li>
					<li style="width:10%;">总价</li>
					<li style="width:20%;">订单状态</li>
					<li style="width:15%;">操作</li>
				</ul>
			</div>
			<div class="list_con">
				<c:forEach items="${sessionScope.goList}" var="go">
				<ul>
				<c:forEach items="${sessionScope.odList}" var="od">
					<li>
						<div class="serial">订单编号：${go.gono}<a style="cursor: pointer;" onclick="del(${go.gono})"><i class="del"></i>删除</a></div>
						<div class="cont">
								<div class="con">
								
								<div class="info" style="width:35%;">
									<div class="pic"><a href="#"><img width=53 height=53 src="<%=path %>/${od.gheadphotopath }" /></a></div>
									<div class="name">
										<a href="#">${od.gname }</a>
										<p>下单日期：${od.godate }</p>
									</div>
									<div class="clear"></div>
								</div>
								
								<div class="number" style="width:10%;">x${od.odcount }</div>
								<div class="price" style="width:10%;">￥${od.gprice}</div>
								
								<div class="m_price" style="width:10%;"><div class="middle">￥${go.goprice	 }</div></div>
								<div class="state" style="width:20%;">
									<div class="middle">
										<p>${od.odtype  }</p>
									</div>
								</div>
								<div class="operation" style="width:15%;">
									
								</div>
								<div class="clear"></div>
							</div>
							
						</div>
						
						
					</li>
					</c:forEach>
					
				</ul>
				</c:forEach>
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