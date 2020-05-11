<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.bean.Goods"%>
<%@page import="com.yxw.dao.GoodsDao"%>
<%@page import="com.yxw.bean.GoodPhoto"%>
<%@page import="com.yxw.dao.GoodPhotoDao"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

 <%
    	int gno = Integer.parseInt(request.getParameter("gno").trim());
    	List<Goods> goods = new GoodsDao().queryGoodsByNno(gno);
    	request.setAttribute("goods",goods.get(0));
    	
    	List<GoodPhoto> gp=new GoodPhotoDao().queryGoodPhotoByPgno(gno);
    	request.setAttribute("goodPhoto",gp.get(0));
     %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods_edit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="<%=path %>/houtai/css/x-admin.css" media="all">
	<script src="<%=path %>/houtai/goods/jquery-1.8.2.min.js"></script>
	<script >
	
		$(function () {
			
			//给下拉列表框赋值
			var type='<%=goods.get(0).getGtype()%>';
			var $option = $("option");
			for(var i=0;i<$option.size();i++){
				if($option.eq(i).html()==type){
					$option.eq(i).attr("selected",true);
				}
			}
			

			//第一张图片
            $("#gheadphotopathC").change(function (e) {
                var file = e.target.files[0] || e.dataTransfer.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function () {
                        $("img").eq(0).attr("src", this.result);
                    }

                    reader.readAsDataURL(file);
                }
            });
            //第二张图片
            $("#gdetailphotopathC").change(function (e) {
                var file = e.target.files[0] || e.dataTransfer.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function () {
                        $("img").eq(1).attr("src", this.result);
                    }

                    reader.readAsDataURL(file);
                }
            });
            //商品第一张图片
            $("#gppath1").change(function (e) {
                var file = e.target.files[0] || e.dataTransfer.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function () {
                        $("img").eq(2).attr("src", this.result);
                    }

                    reader.readAsDataURL(file);
                }
            });
            //商品第二张图片
            $("#gppath2").change(function (e) {
                var file = e.target.files[0] || e.dataTransfer.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function () {
                        $("img").eq(3).attr("src", this.result);
                    }

                    reader.readAsDataURL(file);
                }
            });
            //商品第三张图片
            $("#gppath3").change(function (e) {
                var file = e.target.files[0] || e.dataTransfer.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function () {
                        $("img").eq(4).attr("src", this.result);
                    }

                    reader.readAsDataURL(file);
                }
            });
            //商品第四张图片
            $("#gppath4").change(function (e) {
                var file = e.target.files[0] || e.dataTransfer.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function () {
                        $("img").eq(5).attr("src", this.result);
                    }

                    reader.readAsDataURL(file);
                }
            });
            //商品第五张图片
            $("#gppath5").change(function (e) {
                var file = e.target.files[0] || e.dataTransfer.files[0];
                if (file) {
                    var reader = new FileReader();
                    reader.onload = function () {
                        $("img").eq(6).attr("src", this.result);
                    }

                    reader.readAsDataURL(file);
                }
            });
            
        })
		
		//提交保存
		function save(){
			if(window.confirm("您确认修改吗？")){
				document.thisForm.submit();
			}
		}
		
	</script>
  </head>
  
  <body>
     <div class="x-body">
     			<form action="<%=path %>/updateGoodsServlert?gno=${goods.gno}" name="thisForm" method="post" enctype="multipart/form-data">
            	<table border="1px" align="center" width="91%" enctype="multipart/form-data">
            		<tr height="45px">
            			<td align="right" width="20%" style=" background-color: lightgrey">名称：</td>
            			<td>
							<input type="text" size="30" style="height:40px;" name="gname" value="${goods.gname}"/>          			
            			</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" width="20%" style=" background-color: lightgrey">种类：</td>
            			<td>
            				<select name="gtype" id="gtype">
								<option>农产品</option>
            					<option>水果</option>
            					<option>工艺品</option>
            					<option>副食品</option>           				
            				</select>
            			</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">产地：</td>
            			<td>
            				<input type="text" size="30" style="height:40px;" name="gplace" value="${goods.gplace }"/>
            			</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">价格：</td>
            			<td>
            				<input type="text" size="30" style="height:40px;" name="gprice" value="${goods.gprice }"/>
            			</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">成交量：</td>
            			<td>
            				<input type="text" size="30" style="height:40px;" name="gdealcount" value="${goods.gdealcount }" readonly="readonly"/>
            			</td>
            		</tr>
            		<tr height="45px">
            			<td align="right" style=" background-color: lightgrey">积分：</td>
            			<td>
            				<input type="text" size="30" style="height:40px;" name="gpoint" value="${goods.gpoint }"/>
            			</td>
            		</tr>
            	</table>
            	
            	
            	<table border="1px" align="center" width="80%" >
            		<tr height="45px">
            			<td align="center" width="50%" style=" background-color: lightgrey">主图</td>
            			<td align="center" width="50%" style=" background-color: lightgrey">详情图</td>
            		</tr>
            		<tr height="45px">
            			<td align="center">
							<img id="img1" alt="" src="${goods.gheadphotopath }" width="340px">
            			</td>
            			<td align="center">
            				<img id="img2" alt="" src="${goods.gdetailphotopath }" width="340px">
            			</td>
            		</tr>
            		<tr height="45px">
            		
            		
            		<!-- 修改并上传图片 -->
            			<td align="right" valign="bottom" width="50%">
							<input type="file" id="gheadphotopathC" name="gheadphotopathC">
            			</td>
            			<td align="right" valign="bottom" width="50%">
            				<input type="file" id="gdetailphotopathC" name="gdetailphotopathC" >
            			</td>
            		</tr>
            		
            	</table>
            	
            	<br>
            	<!-- 商品图片 -->
            	<table border="1px" align="center" width="80%" >
            		<tr height="45px">
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图1</td>
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图2</td>
            		</tr>
            		<tr height="45px">
            			<td align="center">
							<img id="img3" alt="" src="${goodPhoto.gppath1 }" width="340px">
            			</td>
            			<td align="center">
            				<img id="img4" alt="" src="${goodPhoto.gppath2 }" width="340px">
            			</td>
            		</tr>
            		<tr height="45px">
            		
            		
            		<!-- 修改并上传商品图片图片 -->
            			<td align="right" valign="bottom" width="50%">
							<input type="file" id="gppath1" name="gppath1">
            			</td>
            			<td align="right" valign="bottom" width="50%">
            				<input type="file" id="gppath2" name="gppath2" >
            			</td>
            		</tr>
            		<tr height="45px">
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图3</td>
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图4</td>
            		</tr>
            		<tr height="45px">
            			<td align="center">
							<img id="img5" alt="" src="${goodPhoto.gppath3 }" width="340px">
            			</td>
            			<td align="center">
            				<img id="img6" alt="" src="${goodPhoto.gppath4 }" width="340px">
            			</td>
            		</tr>
            		<tr height="45px">
            		
            		
            		<!-- 修改并上传商品图片图片 -->
            			<td align="right" valign="bottom" width="50%">
							<input type="file" id="gppath3" name="gppath3">
            			</td>
            			<td align="right" valign="bottom" width="50%">
            				<input type="file" id="gppath4" name="gppath4" >
            			</td>
            		</tr>
            		<tr height="45px">
            			<td align="center" width="50%" style=" background-color: lightgrey">商品图5</td>
            			<td align="center" width="50%" ></td>
            		</tr>
            		<tr height="45px">
            			<td align="center">
							<img id="img1" alt="" src="${goodPhoto.gppath5 }" width="340px">
            			</td>
            			<td align="center">
            			</td>
            		</tr>
            		<tr height="45px">
            		
            		
            		<!-- 修改并上传商品图片图片 -->
            			<td align="right" valign="bottom" width="50%">
							<input type="file" id="gppath5" name="gppath5">
            			</td>
            			<td align="right" valign="bottom" width="50%">
            			</td>
            		</tr>
            		
            		
            	</table>
            	
            	
            	<table align="center" width="80%">
            		<tr>
            			<td colspan="2" align="center">
            				<input type="button" value="保存" onclick="save()"/>
            				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            				<input type="reset" value="取消"/>
            			</td>
            		</tr>
            	</table>
            	</form>
            	<br/>
            	<br/>
            	<br/>
        </div>
        <script src="./lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="./js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer;

              //监听提交
              form.on('submit(save)', function(data){
                console.log(data);
                //发异步，把数据提交给php
                layer.alert("保存成功", {icon: 6},function () {
                    // 获得frame索引
                    var index = parent.layer.getFrameIndex(window.name);
                    //关闭当前frame
                    parent.layer.close(index);
                });
                return false;
              });
            });
			
        </script>
        <script>
        var _hmt = _hmt || [];
        (function() {
          var hm = document.createElement("script");
          var s = document.getElementsByTagName("script")[0]; 
          s.parentNode.insertBefore(hm, s);
        })();
        </script>
        <br/>
        <br/>
        <br/>
  </body>
</html>
