<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	<base href="<%=basePath%>">
		<title>用户管理</title>    
       <link rel="stylesheet" href="<%=path %>/houtai/css/x-admin.css" media="all">
  		<script type="text/javascript">
  			//houtai/user/user_management_show.jsp','10001','360','400'
  			function showDetail(uname){
  				var url="UserServlet?type=seeUser&uname="+uname;
                var name="";
                var s="resizable:no;help:no;status:no;scroll:yes";
			    open(url,name,"width=500,height=400,top=300,left=800,scrollbars=no,resizable=no");
  			}
  			
  			function member_del(uno){
  				if(confirm("您确认处理该用户吗")){
  					window.location.href="UserServlet?type=deleteUser&uno="+uno;
  				}
  			}
  		</script>
   </head>
    <body>
    
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>用户管理</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新">
            	<i class="layui-icon" style="line-height:30px">ဂ</i>
            </a>
        </div>
        
        
        <div class="x-body">
         
            <xblock>
            <span class="x-right" style="line-height:25px">共有数据：${count }条</span></xblock>
            <table class="layui-table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>用户名</th>
                        <th>密码</th>
                        <th>性别</th>
                        <th>个性签名</th>
                        <th>积分</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                
                	<c:forEach items="${ulist}" var="user">
                	
                    <tr>
                        <td> ${user.uno }</td>
                        <td>
					<u style="cursor:pointer" onclick="showDetail('${user.uname }')">
						${user.uname }</u>
						</td>
						<td >${user.upw }</td>
                        <td >${user.usex }</td>
                        <td >${user.usignature }</td>
                        <td >${user.upoint }</td>
                        
                        <td class="td-manage">
                            <a title="删除" href="javascript:;" onclick="member_del(${user.uno})" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    
                    </c:forEach>
                </tbody>
            </table>

            <div id="page"></div>
        </div>
        
        <br /><br /><br />
        
        <script src="<%=path %>/houtai/lib/layui/layui.js" charset="utf-8"></script>
        <script src="<%=path %>/houtai/js/x-layui.js" charset="utf-8"></script>
        <script>
            layui.use(['laydate','element','laypage','layer'], function(){
                $ = layui.jquery;//jquery
              laydate = layui.laydate;//日期插件
              lement = layui.element();//面包导航
              laypage = layui.laypage;//分页
              layer = layui.layer;//弹出层

              //以上模块根据需要引入

              laypage({
                cont: 'page'
                ,pages: 100
                ,first: 1
                ,last: 100
                ,prev: '<em><</em>'
                ,next: '<em>></em>'
              }); 
              
              /*用户-查看*/
            function user_management_show(title,url,id,w,h){
                x_admin_show(title,url,w,h); //x_admin_show() 打开一个弹窗 
            }
              
              var start = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                  end.min = datas; //开始日选好后，重置结束日的最小日期
                  end.start = datas //将结束日的初始值设定为开始日
                }
              };
              
              var end = {
                min: laydate.now()
                ,max: '2099-06-16 23:59:59'
                ,istoday: false
                ,choose: function(datas){
                  start.max = datas; //结束日选好后，重置开始日的最大日期
                }
              };
              
            });

            //批量删除提交
             function delAll () {
                layer.confirm('确认要删除吗？',function(index){
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('删除成功', {icon: 1});
                });
             }
             /*用户-添加*/
            function user_management_add(title,url,w,h){
                x_admin_show(title,url,w,h);
            }

             /*用户-停用*/
            function member_stop(obj,id){
                layer.confirm('确认要停用吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_start(this,id)" href="javascript:;" title="启用"><i class="layui-icon">&#xe62f;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">已停用</span>');
                    $(obj).remove();
                    layer.msg('已停用!',{icon: 5,time:1000});
                });
            }

            /*用户-启用*/
            function member_start(obj,id){
                layer.confirm('确认要启用吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="member_stop(this,id)" href="javascript:;" title="停用"><i class="layui-icon">&#xe601;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已启用</span>');
                    $(obj).remove();
                    layer.msg('已启用!',{icon: 6,time:1000});
                });
            }
            // 用户-编辑
            function user_management_edit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
            /*密码-修改*/
            function user_management_password(title,url,id,w,h){
                x_admin_show(title,url,w,h);  
            }
            /*
            //用户-删除
            function member_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                });
            }*/
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
