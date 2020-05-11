<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>美丽乡村</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!-------------jquery库-------------->
  	<script type="text/javascript" src="<%=path %>/js/jquery-1.8.3.min.js"></script>
    <!-------------Amazeui--------------->
    <script type="text/javascript" src="<%=path %>/js/amazeui.js"></script>
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/amazeui.css">
    <!------------核心样式-------------->
    <link rel="stylesheet" type="text/css" href="<%=path %>/css/style.css" type="text/css" media="print"/> 
     <Script src="js/jquery-1.8.2.min.js"></Script>
     <Script> 
    function login2(){    
         	if('${sessionScope.user}'==''){
   					alert("请先登陆！");
   					var url="<%=path %>/qiantai/user/login.jsp";
   					window.location.href=url;
   				}else{
                	var url="<%=path %>/qiantai/note/write_note.jsp";
                	window.location.href=url;
         		}		
         }
      </Script>      
</head>
<body>

<!-------------------工具栏---版头---------------->
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
                    <li><a title=""  href="<%=path %>/index.jsp">首页</a></li>
	                <li><a class="tta" title="" href="<%=path %>/ScenicServlet?type=qt_select">孟津旅游</a></li>
	                <li><a title="" href="<%=path %>/QianQueryAllGoodsServlet">特产商城</a></li>
	                <li><a title="" class="cur" href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=1">攻略游记</a></li>          
                </ul>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<!------------------美丽乡村-------------------->
<div id="note_list">
	<div class="banner">
		<h2>美丽乡村</h2>
		<p>发现美丽乡村，记录精彩瞬间，保存美好回忆</p>
	</div>
	<div class="tag">
		<div class="cw1200">
			<a class="cur" href="#">最新游记</a><span></span>
			<a href="javascript:;" onclick="login2()">我要写游记</a>		
		</div>
	</div>
	<div class="con">
		<div class="cw1200">
			<ul class="am-avg-sm-2">
			<c:forEach items="${tnList}" var="note">
				<li>
					<div class="box">
						<div class="pic">
							<div class="cover"><a href="<%=path %>/queryContentOfNoteServlet?nno=${note.nno}"><img class="scale-effect " alt=""  src="${note.nsendfmPath}"/></a></div>
							<div class="head"><img alt="" src="${note.utxPath}"/></div>
						</div>
						<div class="meta">
							<p><a href="<%=path %>/queryContentOfNoteServlet?nno=${note.nno}">${note.ntitle }</a></p>
							<span>${note.nsendtime}作者：${note.uname}<label><img alt="" src="images/state_icon1.png"/>${note.nlikecount }</label><label><img src="<%=path %>/images/state_icon2.png"/>${note.ncollectcount}</label></span>
						</div>
					</div>
				</li>
			</c:forEach>
			</ul>
		</div>
	</div>

<div style="text-align:center;">
                <a href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=1">首页</a>
			     <a href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=${(currentPage-1)>1?(currentPage-1):1}">上一页</a>
			     <a href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=${currentPage<totalPage?(currentPage+1):currentPage}">下一页</a>
			     <a href="<%=path %>/QueryNoteServlet?type=sendNote&currentPage=${requestScope.totalPage}">末页</a>
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