<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.view.GoodsShopcar"%>
<%@page import="com.yxw.util.DBUtil"%>
<%@page import="com.yxw.bean.ShopCar"%>
<%@page import="com.yxw.dao.Shopcarsearchdao"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"  %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
		String sql1="select * from tv_user u inner join (select * from tv_goods g inner join tv_shopcar s on g.gno=s.sgno) gs on gs.suno=u.uno order by sno desc";
		List<GoodsShopcar> GoodsShopcarList=DBUtil.query(sql1, GoodsShopcar.class,null);
		request.getSession().setAttribute("GoodsShopcarList", GoodsShopcarList);
		int yunfei=GoodsShopcarList.size()*5;
		request.getSession().setAttribute("yunfei",yunfei);
		int totalprice=0;
		for(GoodsShopcar gs:GoodsShopcarList){
			totalprice=(int)(totalprice+gs.getSprice());
		}
		System.out.println(GoodsShopcarList);
		totalprice=totalprice+yunfei;
		request.getSession().setAttribute("totalprice",totalprice);
		

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
		/*$(function(){
			var num=${num};
			$num=$("#num");
			$add=$("#add");
			$add.each(function(index,element){
				this.click(function(){
				var num=${GoodsShopcarList}.get(index).scount;
				num++;
				$num.each(function(index,element){
					$num.attr("value",num);
					$("#total").html("￥"+${sessionScope.good.gprice}*num+".00");
				})
				
			})
			})
			
			$("#reduce").click(function(){
			if(num==1){
				alert("商品数量至少为1");
			}else{
				num--;
				}
				$("#num").attr("value",num);
				$("#total").html("￥"+${sessionScope.good.gprice}*num+".00");
			})
		})*/
		function Delete(sno){
			if(window.confirm("是否确认删除？")){
				window.location.href="<%=path%>/ShopDeleteServlet?sno="+sno;
			}
		}
		function AddDel(sgno,n,scount){
			if(n==2){
				window.location.href="<%=path%>/AddDelServlet?sgno="+sgno+"&n="+n;
			}
			if(n==1){
					if(scount>1){
						window.location.href="<%=path%>/AddDelServlet?sgno="+sgno+"&n="+n;
					}
					else{
						alert("商品数量至少为1！");
					}
				}
		}
		function submit(){
			var checkbox=document.getElementsByName("checkbox");
			var u="<%=path%>/SubmitServlet?";
			if(checkbox.length>0){
			for(var i=0;i<checkbox.length;i++){
				if(checkbox[i].checked){
					var sno=checkbox[i].value;
					u=u+"sno="+sno+"&";
  					}	
				}
			var url=u.substring(0,u.length-1);
			if(url=="<%=path%>/SubmitServlet"){
				alert("请至少选择一样商品！");
			}
			else if(url!="<%=path%>/SubmitServlet"){
				window.location.href=url;
			}
			}
			else if(checkbox.length==0){alert("很抱歉哟，您还未添加商品进购物车呢，请先去添加您喜欢的商品吧！")
				window.location.href="#";
			}
		} 
		  
		  
		  window.onload=function xz(){
			var checkbox1=document.getElementsByName("checkbox1");
			var checkbox2=document.getElementsByName("checkbox2");
			var checkbox=document.getElementsByName("checkbox");
			checkbox1[0].onclick= function quanxuan(){
				if(this.checked){
				for(var i=0;i<checkbox.length;i++){
				checkbox[i].checked=true;
			}
			}
			if(!this.checked){
				for(var i=0;i<checkbox.length;i++){
				checkbox[i].checked=false;
				}
			}
			
			}
			checkbox2[0].onclick= function(){
				if(this.checked){
				for(var i=0;i<checkbox.length;i++){
				checkbox[i].checked=true;
			}
			}
			if(!this.checked){
				for(var i=0;i<checkbox.length;i++){
				checkbox[i].checked=false;
				}
			}
			
			}
			
			
			}
		
		
	
	
	</script>
<body>

