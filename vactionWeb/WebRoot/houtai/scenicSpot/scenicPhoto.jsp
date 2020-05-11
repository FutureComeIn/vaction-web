<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <style type="text/css">
    	.size{width:800px; height:600px;}
    </style>
    <script src="houtai/js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript">
    	$(function(){
    		$("img").not("#1").attr("style","display:none");
			var $img=$("img");
    		var index=1;
    		$("a:first").click(function(){
    			if(index==1){
    				$("img").not("#1").attr("style","display:none");
    			}else{
    				index=index-1;
    				for(var i=0;i<$img.size();i++){
    				    if(i+1==index){
    				    	$img.eq(i).attr("style","display:block");
    				    }else{
    				    	$img.eq(i).attr("style","display:none");
    				    }
    				}
    			}
    		})
    		$("a:last").click(function(){
    			if(index==5){
    				$("img").not("#5").attr("style","display:none");
    			}else{
    				index=index+1;
    				for(var i=0;i<$img.size();i++){
    				    if(i+1==index){
    				    	$img.eq(i).attr("style","display:block");
    				    }else{
    				    	$img.eq(i).attr("style","display:none");
    				    }
    				}
    			}
    		})
    	})
    </script>
    
    <title>景区图片</title>
  </head>
  
  <body>
   		<div>
   			<img src="<%=path %>/${scenicPhoto.spphoto1 }" class="size"  id="1" name="1"/>
   			<img src="<%=path %>/${scenicPhoto.spphoto2 }" class="size"  id="2" name="2"/>
   			<img src="<%=path %>/${scenicPhoto.spphoto3 }" class="size"  id="3" name="3"/>
   			<img src="<%=path %>/${scenicPhoto.spphoto4 }" class="size"  id="4" name="4"/>
   			<img src="<%=path %>/${scenicPhoto.spphoto5 }" class="size"  id="5" name="5"/>
   			<div style="text-align:center">
	   			<a href="javascript:;">上一张</a>&nbsp;&nbsp;
	   			<a href="javascript:;">下一张</a>
   			</div>
   		</div>
  </body>
</html>
