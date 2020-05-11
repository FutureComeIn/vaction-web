<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>常用联系人</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
	<!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/user.css">  
    <script type="text/javascript">
    	$(function(){
    		$(".save").click(function(){
    			for(var i=0;i<$(".text").size()-1;i++){
    				if($(".text").eq(i).val()==""||$(".text").eq(i).val()==null){
    					alert("请将信息填写完整");
    					return;
    				}
    			}
    			if($("textarea").val()==""||$("textarea").val()==null){
    				alert("请将信息填写完整");
    				return;
    			}
    			//alert("1值为="+$(".chk_1").val());
    			if($(".chk_1").attr("checked")=="checked"){
    				$(".chk_1").val("是");
    			}else{
    				$(".chk_1").val("否");
    			}
    			//alert("2值为="+$(".chk_1").val());
    			document.myform.submit();
    		})
    	})
    	
    	function setDefault(cno,cuno){
    		window.location.href="<%=path %>/UserServlet?type=setAddress&cno="+cno+"&cuno="+cuno;
    	}
    	function delAddress(cno){
    		if(confirm("您确认删除吗")){
    			window.location.href="<%=path %>/UserServlet?type=delAddress&cno="+cno;
    		}
    	}
    </script>  
</head>
<body>
	<jsp:include page="/qiantai/user/userHead.jsp" flush="true"></jsp:include>
<!-----------------框架---------------->
<div class="cw1000">
	<div class="w280 fl">
		<div class="public_box">
			<!-----------------设置导航---------------->
			<div id="set_nav">
				<ul>
					<li><a href="<%=path %>/qiantai/user/my_info.jsp"><i class="ico1"></i>我的信息</a></li>
					<li><a href="<%=path %>/qiantai/user/my_head.jsp"><i class="ico2"></i>我的头像</a></li>
					<li><a class="cur" href="<%=path %>/UserServlet?type=select_contact&uno=${user.uno}"><i class="ico3"></i>常用联系人</a></li>
					<li><a href="<%=path %>/qiantai/user/security.jsp"><i class="ico4"></i>修改密码</a></li>
				</ul>
			</div>
		</div>	
	</div>
	<div class="w700 fr">
		<div class="public_box">
			<!-----------------常用联系人---------------->
			<div id="set_box">
				
				<div class="title"><h2>常用联系人</h2></div>
				
				<form action="<%=path %>/UserServlet?type=addContact&uno=${user.uno }" method="post" name="myform">
				<table class="table_list">
					<tr>
						<th>姓名：</th>
						<td><input class="text" type="text" name="name" value="${user.uname }"/></td>
					</tr>
					<tr>
						<th>地址：</th>
						<td><textarea name="address"></textarea></td>
					</tr>
					<tr>
						<th>手机号码：</th>
						<td><input class="text" name="mobile" type="text" /></td>
					</tr>
					<tr>
						<th>邮政编码：</th>
						<td><input class="text" name="post" type="text" value="000000" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<label class="am-checkbox">
								<input type="checkbox" id="checkbox_a1" class="chk_1" name="isDefault" /> 
								<label for="checkbox_a1"></label> 设置为默认
							</label>
						</td>
					</tr>
				</table>
				</form>
				
				<div class="operation"><input type="button" class="save" value="保存" /></div>
				<!-----------------联系列表---------------->
				<ul class="address">
					<li class="title">已保存${count }条地址，还能保存${10-count }条</li>
					<c:forEach items="${clist }" var="contact">
					<li>
						<div>
							<div class="dt">联系人：</div>
							<div class="dd">${contact.cname }</div>
							<div class="clear"></div>
						</div>
						<div>
							<div class="dt">详细地址：</div>
							<div class="dd">
								<p>${contact.caddress }</p>
							</div>
							<div class="clear"></div>
						</div>
						<div>
							<div class="dt">邮政编码：</div>
							<div class="dd">${contact.cpostcard }</div>
							<div class="clear"></div>
						</div>
						<div>
							<div class="dt">手机号码：</div>
							<div class="dd">${contact.cmobile }</div>
							<div class="clear"></div>
						</div>
						<c:if test="${contact.cdefault=='是'}">
							<div class="i-first" style="color:red">默认地址</div>
							<div class="btns">
							<a href="javascript:;" data-id="183590" class="delThis" onclick="delAddress(${contact.cno})">删除</a>
							</div>
						</c:if>
						
						<c:if test="${contact.cdefault=='否'}">
							<div class="i-first" style="cursor:pointer;color:skyblue" onclick="setDefault(${contact.cno},${contact.cuno })">设为默认</div>
							<div class="btns">
						<a href="javascript:;" data-id="183590" class="delThis" onclick="delAddress(${contact.cno})">删除</a>
							</div>
						</c:if>
						
					</li>
					</c:forEach>
                </ul>
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