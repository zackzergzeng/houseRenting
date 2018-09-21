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
<link type="text/css" href="css/css.css" rel="stylesheet" />
<link type="text/css" href="css/bootstrap.css" rel="stylesheet" />
<link type="text/css" href="css/lunbo.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript">
 $(function(){
	 //导航定位
	 $(".nav li:eq(0)").addClass("navCur");
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
    <li><a href="index.html">首页</a></li>
    <li><a href="pro_zu.html">租房</a></li>
    <li><a href="pro_xin.html">新房</a></li>
    <li><a href="pro_er.html">二手房</a></li>
    <li class="zhiding"><a href="javascript:;">指定购房</a></li>
    <li><a href="user_jingji.html">个人信息</a></li>
    <li><a href="about.html">关于我们</a></li>
    <div class="clears"></div>
   </ul><!--nav/-->
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--list-nav/-->
 
 <div class="content">
  <div class="width1190" style="width:1000px;">
  	<div class="lunbo col-sm-4">
		<div id="myCarousel" class="carousel slide">
		    <!-- 轮播（Carousel）指标 
		    <ol class="carousel-indicators">
		        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		        <li data-target="#myCarousel" data-slide-to="1"></li>
		        <li data-target="#myCarousel" data-slide-to="2"></li>
		    </ol>  --> 
		    <!-- 轮播（Carousel）项目 -->
		    <div class="carousel-inner">
		        <div class="item active">
		            <img src="${house.imagelist[0].loading }">
		            <div class="carousel-caption"><h1></h1></div>
		        </div>
		        <c:forEach items="${house.imagelist }" begin="1" var="image">
		        <div class="item">
		            <img src="${image.loading }">
		            <div class="carousel-caption"><h1></h1></div>
		        </div>
		        </c:forEach>
		    </div>
		    <!-- 轮播（Carousel）导航 -->
		    <a class="carousel-control left" href="#myCarousel" 
		       data-slide="prev"> <span _ngcontent-c3="" aria-hidden="true" class="glyphicon glyphicon-chevron-left"></span></a>
		    <a class="carousel-control right" href="#myCarousel" 
		       data-slide="next"><span _ngcontent-c3="" aria-hidden="true" class="glyphicon glyphicon-chevron-right"></span></a>
		</div>
	</div>
   <!--<div class="proImg fl">
   <img src="${house.imagelist[0].loading }" />
   </div>proImg/-->
   <div class="proText fr">
    <h3 class="proTitle">${house.address } </h3><!-- 房屋信息标题怎么显示是个问题 -->
    <div class="proText1">
     编号：312737<br />
     售价：225万<br />
     户型：<c:if test="${house.houseType==1 }">一室</c:if><!-- 厕所客厅厨房怎么算 -->
     <c:if test="${house.houseType==2 }">两室</c:if>
     <c:if test="${house.houseType==3 }">三室</c:if>
     <c:if test="${house.houseType==4 }">四室</c:if>
     <c:if test="${house.houseType==4 }">五室以上</c:if><br />
     面积：${house.area }㎡<br />
     朝向：<c:if test="${house.orientation==1 }">南</c:if>
     <c:if test="${house.orientation==2 }">东</c:if>
     <c:if test="${house.orientation==3 }">西</c:if>
     <c:if test="${house.orientation==4 }">北</c:if><br />
     楼层：<c:if test="${house.level==1 }">底层</c:if><!-- 楼层只能显示模糊概念 -->
     <c:if test="${house.level==2 }">低楼层</c:if>
     <c:if test="${house.level==3 }">中楼层</c:if>
     <c:if test="${house.level==4 }">高楼层</c:if>
     <c:if test="${house.level==5 }">顶层</c:if><br />
     装修：<c:if test="${house.fitment==1 }">精装修</c:if>
     <c:if test="${house.fitment==2 }">普通装修</c:if>
     <c:if test="${house.fitment==3 }">毛坯房</c:if><br />
     楼龄：${house.age }<br>
     地址：${house.address }<br>
    </div>
    
    <div class="xun-car">
     <a href="javascript:;" class="xwjg">¥<strong>${house.rents }</strong>元</a>
     <a href="javascript:;" class="projrgwc">关注房源</a>
    </div><!--xun-car/-->
   </div><!--proText/-->
   <div class="clears"></div>
  </div><!--width1190/-->
  <div class="proBox" style="width:1000px;margin:10px auto;">
  <div class="proEq">
   <ul class="fl">
    <li class="proEqCur">房源详情</li>
   </ul>
   <div class="lxkf fr"><a href="http://wpa.qq.com/msgrd?v=3&uin=1072631488&site=qq&menu=yes" target="_blank"></a></div>
   <div class="clears"></div>
  </div><!--proEq/-->
  <div class="proList">
  <!-- 需要在这里添加描述 -->
	${house.introduction } <br>
  </div><!--proList/-->
 </div><!--proBox/-->
 </div><!--content/-->
 
 <div class="footer">
  <div class="width1190">
   <div class="fl"><a href="index.html"><strong>邻居大妈</strong></a><a href="about.html">关于我们</a><a href="contact.html">联系我们</a><a href="user.html">个人中心</a></div>
   <div class="fr">
    <dl>
     <dt><img src="images/erweima.png" width="76" height="76" /></dt>
     <dd>微信扫一扫<br />房价点评，精彩发布</dd>
    </dl>
    <dl>
     <dt><img src="images/erweima.png" width="76" height="76" /></dt>
     <dd>微信扫一扫<br />房价点评，精彩发布</dd>
    </dl>
    <div class="clears"></div>
   </div>
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--footer/-->
 <div class="copy">Copyright@ 2015 邻居大妈 版权所有 沪ICP备1234567号-0&nbsp;&nbsp;&nbsp;&nbsp;技术支持：<a target="_blank" href="http://www.webqin.net/">秦王网络</a> </div>
 <div class="bg100"></div>
 <div class="zhidinggoufang">
  <h2>指定购房 <span class="close">X</span></h2>
  <form action="#" method="get">
   <div class="zhiding-list">
    <label>选择区域：</label>
    <select>
     <option>智慧园</option>
     <option>立民村</option>
     <option>塘口村</option>
     <option>勤劳村</option>
     <option>芦胜村</option>
     <option>知新村</option>
    </select>
   </div>
   <div class="zhiding-list">
    <label>方式：</label>
    <select>
     <option>租房</option>
     <option>新房</option>
     <option>二手房</option>
    </select>
   </div>
   <div class="zhiding-list">
    <label>联系方式：</label>
    <input type="text" />
   </div>
   <div class="zhidingsub"><input type="submit" value="提交" /></div>
  </form>
  <div class="zhidingtext">
   <h3>指定购房注意事宜：</h3>
   <p>1、请详细输入您所需要购买的房源信息(精确到小区)</p>
   <p>2、制定购房申请提交后，客服中心会在24小时之内与您取得联系</p>
   <p>3、如有任何疑问，请随时拨打我们的电话：400-000-0000</p>
  </div><!--zhidingtext/-->
 </div><!--zhidinggoufang/-->
</body>
</html>