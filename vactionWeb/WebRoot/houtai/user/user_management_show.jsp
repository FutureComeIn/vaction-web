<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.yxw.view.UserContact"%>
<%@page import="com.yxw.util.DBUtil"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户管理-查看</title>
	<link rel="stylesheet" href="<%=path %>/houtai/css/x-admin.css" media="all">
    </head>
    
    <body>
        <div class="x-body">
            <blockquote class="layui-elem-quote">
                <img src="${userContact.utxPath }" class="layui-circle" style="width:50px;float:left">
                <dl style="margin-left:80px; color:#019688">
                	<dt><span >${userContact.cname }</span></dt>
                	<dd style="margin-left:0">显示内容</dd>
              	</dl>
            </blockquote>
            <div class="pd-20">
              <table  class="layui-table" lay-skin="line">
                <tbody>
                  <tr>
                    <th>手机：</th>
                    <td>${userContact.cmobile }</td>
                  </tr>
                  <tr>
                    <th>邮编：</th>
                    <td>${userContact.cpostcard }</td>
                  </tr>
                  <tr>
                    <th>地址：</th>
                    <td>${userContact.caddress }</td>
                  </tr>
                  <tr>
                    <th>其他</th>
                    <td>无</td>
                  </tr>
                </tbody>
              </table>
            </div>
        </div>
        <script src="<%=path %>/houtai/lib/layui/layui.js" charset="utf-8">
        </script>
        <script src="<%=path %>/houtai/js/x-layui.js" charset="utf-8">
        </script>
        <script>
            layui.use(['form','layer'], function(){
                $ = layui.jquery;
              var form = layui.form()
              ,layer = layui.layer;
            
              //自定义验证规则
              form.verify({
                nikename: function(value){
                  if(value.length < 5){
                    return '昵称至少得5个字符啊';
                  }
                }
                ,pass: [/(.+){6,12}$/, '密码必须6到12位']
                ,repass: function(value){
                    if($('#L_pass').val()!=$('#L_repass').val()){
                        return '两次密码不一致';
                    }
                }
              });

              console.log(parent);
              //监听提交
              form.on('submit(add)', function(data){
                console.log(data);
                //发异步，把数据提交给php
                layer.alert("增加成功", {icon: 6},function () {
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
  </body>
</html>
