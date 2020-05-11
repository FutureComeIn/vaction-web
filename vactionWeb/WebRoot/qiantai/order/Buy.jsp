 <%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"   %>
<%@page import="com.yxw.dao.Contactdao"%>
<%@page import="com.yxw.bean.Contact"%>
<%@page import="com.yxw.bean.User"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%	
	int scount=Integer.parseInt(request.getParameter("scount"));
	int sprice=Integer.parseInt(request.getParameter("sprice"));
	int sprice1=sprice+5;
	SimpleDateFormat  xiadandate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	request.getSession().setAttribute("xiadandate",xiadandate.format(new java.util.Date()));
	request.getSession().setAttribute("scount",scount);
	request.getSession().setAttribute("sprice",sprice);
	request.getSession().setAttribute("sprice1",sprice1);
	User user=(User)request.getSession().getAttribute("user");
	List<Contact> contactList=new Contactdao().queryByCuno(user.getUno());
	request.getSession().setAttribute("contactList",contactList);
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>确认订单</title>
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
	function jiesuan(){
		if(window.confirm("是否确认付款？")){
		alert("付款成功！为您继续跳转到商城页面。。")
			window.location.href="<%=path%>/DanjiesuanServlet";
		}
	}
	

	
	function dianji(s){
		var div=document.getElementById("div1").getElementsByTagName("li");
		for(var i=0;i<div.length;i++){
			div[i].index=i;
			if((div[i].index+1)==s){
				div[i].setAttribute("class", "cur");
				var cno=div[i].id;
			}
			else{
				div[i].removeAttribute("class");
			}
		}
		
		shouhuo(cno);
	}
	function shouhuo(cno){
     var xhr;
      if(XMLHttpRequest){
      xhr=new XMLHttpRequest();
      }
      else{
      xhr=new ActiveXObject("Microsoft.XMLHTTP");
      }
      
      xhr.open("post","<%=path%>/ShServlet",true);
      
      xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
     
      xhr.send("cno="+cno);
    
      xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
        
           var dq=xhr.responseText;
       		alert(dq);
        } 
                
        }
       
	
	
	
	}
	

	function zhifu(n){
		var li1=document.getElementById("支付宝支付");
		var li2=document.getElementById("微信支付");
		if(n==1){
				li1.setAttribute("class", "cur");
				li2.removeAttribute("class");
			}
		if(n==2){
				li2.setAttribute("class", "cur");
				li1.removeAttribute("class");
		
		}
		
		zf(n);
	}
	function zf(n){
	  var xhr;
      if(XMLHttpRequest){
      xhr=new XMLHttpRequest();
      }
      else{
      xhr=new ActiveXObject("Microsoft.XMLHTTP");
      }
      
      xhr.open("post","<%=path%>/ZfServlet",true);
      
      xhr.setRequestHeader("content-type", "application/x-www-form-urlencoded");
     
      xhr.send("n="+n);
    
      xhr.onreadystatechange=function(){
        if(xhr.readyState==4&&xhr.status==200){
        
           var dq=xhr.responseText;
       		alert(dq);
        } 
                
        }
      
	
	}
	
	

</script>
<body>

<br /><br /><!-------------------版头------------------->
<div id="header">
    <div class="cw1000">
        <!-------------------logo------------------->
        <div class="logo"><a title="" href="<%=path %>/index.jsp"><img alt="" src="<%=path%>${ov.gheadphotopath}" /></a></div>
		<!-------------------头部导航------------------->
		<div class="head_title">
			确认订单
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
					<li><a href="<%=path %>/qiantai/user/my_index.jsp"><i class="i1"></i>我的主页</a></li>
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

<!-----------------确认订单---------------->
<div id="confirm_order">
	<div class="cw1000">	

		<!-----------------收货人信息---------------->
		<div class="addr_list" id="div1">
			<h2>收货人信息</h2>
			
			<ul>
			<c:forEach items="${sessionScope.contactList}" var="contact" varStatus="s">
				<li onclick="dianji(${s.index+1})" id="${contact.cno}">
					<h1>${contact.cname}<span>&nbsp;&nbsp;&nbsp;${contact.cmobile}</span></h1>
					<p>${contact.caddress}</p>
				</li>
				</c:forEach>
				<div class="clear"></div>
			</ul>
			
			<div class="add"><a href="<%=path %>/qiantai/user/my_contact.jsp">收货人添加与管理</a></div>
		</div>
		
		<!-----------------送货清单---------------->
		<div class="list_box">
			<h2>送货清单</h2>
			<table>
				<tr>
					<th>商品名称</th>
					<th>单价</th>
					<th>数量</th>
					<th>小计</th>
				</tr>
				<tr>
					<td>
						<div class="pic"><a href="#"><img width=53 height=53 src="<%=path %>/images/t2.jpg" /></a></div>
						<div class="name">
							<a href="<%=path %>/StepServlet?gno=${good.gno}">${good.gname }</a>
							<p>${xiadandate }</p>
						</div>
						<div class="clear"></div>
					</td>
					<td style="text-align:center;">￥${good.gprice }</td>
					<td style="text-align:center;">x${scount}</td>
					<td style="text-align:center;">￥${sprice}.0</td>
				</tr>
				
			</table>
		
		</div>
		<div class="pay_method" id="dd">
			<h2>支付方式</h2>
			<ul>
				<li><a  onclick="zhifu(1)" id="支付宝支付" style="cursor: pointer;">支付宝支付</a><span>← 选择支付宝支付商品金额</span></li>
				<li><a onclick="zhifu(2)" id="微信支付" style="cursor: pointer;">微信支付</a><span>← 选择微信钱包支付商品金额</span></li>
			</ul>
		</div>
		<div class="calculation">
		
			
			<input type="button" onclick="jiesuan()" value="结算" />
			<span>应付金额（含运费5.00元）： <b>￥${sprice1}.0</b></span>
			
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