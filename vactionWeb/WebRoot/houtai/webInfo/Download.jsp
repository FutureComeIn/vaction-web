<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>资源下载</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="<%=path %>/houtai/css/x-admin.css" media="all">
    </head>
    <body>
        <div class="x-nav">
            <span class="layui-breadcrumb">
              <a><cite>首页</cite></a>
              <a><cite>网站信息管理</cite></a>
              <a><cite>资源下载</cite></a>
            </span>
            <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"  href="javascript:location.replace(location.href);" title="刷新"><i class="layui-icon" style="line-height:30px">ဂ</i></a>
        </div>
        <div class="x-body">
        <form class="layui-form x-center" action="" style="width:500px">
                <div class="layui-form-pane">
                  <div class="layui-form-item">
                    <div class="layui-input-inline" style="width:400px">
                      <input type="text" name="username"  placeholder="搜索内容" autocomplete="off" class="layui-input">
                    </div>
                    <div class="layui-input-inline" style="width:80px">
                        <button class="layui-btn"  lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
                    </div>
                  </div>
                </div> 
            </form>
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
              <ul class="layui-tab-title">
                <li class="layui-this">心理图片管理</li>
                <li>心理书籍管理</li>
                <li>心理视频管理</li>
              </ul>
              <div class="layui-tab-content" >
                <div class="layui-tab-item layui-show">
                    <form class="layui-form layui-form-pane" action="">
                    
                    </form>
                    <xblock>
          <button class="layui-btn" onclick="download_picadd('添加信息','<%=path %>/houtai/webInfo/download_picadd.jsp','600','500')"><i class="layui-icon">&#xe608;</i>添加</button>
          <button class="layui-btn layui-btn-danger"><i class="layui-icon"><img src="<%=path %>/houtai/images/look2.png" width="15" height="15"></img></i>查看</button>
          
          <span class="x-right" style="line-height:25px">共有数据：88 条</span></xblock>
                    
                    <table class="layui-table">
                <thead>
                    <tr>
                        <th width="5%">
                            <input type="checkbox" name="" value="">
                        </th>
                        <th width="9%">标题</th>
                        <th>图片</th>
                        <th width="9%">发表时间</th>
                        <th>内容</th>
                        <th width="8%">显示状态</th>
                        <th width="8%">操作</th>
                    </tr>
                </thead>
                <tbody id="x-img">
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">心理图片</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/tupian2.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_picedit('修改','<%=path %>/houtai/webInfo/download_picedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">产品图片</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/tupian3.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_picedit('修改','<%=path %>/houtai/webInfo/download_picedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">公司图片</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/tupian4.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_picedit('修改','<%=path %>/houtai/webInfo/download_picedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
            <div id="page"></div>
                </div>
                
                
                
                <div class="layui-tab-item">
                    <form class="layui-form layui-form-pane" action="">
                    </form>
                     <xblock>
          <button class="layui-btn" onclick="download_bookadd('添加信息','<%=path %>/houtai/webInfo/download_bookadd.jsp','600','500')"><i class="layui-icon">&#xe608;</i>添加</button>
          <button class="layui-btn layui-btn-danger"><i class="layui-icon"><img src="<%=path %>/houtai/images/look2.png" width="15" height="15"></img></i>查看</button>
          
          <span class="x-right" style="line-height:40px">共有数据：88 条</span></xblock>
                    
                    <table class="layui-table">
                <thead>
                    <tr>
                        <th width="5%">
                            <input type="checkbox" name="" value="">
                        </th>
                        <th width="10%">标题</th>
                        <th>图片</th>
                        <th width="9%">发表时间</th>
                        <th>内容</th>
                        <th width="8%">显示状态</th>
                        <th width="8%">操作</th>
                    </tr>
                </thead>
                <tbody id="x-img">
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">交际书</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/shuji1.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_bookedit('修改','<%=path %>/houtai/webInfo/download_bookedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">催眠书</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/shuji2.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_bookedit('修改','<%=path %>/houtai/webInfo/download_bookedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">心理健康书</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/shuji3.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_bookedit('修改','<%=path %>/houtai/webInfo/download_bookedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">健康饮食书</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/shuji4.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_bookedit('修改','<%=path %>/houtai/webInfo/download_bookedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
             <div id="pagerMain" class="apage"><font color=#333 title="首页">首页</font> 
                              <font color=#333 title="上10页"></font> 
                              <font color=#333 title="上一页"> 上一页</font> 
                              <b>1</b>
                              
                              <a href="#">2</a>
                              
                              <a href="#">3</a>
                              
                              <a href="#">4</a>
                              
                              <a href="#">5</a>
                              
                              <a href="#">6</a>
                              
                              <a href="#">7</a>
                              
                              <a href="#">8</a>
                              
                              <a href="#">9</a>
                              
                              <a href="#">10</a>
                              
                               <a href="#" title="下一页"> 下一页</a> 
                              <a href="#" title="尾页">尾页</a>
                               <b>10</b>条/页，<b><span class="tx">1</span>/100</b>，共<b><span id='recordcount'>1000</span></b>条
                              </div>
                </div>
                
                
                <div class="layui-tab-item">
                     <form class="layui-form layui-form-pane" action="">
                    </form>
                    <xblock>
          <button class="layui-btn" onclick="download_voidadd('添加信息','<%=path %>/houtai/webInfo/download_voidadd.jsp','600','500')"><i class="layui-icon">&#xe608;</i>添加</button>
          <button class="layui-btn layui-btn-danger"><i class="layui-icon"><img src="<%=path %>/houtai/images/look2.png" width="15" height="15"></img></i>查看</button>
          
          <span class="x-right" style="line-height:40px">共有数据：88 条</span></xblock>
                    
                    <table class="layui-table">
                <thead>
                    <tr>
                        <th width="5%">
                            <input type="checkbox" name="" value="">
                        </th>
                        <th width="9%">标题</th>
                        <th>图片</th>
                        <th width="9%">发表时间</th>
                        <th>内容</th>
                        <th width="8%">显示状态</th>
                        <th width="8%">操作</th>
                    </tr>
                </thead>
                <tbody id="x-img">
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">心理视频</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/shipin1.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_voidedit('修改','<%=path %>/houtai/webInfo/download_voidedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">产品视频</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/shipin2.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_voidedit('修改','<%=path %>/houtai/webInfo/download_voidedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">公司视频</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/shipin3.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_voidedit('修改','<%=path %>/houtai/webInfo/download_voidedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">健康讲座</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/shipin4.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_voidedit('修改','<%=path %>/houtai/webInfo/download_voidedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="checkbox" value="1" name="">
                        </td>
                        <td width="7%">催眠视频</td>
                        <td align="center" width="7%">
                            <img src="<%=path %>/houtai/images/shipin5.jpg" alt="" width="56" height="56">
                        </td>
                        <td >2017-07-15</td>
                        <td >叙述内容</td>
                        <td class="td-status">
                            <span class="layui-btn layui-btn-normal layui-btn-mini">
                                已显示
                            </span>
                        </td>
                        <td class="td-manage">
                            <a style="text-decoration:none" onclick="banner_stop(this,'10001')" href="javascript:;" title="不显示">
                                <i class="layui-icon">&#xe601;</i>
                            </a>
                            <a title="修改" href="javascript:;" onclick="download_voidedit('修改','<%=path %>/houtai/webInfo/download_voidedit.jsp','4','','510')"
                            class="ml-5" style="text-decoration:none">
                                <i class="layui-icon">&#xe642;</i>
                            </a>
                            <a title="删除" href="javascript:;" onclick="banner_del(this,'1')" 
                            style="text-decoration:none">
                                <i class="layui-icon">&#xe640;</i>
                            </a>
                        </td>
                    </tr>
                </tbody>
            </table>
            <div id="pagerMain" class="apage"><font color=#333 title="首页">首页</font> 
                              <font color=#333 title="上10页"></font> 
                              <font color=#333 title="上一页"> 上一页</font> 
                              <b>1</b>
                              
                              <a href="#">2</a>
                              
                              <a href="#">3</a>
                              
                              <a href="#">4</a>
                              
                              <a href="#">5</a>
                              
                              <a href="#">6</a>
                              
                              <a href="#">7</a>
                              
                              <a href="#">8</a>
                              
                              <a href="#">9</a>
                              
                              <a href="#">10</a>
                              
                               <a href="#" title="下一页"> 下一页</a> 
                              <a href="#" title="尾页">尾页</a>
                               <b>10</b>条/页，<b><span class="tx">1</span>/100</b>，共<b><span id='recordcount'>1000</span></b>条
                              </div>
                </div>
              </div>
            </div> 
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

                layer.ready(function(){ //为了layer.ext.js加载完毕再执行
                  layer.photos({
                    photos: '#x-img'
                    //,shift: 5 //0-6的选择，指定弹出图片动画类型，默认随机
                  });
                }); 
              
            });

            //批量删除提交
             function delAll () {
                layer.confirm('确认要删除吗？',function(index){
                    //捉到所有被选中的，发异步进行删除
                    layer.msg('删除成功', {icon: 1});
                });
             }
             /*图片添加*/
            function download_picadd(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
			 /*书籍添加*/
            function download_bookadd(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
			/*视频添加*/
            function download_voidadd(title,url,w,h){
                x_admin_show(title,url,w,h);
            }
            //图片修改
           function download_picedit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
			//书籍修改
           function download_bookedit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
			//视频修改
           function download_voidedit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
             /*停用*/
            function banner_stop(obj,id){
                layer.confirm('确认不显示吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="banner_start(this,id)" href="javascript:;" title="显示"><i class="layui-icon">&#xe62f;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-disabled layui-btn-mini">不显示</span>');
                    $(obj).remove();
                    layer.msg('不显示!',{icon: 5,time:1000});
                });
            }

            /*启用*/
            function banner_start(obj,id){
                layer.confirm('确认要显示吗？',function(index){
                    //发异步把用户状态进行更改
                    $(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" onClick="banner_stop(this,id)" href="javascript:;" title="不显示"><i class="layui-icon">&#xe601;</i></a>');
                    $(obj).parents("tr").find(".td-status").html('<span class="layui-btn layui-btn-normal layui-btn-mini">已显示</span>');
                    $(obj).remove();
                    layer.msg('已显示!',{icon: 6,time:1000});
                });
            }
            // 编辑
            function about_us_edit (title,url,id,w,h) {
                x_admin_show(title,url,w,h); 
            }
            /*删除*/
            function banner_del(obj,id){
                layer.confirm('确认要删除吗？',function(index){
                    //发异步删除数据
                    $(obj).parents("tr").remove();
                    layer.msg('已删除!',{icon:1,time:1000});
                });
            }
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
