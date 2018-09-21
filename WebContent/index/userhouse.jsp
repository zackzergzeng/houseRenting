<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="Author" contect="http://www.webqin.net">
<title>邻居大妈</title>
<link rel="shortcut icon" href="images/favicon.ico" />
<link href="css/main.css" rel="stylesheet">
<link type="text/css" href="css/css.css" rel="stylesheet" />
<link type="text/css" href="css/bootstrap-theme.css" rel="stylesheet" />
<link type="text/css" href="css/bootstrap.css" rel="stylesheet" />
<link href="css/city-picker.css" rel="stylesheet">
<style type="text/css">
.list-nav .width1190 ul li a{
	padding:0px;
}
.vip-right dt {
    float: left;
    width: 286px;
    height: 188px;
}
.vip-right dd {
    float: left;
    width: 380px;
    margin-left: 10px;
    padding: 0 0 0 0;
}
.vip-right dl .price {
    float: right;
    margin: 50px 0 0 0;
    font-size: 26px;
    width: 140px;
    text-align: right;
    height: 40px;
    line-height: 40px;
}
.vip-right dl {
    padding: 15px 0;
    border-bottom: #ccc 1px dotted;
}
</style>

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script src="js/city-picker.data.js"></script>
<script src="js/city-picker.js"></script>
<script src="js/main.js"></script>
<link type="text/css" rel="stylesheet" href="bootstrap-fileinput-master/css/fileinput.css" />
<script type="text/javascript" src="bootstrap-fileinput-master/js/fileinput.js"></script>
<script type="text/javascript" src="bootstrap-fileinput-master/js/locales/zh.js"></script>
<script type="text/javascript" src="js/jqPaginator.js"></script>
<script type="text/javascript">
 $(function(){
	 //导航定位
	 $(".nav li:eq(5)").addClass("navCur");
	 })
</script>
</head>

<body> 
 <div class="header">
  <div class="width1190">
   <div class="fl">您好，欢迎来到邻居大妈！</div>
   <div class="fr">
    <a href="login.html">登录</a> | 
    <a href="reg.html">注册</a> | 
    <a href="javascript:;" onclick="AddFavorite(window.location,document.title)">加入收藏</a> | 
    <a href="javascript:;" onclick="SetHome(this,window.location)">设为首页</a>
   </div>
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--header/-->
 <div class="logo-phone">
  <div class="width1190">
   <h1 class="logo"><a href="index.html"><img src="images/logo.png" width="163" height="59" /></a></h1>
   <div class="phones"><strong>021-63179891</strong></div>
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--logo-phone/-->
 <div class="list-nav">
  <div class="width1190">
   <ul class="nav">
    <li><a href="index.jsp">首页</a></li>
    <li><a href="pro_zu.html">租房</a></li>
    <li class="zhiding"><a href="javascript:;">指定购房</a></li>
    <li><a href="user_jingji.html">申请自由经纪人</a></li>
    <li><a href="about.html">关于我们</a></li>
    <div class="clears"></div>
   </ul><!--nav/-->
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--list-nav/-->
 <div class="banner" style="background:url(images/house.png) center center no-repeat;"></div>
 
 <div class="content">
  <div class="width1190">
   <div class="vip-left">
       <div class="vipNav">
        <h3 class="vipTitle">会员中心</h3>
        <dl>
         <dt class="vipIcon3">账户设置</dt>
          <dd>
           <a href="user.html">我的资料</a>
           <a href="user_pwd.html">账户密码设置</a>
          </dd>
         <dt class="vipIcon1">我的邻居大妈</dt>
          <dd>
           <a href="user_guanzhu.html">关注房源</a>
           <a href="user_shenqing.html" class="vipNavCur">申请社区自由经纪人</a>
           <a href="user_jingji.html">社区自由经纪人</a>
          </dd>
        </dl>
       </div><!--vipNav/-->
    </div><!--vip-left/-->
    <div class="vip-right">
     <c:forEach items="${hplist }" var="h">
    <dl>
     <dt><a href="showhousebyid.do?houseId=${h.houseId }">
     <img src="${h.imagelist[0].loading }" width="286" height="188" />
     </a></dt>
     <dd>
      <h3><a href="showhousebyid.do?houseId=${h.houseId }" id="title">
      ${h.address }
      <c:if test="${h.houseClass==1 }">整租</c:if>
      <c:if test="${h.houseClass==2 }">合租</c:if>
      <c:if test="${h.fitment==1 }">精装修</c:if>
      <c:if test="${h.fitment==2 }">普通装修</c:if>
      <c:if test="${h.fitment==3 }">毛坯房</c:if>
      </a></h3><!-- 标题问题未解决 -->
      <div class="pro-wei">
       <img src="images/weizhi.png" width="12" height="16" /> <strong class="red">${h.province }${h.city }${h.district }</strong>
      </div>
      <div class="pro-fang">
      	<c:if test="${h.houseType==1 }">一室</c:if>
      	<c:if test="${h.houseType==2 }">两室</c:if>
      	<c:if test="${h.houseType==3 }">三室</c:if>
      	<c:if test="${h.houseType==4 }">四室</c:if>
      	<c:if test="${h.houseType==5 }">五室以上</c:if>
      	${h.area }平米
      	<c:if test="${h.orientation==1 }">南</c:if>
      	<c:if test="${h.orientation==2 }">东</c:if>
      	<c:if test="${h.orientation==3 }">西</c:if>
      	<c:if test="${h.orientation==4 }">北</c:if>
      	<c:if test="${h.level==1 }">底层</c:if>
      	<c:if test="${h.level==2 }">低楼层</c:if>
      	<c:if test="${h.level==3 }">中楼层</c:if>
      	<c:if test="${h.level==4 }">高楼层</c:if>
      	<c:if test="${h.level==5 }">顶层</c:if>
      </div>
      <div class="pra-fa">发布人：${h.userinfo.realName }  发布时间：2015-12-03</div>
     </dd>
     <div class="price"><strong><a href="changehouseinfo.do?houseId=${h.houseId }">修改</a></strong></div>
     <div class="clears"></div>
    </dl>
	</c:forEach>
	<div class="page-mode">
         <p id="page-text"></p>
         <ul id="page1" class="pagination"></ul>
     </div>
    </div><!--vip-right/-->
    <div class="clearfix"></div>
  </div><!--width1190/-->
 </div><!--content/-->
 <div class="copy">Copyright@ 2015 邻居大妈 版-权所有 沪ICP备1234567号-0&nbsp;&nbsp;&nbsp;&nbsp;技术支持：<a target="_blank" href="http://www.webqin.net/">秦王网络</a> </div>
 <div class="bg100"></div>
 <script type="text/javascript">
 	var totalcount=${hlist.size()};
	var currentPage=${currentPage};
	var pagecount=${pagecount};
	$("#page1").jqPaginator({
     totalCounts:totalcount,
     pageSize:pagecount,
     visiblePages: 2,
     currentPage: currentPage,
     disableClass:'disabled',
     prev: '<li class="prev"><a href="javascript:void(0);">Previous<\/a><\/li>',
     next: '<li class="next"><a href="javascript:void(0);">Next<\/a><\/li>',
     page: '<li class="page"><a href="javascript:void(0);">{{page}}<\/a><\/li>',
     onPageChange: function (num, type) {
         $("#page-text").html("当前第" + num + "页");
         if(type=='change'){
         	$.ajax({
         		type : "post",
         		url : "pagechange.do",
     			data : {
     				num:num
     			},
     			success:function(){
     				window.location.href="showuserhouse.do";
     			},
         	})
         }
     }
 });
 </script>
</body>
</html>