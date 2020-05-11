<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加景区</title>
 	<script src="houtai/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$(".submit").click(function(){
				var $input=$("input");
				for(var i=0;i<$input.size()-2;i++){
					//alert($input.eq(i).val());
					if($input.eq(i).val()==""||$input.eq(i).val()==null){
						alert("请添加完整信息再提交");
						return;
					}
				}
				if($("textarea").val()==""||$("textarea").val()==null){
					alert("请添加完整信息再提交");
					return;
				}
				document.myForm.submit();
			})
		})
		
	
	</script>
	

  </head>
  
  <body>
  		<div style="width:100%;height:100%;background-image:url(myImage/jqbj.jpg);background-repeat:repeat;">
  			<form enctype="multipart/form-data" action="ScenicServlet?type=add" method="post" name="myForm">
       		<table width="50%" cellspacing="15">
       			<caption>添加景区</caption>
       			<tr>
       			   <td width="22%" align="right">名       称:</td>
       			   <td> <input type="text" name="name" /></td>
       			</tr>
       			<tr>
       			   <td align="right">景区头像:</td>
       			   <td> <input type="file" name="logo" /></td>
       			</tr>
       			<tr>
       			   <td align="right">背景图片:</td>
       			   <td> <input type="file" name="background" /></td>
       			</tr>
       			<tr>
       				<td align="right">文字介绍:</td>
       				<td>
       					<textarea rows="10" cols="50" name="content">
       						
       					</textarea>
       				</td>
       			</tr>
       			<tr>
       			   <td align="right">咨询电话:</td>
       			   <td> <input type="text" name="mobile" /></td>
       			</tr>
       			<tr>
       			   <td align="right">开放时间:</td>
       			   <td> <input type="text" name="opendate" /></td>
       			</tr>
       			<tr>
       			   <td align="right">详细地址:</td>
       			   <td> <input type="text" name="address" /></td>
       			</tr>
       			<tr>
       			   <td align="right">价        格:</td> 
       			   <td> <input type="text" name="price" /></td>
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