<!-------------------版头------------------->
<div id="header">
    <div class="cw1000">
        <!-------------------logo------------------->
        <div class="logo"><a title="" href="<%=path %>/index.jsp"><img alt="" src="<%=path %>/images/logo.jpg" /></a></div>
		<!-------------------头部导航------------------->
		<div class="head_title">
			购物车
		</div>
		<!-------------------用户------------------->
		<div class="user">
			<a class="user-hd" href="javascript:;">
				<img src="<%=path %>/${user.utxPath }"/><b></b>
				<div class="clear"></div>
			</a>
			<div class="user-bd">
				<div class="integral"><img src="<%=path %>/images/integral_ico.png"/>当前积分${user.upoint }</div>
				<ul class="nav_sort">
					<li><a href="<%=path %>/qiantai/note/write_note.jsp"><i class="i2"></i>写游记</a></li>
					<li><a href="<%=path %>/QueryNoteByUserIdServlet"><i class="i9"></i>我的游记</a></li>
					<li><a href="<%=path %>/QueryCollectionServlet?currentPage=1"><i class="i3"></i>我的收藏</a></li>
					<li><a href="<%=path %>/qiantai/order/project_order.jsp"><i class="i4"></i>商品订单</a></li>
					<li><a href="<%=path %>/ScenicOrderTypeServlet?i=abc"><i class="i5"></i>旅游订单</a></li>
					<li><a href="<%=path %>/QueryCommentByNoServlet?currentPage=1"><i class="i6"></i>我的评论</a></li>
					<li><a href="<%=path %>/qiantai/user/my_info.jsp"><i class="i7"></i>设置</a></li>
					<li><a href="javascripte:;"><i class="i8"></i>退出</a></li>
				</ul>
			</div>
		</div>
        <div class="clear"></div>
    </div>
</div>

<!-----------------框架---------------->
<div id="shop_car">
	<div class="cw1000">	

		<div class="main_title">
			<ul>
				<li style="width:35%;">
					<label class="am-checkbox">
						<input type="checkbox" id="checkbox_a1" class="chk_1" name="checkbox2"> 
						<label for="checkbox_a1" style="margin-right:10px;"></label> 全选
					</label>
					商品信息
				</li>
				<li style="width:15%;">单价</li>
				<li style="width:20%;">数量</li>
				<li style="width:15%;">总价</li>
				<li style="width:15%;">操作</li>
			</ul>
		</div>
		<div class="list_box">
			<c:forEach items="${GoodsShopcarList}" var="GoodsShopcar">
			<ul>
				<li>
					<div class="con">
						<div class="info" style="width:35%;">
							<label class="am-checkbox" style="float:left;margin-right:15px;">
								<input type="checkbox" id="${GoodsShopcar.sno }" class="chk_1" name="checkbox" value="${GoodsShopcar.sno}"> 
								<label for="${GoodsShopcar.sno }"></label>
							</label>
							<div class="pic"><a href="#"><img alt=""  width=53 height=53 src="<%=path %>/${GoodsShopcar.gheadphotopath }" /></a></div>
							<div class="name">
								<a href="<%=path %>/StepServlet?gno=${GoodsShopcar.sgno}">${GoodsShopcar.gname }</a>
								<p>厂家：${GoodsShopcar.gplace }</p>
							</div>
							<div class="clear"></div>
						</div>
						<div class="price" style="width:15%;"><label>${ GoodsShopcar.gprice}/件</label></div>
						<div class="number" style="width:20%;">
							<div class="Spinner">
								<a id="reduce" href="javascript:void(0)" onclick="AddDel('${GoodsShopcar.sgno}',1,'${GoodsShopcar.scount}')" ><i>-</i></a>
								<input class="Amount" value="${ GoodsShopcar.scount}" autocomplete="off" maxlength="3" id="num"  type="text">
								<a id="add" href="javascript:void(0)" onclick="AddDel('${GoodsShopcar.sgno}',2,'${GoodsShopcar.scount}')"><i>+</i></a>
							</div>
						</div>
						
						<div class="price" style="width:15%;"><span id="total">￥${GoodsShopcar.sprice}</span></div>
						
						<div class="operation" style="width:15%;">
							<a class="evaluation"  onclick="Delete('${GoodsShopcar.sno}')" style="cursor: pointer;">删除</a>
						</div>
						<div class="clear"></div>
					</div>
				</li>
			</ul>
			</c:forEach>
			
		</div>
		<div class="calculation">
			<label class="am-checkbox" style="float:left;padding-left:30px;margin-top:15px;">
				<input type="checkbox" id="checkbox_a0" class="chk_1"  name="checkbox1"> 
				<label style="margin-right:10px;" for="checkbox_a0"></label> 全选
			</label>
			<a onclick="submit()" style="cursor: pointer;" >提交订单</a>
		
			
			<span>合计（含运费${yunfei }.00元）： <b>￥${totalprice }.00</b></span>
			
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