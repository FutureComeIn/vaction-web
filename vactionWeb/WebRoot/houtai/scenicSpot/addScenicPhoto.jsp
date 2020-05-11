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
		<%
			String message=request.getParameter("message");
			System.out.println("message="+message);
			if("yes".equals(message)){
		%>
				alert("景区图片更新成功");
				window.close();
		<%	
			}
			if("no".equals(message)){
		%>
				alert("景区图片更新失败 ");
		<%	
			}
		%>
		
		
		<%
			String sno=request.getParameter("sno");
		%>
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
				document.myForm.submit();
			})
		})
		
	
	</script>
	

  </head>
  
  <body>
  		<div style="width:100%;height:100%;background-image:url(myImage/jqbj.jpg);background-repeat:repeat;">
  			<form enctype="multipart/form-data" action="ScenicServlet?type=addPhoto&sno=<%=sno %>" method="post" name="myForm">
       		<table width="100%" cellspacing="15">
       			<caption>添加景区图片</caption>
       			<tr>
       			   <td align="right"><b style="color:red">景区图片:</b></td>
       			   <td> <input type="file" name="photo1" /> <br/> <br/>
       			   		<input type="file" name="photo2" /><br/><br/>
       			   		<input type="file" name="photo3" /><br/><br/>
       			   		<input type="file" name="photo4" /><br/><br/>
       			   		<input type="file" name="photo5" />
       			   </td>
       			</tr>
       			<tr>
       				<td>&nbsp;</td>
       				<td> 
       					<input type="button" value="提交" class="submit"/> &nbsp;&nbsp;
       					<input type="reset" value="重置"/>
       				</td>
       			</tr>
       		</table>
       	
       </form>
  	</div>
  </body>
</html>
