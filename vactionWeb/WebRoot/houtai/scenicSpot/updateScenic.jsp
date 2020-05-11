<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.bean.Scenic"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>更新景区</title>
 	<script src="houtai/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		$(function(){
			//出于安全原因，不能给 input标签中的 file类型 赋值
			$(".submit").click(function(){
				var $input=$("input");
				for(var i=3;i<$input.size()-3;i++){
					//alert($input.eq(i).val());
					if($input.eq(i).val()==""||$input.eq(i).val()==null){
						alert("请保证信息完整再提交");
						return;
					}
				}
				if($("textarea").val()==""||$("textarea").val()==null){
					alert("请保证信息完整再提交");
					return;
				}
				document.myForm.submit();
			})
		})
		
	
	</script>
	

  </head>
  
  <body>
  		<div style="width:100%;height:100%;background-image:url(myImage/jqbj.jpg);background-repeat:repeat;">
  			<form enctype="multipart/form-data" action="ScenicServlet?type=update" method="post" name="myForm">
       			<input type="hidden" name="sno" value="${scenic.sno }"/>
       		<table width="50%" cellspacing="15">
       			<caption>更新景区</caption>
       				
       			<tr>
       			   <td align="right">景区头像:</td>
       			   <td> <img src="${scenic.sheadpath }" width="80" height="80"/>
       			  	 	<input type="file" name="logo"/>
       			   </td>
       			</tr>
       			<tr>
       			   <td align="right">背景图片:</td>
       			   <td> <img src="${scenic.sbgpath }" width="80" height="80"/>
       			   		<input type="file" name="background"/>
       			   </td>
       			</tr>
       			<tr>
       			   <td width="22%" align="right">名       称:</td>
       			   <td> <input type="text" name="name" value="${scenic.sname }"/></td>
       			</tr>
       			<tr>
       				<td align="right">文字介绍:</td>
       				<td>
       					<textarea rows="10" cols="50" name="content">
       					 ${scenic.scontent }
       					</textarea>
       				</td>
       			</tr>
       			<tr>
       			   <td align="right">咨询电话:</td>
       			   <td> <input type="text" name="mobile" value="${scenic.smobile }"/></td>
       			</tr>
       			<tr>
       			   <td align="right">开放时间:</td>
       			   <td> <input type="text" name="opendate" value="${scenic.sopendate }"/></td>
       			</tr>
       			<tr>
       			   <td align="right">详细地址:</td>
       			   <td> <input type="text" name="address" value="${scenic.saddress }" /></td>
       			</tr>
       			<tr>
       			   <td align="right">价        格:</td> 
       			   <td> <input type="text" name="price" value="${scenic.sprice }" /></td>
       			</tr>
       			<tr>
       				<td align="center" colspan="2"> 
       					<input type="button" value="提交" class="submit"/> &nbsp;&nbsp;
       					<input type="reset" value="重置"/>
       				</td>
       			</tr>
       		</table>
       	
       </form>
  	</div>
  </body>
</html>
