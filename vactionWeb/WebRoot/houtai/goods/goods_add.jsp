<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goods_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	
		function yanzheng(){
			if(document.thisForm.gname.value==""){
				alert("请输入商品名称");
				return false;
			}
			if(document.thisForm.gtype.value=="-----请选择----"){
				alert("请选择商品种类");
				return false;
			}
			if(document.thisForm.gplace.value==""){
				alert("请输入商品产地");
				return false;
			}
			
			var reg=/^[0-9]+$/;
			if(document.thisForm.gprice.value==""){
				alert("请输入商品价格");
				return false;
			}
			if(!reg.test(document.thisForm.gprice.value)){
				alert("价格输入不规范");
				return false;
			}
			if(document.thisForm.gkucun.value==""){
				alert("请输入商品库存");
				return false;
			}
			if(!reg.test(document.thisForm.gkucun.value)){
				alert("库存输入不规范");
				return false;
			}
			if(document.thisForm.gpoint.value==""){
				alert("请输入购买该商品可获得的积分数");
				return false;
			}
			if(!reg.test(document.thisForm.gpoint.value)){
				alert("积分数输入不规范");
				return false;
			}
			
			if(document.thisForm.gheadphotopath.value==""){
				alert("请选择商品主图");
				return false;
			}
			if(document.thisForm.gdetailphotopath.value==""){
				alert("请选择商品详情图");
				return false;
			}
			if(document.thisForm.gppath1.value==""){
				alert("请选择商品图1");
				return false;
			}
			if(document.thisForm.gppath2.value==""){
				alert("请选择商品图2");
				return false;
			}
			if(document.thisForm.gppath3.value==""){
				alert("请选择商品图3");
				return false;
			}
			if(document.thisForm.gppath4.value==""){
				alert("请选择商品图4");
				return false;
			}
			if(document.thisForm.gppath5.value==""){
				alert("请选择商品图5");
				return false;
			}
			return true;
		}
	</script>
	
  </head>
  
  <body>
     <div >
            <form action="<%=path %>/saveGoodsServlet" method="post" name="thisForm"
            	enctype="multipart/form-data" onsubmit="return yanzheng()">
            	<br/>
            	<table  align="center" width="80%" >
            		<tr>
            			<td align="right" width="20%" >名称：</td>
            			<td>
            				<input type="text" size="30" name="gname"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >种类：</td>
            			<td>
            				<select name="gtype">
            					<option>-----请选择----</option>
            					<option>农产品</option>
            					<option>水果</option>
            					<option>工艺品</option>
            					<option>副食品</option>
            				</select>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >产地：</td>
            			<td>
            				<input type="text" size="30" name="gplace"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >价格：</td>
            			<td>
            				<input type="text" size="30" name="gprice"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >成交量：</td>
            			<td>
            				<input type="text" size="30" name="gdealcount"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >积分：</td>
            			<td>
            				<input type="text" size="30" name="gpoint"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >主图：</td>
            			<td>
            				<input type="file" name="gheadphotopath"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >详情图：</td>
            			<td>
            				<input type="file" name="gdetailphotopath"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >商品图1：</td>
            			<td>
            				<input type="file" name="gppath1"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >商品图2：</td>
            			<td>
            				<input type="file" name="gppath2"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >商品图3：</td>
            			<td>
            				<input type="file" name="gppath3"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >商品图4：</td>
            			<td>
            				<input type="file" name="gppath4"/>
            			</td>
            		</tr>
            		<tr>
            			<td align="right" >商品图5：</td>
            			<td>
            				<input type="file" name="gppath5"/>
            			</td>
            		</tr>
            		<tr>
            			<br/>
            			<td colspan="2" align="center">
            				<input type="submit" value="保存"/>
            				<input type="reset" value="取消"/>
            			</td>
            		</tr>
            	</table>
            </form>
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
