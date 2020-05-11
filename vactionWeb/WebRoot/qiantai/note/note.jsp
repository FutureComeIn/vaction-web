<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>游记</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    <!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css">
    <script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    
    <script src="<%=path %>/js/jquery-1.8.2.min.js"></script>
    <script>
          $(function(){
          	//点击发表按钮
			$(".submit").click(function(){
				if("${sessionScope.user}"==""){
				   alert("请先登录");
				   window.location.href="<%=path%>/qiantai/user/login.jsp";
				}
			else{
			
				if(document.getElementById("save").value==""){
				   alert("评论不能为空！");
				}
				else{
				 $("#myform1").attr("action","${pageContext.request.contextPath }/saveCommentServlet");
        		document.myform.submit();
				}
			}
			})
			$(".update").click(function(){
				if("${sessionScope.user}"==""){
				   alert("登录之后才能收藏哦！");
				   window.location.href="<%=path%>/qiantai/user/login.jsp";
				}
				else{
				   var id=$(this).parent().find("input").val();
				   window.location.href="<%=path%>/SaveCollectionServlet?cnno="+id;
				   alert("收藏成功！");
				}
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
	                <li><a class="tta" title="" href="<%=path %>/ScenicServlet?type=qt_select">孟津旅游</a></li>
	                <li><a title="" href="<%=path %>/QianQueryAllGoodsServlet">特产商城</a></li>
	                <li><a title="" class="cur" href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=1">攻略游记</a></li>
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!------------------游记版头-------------------->
	    
<div id="note_head">
	<div class="head">
		<div class="banner"><img src="<%=path %>/images/DD0E49BD-47F5-4B10-85DB-FE2390B91541.jpg"/></div>
		<div class="title">
		    <c:forEach items="${ncontent}" var="content" >
			<div class="cw1200"><p>${content.ntitle }</p></div>
			<span><img src="<%=path %>/images/eye_ico.png"/>999+</span>
		</div>
	</div>
	<div class="user">
		<div class="cw1200">
			<div class="pic"><img src="<%=path %>/images/head1.jpg"/></div>
			<div class="meta">
				<label>作者:${content.uname }</label>
				<span>${content.nsendtime }</span>
			</div>
			<div class="operation">
				<a href="#" class="update">
					<img src="<%=path %>/images/collection_ico.png"/>
					<input type="hidden"  value="${content.nno}"/>
					<p>收藏</p>
				</a>
			</div>
			
		</div>
		
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
				<!------------------文章-------------------->
				<div id="article">
	
					<div class="con">
						<p>${content.ncontent }</p>
						
						<img alt="" src="${content.nsendfmPath }"/>
					</div>
				</div>		
			</div>
			</c:forEach >
			<!------------------公共盒子-------------------->
			<div class="public_box bg1">
				<div class="public_title">
					<div class="fl"><img src="<%=path %>/images/from_title_left.png"/></div>
					<div class="con">
						<div class="lamp_ico"><img src="<%=path %>/images/lamp_ico.png"/></div>
						<div class="name"><img src="<%=path %>/images/f_t_comment.png"/></div>
					</div>
					<div class="fr"><img src="<%=path %>/images/from_title_right.png"/></div>
					<div class="clear"></div>
				</div>
				<!------------------评论-------------------->
				<div id="comment">
					<div class="release">
						<img src="<%=path %>/images/head1.jpg"/>
						<form  id="myform1"  method="post" name="myform" >
						<input type="hidden" name="noteNo" value="${requestScope.noteNo }"/>
						<input id="save" class="text" type="text" name="comment" placeholder="说说你的看法..."/>
						<input class="submit"  type="button" value="发表"/>
						<div class="clear"></div>
						</form>		
					</div>
					
					<div class="list">
						<ul>
					 <a class="cur" href="#">最新评论</a>
						<div class="tag">
						</div>	
						<c:forEach items="${comList}" var="comment" >
							<li>    
								<div class="pic"><img src="<%=path %>/images/head1.jpg"/></div>
								<div class="con">
									<label>${comment.uname }</label>
									<p>${comment.ccontent }</p>
									<span>发表于：${comment.cdate }</span>
								</div>
							</li>
							</c:forEach>
						</ul>
					</div>
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
<body>t</body>
</html>