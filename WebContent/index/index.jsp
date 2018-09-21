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
<link href="css/city-picker.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/city-picker.data.js"></script>
<script src="js/city-picker.js"></script>
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
   <div class="fl">您好，欢迎来到邻居大妈！
   	<select id="showlocation">
   		<option value="">--请选择区域--</option>
   		<option value="安徽省">安徽省</option>
   		<option value="北京市">北京市</option>
   		<option value="重庆市">重庆市</option>
   		<option value="福建省">福建省</option>
   		<option value="甘肃省">甘肃省</option>
   		<option value="广东省">广东省</option>
   		<option value="广西壮族自治区">广西壮族自治区</option>
   		<option value="贵州省">贵州省</option>
   		<option value="海南省">海南省</option>
   		<option value="河北省">河北省</option>
   		<option value="黑龙江省">黑龙江省</option>
   		<option value="河南省">河南省</option>
   		<option value="湖北省">湖北省</option>
   		<option value="湖南省">湖南省</option>
   		<option value="江苏省">江苏省</option>
   		<option value="江西省">江西省</option>
   		<option value="吉林省">吉林省</option>
   		<option value="辽宁省">辽宁省</option>
   		<option value="内蒙古自治区">内蒙古自治区</option>
   		<option value="宁夏回族自治区">宁夏回族自治区</option>
   		<option value="青海省">青海省</option>
   		<option value="上海市">上海市</option>
   		<option value="山西省">山西省</option>
   		<option value="陕西省">陕西省</option>
   		<option value="四川省">四川省</option>
   		<option value="天津市">天津市</option>
   		<option value="新疆维吾尔自治区">新疆维吾尔自治区</option>
   		<option value="西藏自治区">西藏自治区</option>
   		<option value="云南省">云南省</option>
   		<option value="浙江省">浙江省</option>
   	</select>
   </div>
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
    <li><a href="showindex.do">首页</a></li>
    <li><a href="showallhouse.do">租房</a></li>
    <li><a href="pro_xin.html">新房</a></li>
    <li><a href="pro_er.html">二手房</a></li>
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
   <h2 class="title">租房 <a href="pro_zu.html">更多&gt;&gt;</a></h2>
   <div class="index-fang-list">
    <c:forEach items="${hlist }" end="3" var="h">
    <dl>
     <dt><a href="showhousebyid.do?houseId=${h.houseId }"><img src="${h.imagelist[0].loading }" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="showhousebyid.do?houseId=${h.houseId }"></a>${h.address }</h3>
      <div class="hui">
      <c:if test="${h.houseType==1 }">一室</c:if>
     <c:if test="${h.houseType==2 }">两室</c:if>
     <c:if test="${h.houseType==3 }">三室</c:if>
     <c:if test="${h.houseType==4 }">四室</c:if>
     <c:if test="${h.houseType==4 }">五室以上</c:if> | 
      ${h.area }m² | 
      <c:if test="${h.houseClass==1 }">整租</c:if>
      <c:if test="${h.houseClass==2 }">合租</c:if>
      <c:if test="${h.fitment==1 }">精装修</c:if>
      <c:if test="${h.fitment==2 }">普通装修</c:if>
      <c:if test="${h.fitment==3 }">毛坯房</c:if>
      </div>
     </dd>
    </dl>
    </c:forEach>
    <div class="clears"></div>
   </div><!--index-fang-list/-->
   
   <h2 class="title">租房 <a href="pro_er.html">更多&gt;&gt;</a></h2>
   <div class="index-ershou">
    <div class="in-er-left">
     <a href="proinfo.html"><img src="images/fangt1.jpg" width="380" height="285" /></a>
     <div class="in-er-left-text"><strong class="fl">闵行南方发的撒的发的司法</strong><strong class="fr alignRight">¥2841</strong></div>
    </div><!--in-er-left/-->
    <div class="in-er-right">
     <c:forEach items="${hlist }" end="3" var="h">
    <dl>
     <dt><a href="showhousebyid.do?houseId=${h.houseId }"><img src="${h.imagelist[0].loading }" width="286" height="188" /></a></dt>
     <dd>
      <h3><a href="showhousebyid.do?houseId=${h.houseId }"></a>${h.address }</h3>
      <div class="in-er-right-text">
      <c:if test="${h.houseType==1 }">一室</c:if>
     <c:if test="${h.houseType==2 }">两室</c:if>
     <c:if test="${h.houseType==3 }">三室</c:if>
     <c:if test="${h.houseType==4 }">四室</c:if>
     <c:if test="${h.houseType==4 }">五室以上</c:if> | 
      ${h.area }m² | 
      <c:if test="${h.houseClass==1 }">整租</c:if>
      <c:if test="${h.houseClass==2 }">合租</c:if>
      <c:if test="${h.fitment==1 }">精装修</c:if>
      <c:if test="${h.fitment==2 }">普通装修</c:if>
      <c:if test="${h.fitment==3 }">毛坯房</c:if>
      </div>
     </dd>
    </dl>
    </c:forEach>
     <div class="clears"></div>
    </div><!--in-er-right/-->
    <div class="clears"></div>
   </div><!--index-ershou/-->
  </div><!--width1190/-->
 </div><!--content/-->
 <div class="xinren">
  <div class="width1190">
   <dl style="background:url(images/icon1.jpg) left center no-repeat;">
    <dt>承诺</dt>
    <dd>真实可信100%真房源<br />链家承诺，假一赔百</dd>
   </dl>
   <dl style="background:url(images/icon2.jpg) left center no-repeat;">
    <dt>权威</dt>
    <dd>独家房源 覆盖全城<br />房源信息最权威覆盖最广</dd>
   </dl>
   <dl style="background:url(images/icon3.jpg) left center no-repeat;">
    <dt>信赖</dt>
    <dd>万名置业顾问 专业服务<br />百万家庭的信赖之选</dd>
   </dl>
   <dl style="background:url(images/icon4.jpg) left center no-repeat;">
    <dt>安全</dt>
    <dd>安心承诺 保驾护航<br />多重风险防范机制 无后顾之忧</dd>
   </dl>
   <div class="clears"></div>
  </div><!--width1190/-->
 </div><!--xinren/-->
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
 <script type="text/javascript">
var selectprovince='${province}';
$('#showlocation').val(selectprovince);
$('#showlocation').change(function(){
	 var province=$('#showlocation').val();
	 $.ajax({
		 type : "post",
		 url : "setlocation.do",
		 data:{
			 province:province
		 },
		 success:function(){
			 window.location.href="showindex.do";
		 }
	 })
 })
 </script>
</body>
</html>