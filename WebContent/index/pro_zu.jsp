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
<link type="text/css" href="css/bootstrap.css" rel="stylesheet" />
<link rel="shortcut icon" href="images/favicon.ico" />
<link type="text/css" href="css/css.css" rel="stylesheet" />
<link type="text/css" href="css/lunbo.css" rel="stylesheet">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script type="text/javascript" src="js/jqPaginator.js"></script>

<script type="text/javascript">
 $(function(){
	 //导航定位
	 $(".nav li:eq(1)").addClass("navCur");
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
   <form action="#" method="get" class="pro-search">
    <table>
     <tr>
      <th>租金：</th>
      <td>
      <c:if test="${tag1==0 }">
       <a href="javascript:;" class="pro-cur">不限</a>
      </c:if>
      <c:if test="${tag1!=0 }">
       <a href="javascript:;" onclick="findbytag1(0,null,null)">不限</a>
      </c:if>
      <c:if test="${tag1==1 }">
       <a href="javascript:;" class="pro-cur">0-1000</a>
      </c:if>
      <c:if test="${tag1!=1 }">
       <a href="javascript:;" onclick="findbytag1(1,0,1000)">0-1000</a>
      </c:if>
      <c:if test="${tag1==2 }">
       <a href="javascript:;" class="pro-cur">1001-2000</a>
      </c:if>
      <c:if test="${tag1!=2 }">
       <a href="javascript:;" onclick="findbytag1(2,1001,2000)">1001-2000</a>
      </c:if>
      <c:if test="${tag1==3 }">
       <a href="javascript:;" class="pro-cur">2001-3000</a>
      </c:if>
      <c:if test="${tag1!=3 }">
       <a href="javascript:;" onclick="findbytag1(3,2001,3000)">2001-3000</a>
      </c:if>
      <c:if test="${tag1==4 }">
       <a href="javascript:;" class="pro-cur">3001-4000</a>
      </c:if>
      <c:if test="${tag1!=4 }">
       <a href="javascript:;" onclick="findbytag1(4,3001,4000)">3001-4000</a>
      </c:if>
       <input type="text" class="protext" id="startrent"/> - <input type="text" class="protext" id="endrent"/> 元 
       <input type="button" class="proSub" value="确定" onclick="subrent()"/>
      </td>
     </tr>
     <tr>
      <th>出租方式：</th>
      <td>
      <c:if test="${tag2==0 }">
       <a href="javascript:;" class="pro-cur">不限</a>
      </c:if>
      <c:if test="${tag2!=0 }">
       <a href="javascript:;" onclick="findbytag2(0,null)">不限</a>
      </c:if>
      <c:if test="${tag2==1 }">
       <a href="javascript:;" class="pro-cur">合租</a>
      </c:if>
      <c:if test="${tag2!=1 }">
       <a href="javascript:;" onclick="findbytag2(1,2)">合租</a>
      </c:if>
      <c:if test="${tag2==2 }">
       <a href="javascript:;" class="pro-cur">整租</a>
      </c:if>
      <c:if test="${tag2!=2 }">
       <a href="javascript:;" onclick="findbytag2(2,1)">整租</a>
      </c:if>
      </td>
     </tr>
     <tr>
      <th>面积：</th>
      <td>
      <c:if test="${tag3==0 }">
       <a href="javascript:;" class="pro-cur">不限</a>
      </c:if>
      <c:if test="${tag3!=0 }">
       <a href="javascript:;" onclick="findbytag3(0,null,null)">不限</a>
      </c:if>
      <c:if test="${tag3==1 }">
       <a href="javascript:;" class="pro-cur">20平方以下</a>
      </c:if>
      <c:if test="${tag3!=1 }">
       <a href="javascript:;" onclick="findbytag3(1,0,20)">20平方以下</a>
      </c:if>
      <c:if test="${tag3==2 }">
       <a href="javascript:;" class="pro-cur">20-40平方</a>
      </c:if>
      <c:if test="${tag3!=2 }">
       <a href="javascript:;" onclick="findbytag3(2,20,40)">20-40平方</a>
      </c:if>
      <c:if test="${tag3==3 }">
       <a href="javascript:;" class="pro-cur">41-60平方</a>
      </c:if>
      <c:if test="${tag3!=3 }">
       <a href="javascript:;" onclick="findbytag3(3,40,60)">41-60平方</a>
      </c:if>
      <c:if test="${tag3==4 }">
       <a href="javascript:;" class="pro-cur">61-100平方</a>
      </c:if>
      <c:if test="${tag3!=4 }">
       <a href="javascript:;" onclick="findbytag3(4,60,100)">61-100平方</a>
      </c:if>
      <c:if test="${tag3==5 }">
       <a href="javascript:;" class="pro-cur">100平方以上</a>
      </c:if>
      <c:if test="${tag3!=5 }">
       <a href="javascript:;" onclick="findbytag3(5,100,null)">100平方以上</a>
      </c:if>
      </td>
     </tr>
     <tr>
      <th>房型：</th>
      <td>
      <c:if test="${tag4==0 }">
       <a href="javascript:;" class="pro-cur">不限</a>
      </c:if>
      <c:if test="${tag4!=0 }">
       <a href="javascript:;" onclick="findbytag4(0,null)">不限</a>
      </c:if>
      <c:if test="${tag4==1 }">
       <a href="javascript:;" class="pro-cur">一室</a>
      </c:if>
      <c:if test="${tag4!=1 }">
       <a href="javascript:;" onclick="findbytag4(1,1)">一室</a>
      </c:if>
      <c:if test="${tag4==2 }">
       <a href="javascript:;" class="pro-cur">两室</a>
      </c:if>
      <c:if test="${tag4!=2 }">
       <a href="javascript:;" onclick="findbytag4(2,2)">两室</a>
      </c:if>
      <c:if test="${tag4==3 }">
       <a href="javascript:;" class="pro-cur">三室</a>
      </c:if>
      <c:if test="${tag4!=3 }">
       <a href="javascript:;" onclick="findbytag4(3,3)">三室</a>
      </c:if>
      <c:if test="${tag4==4 }">
       <a href="javascript:;" class="pro-cur">四室</a>
      </c:if>
      <c:if test="${tag4!=4 }">
       <a href="javascript:;" onclick="findbytag4(4,4)">四室</a>
      </c:if>
      <c:if test="${tag4==5 }">
       <a href="javascript:;" class="pro-cur">五室以上</a>
      </c:if>
      <c:if test="${tag4!=5 }">
       <a href="javascript:;" onclick="findbytag4(5,5)">五室以上</a>
      </c:if>
      </td>
     </tr>
    </table>
    <div class="paixu">
     <strong>排序：</strong>
     <a href="javascript:;" class="pai-cur">默认</a>
     <a href="javascript:;">价格 &or;</a>
     <a href="javascript:;">最新 &or;</a>
    </div>
   </form><!--pro-search/-->
  </div><!--width1190/-->
  <div class="width1190">
   <div class="pro-left" id="houseinfo">
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
     <div class="price">¥ <strong>${h.rents }</strong><span class="font12">元/月</span></div>
     <div class="clears"></div>
    </dl>
	</c:forEach>
	 <div class="page-mode">
         <p id="page-text"></p>
         <ul id="page" class="pagination"></ul>
     </div>
	
   </div><!--pro-left/-->
   <div class="pro-right">
    <h2 class="right-title">新上房源</h2>
    <div class="right-pro">
    <c:forEach items="${hrlist }" end="3" var="hr">
     <dl>
      <dt><a href="proinfo.html"><img src="${hr.imagelist[0].loading }" /></a></dt>
      <dd>
       <h3><a href="proinfo.html">${hr.address }
      <c:if test="${hr.houseClass==1 }">整租</c:if>
      <c:if test="${hr.houseClass==2 }">合租</c:if>
      <c:if test="${hr.fitment==1 }">精装修</c:if>
      <c:if test="${hr.fitment==2 }">普通装修</c:if>
      <c:if test="${hr.fitment==3 }">毛坯房</c:if></a></h3>
       <div class="pro-fang">
       	<c:if test="${hr.houseType==1 }">一室</c:if>
      	<c:if test="${hr.houseType==2 }">两室</c:if>
      	<c:if test="${hr.houseType==3 }">三室</c:if>
      	<c:if test="${hr.houseType==4 }">四室</c:if>
      	<c:if test="${hr.houseType==5 }">五室以上</c:if>
      	 ${hr.area }平 
       	<c:if test="${hr.orientation==1 }">南</c:if>
      	<c:if test="${hr.orientation==2 }">东</c:if>
      	<c:if test="${hr.orientation==3 }">西</c:if>
      	<c:if test="${hr.orientation==4 }">北</c:if>
      	</div>
       <div class="right-price">${hr.rents }元/月</div>
      </dd>
     </dl>
    </c:forEach>
    </div><!--right-pro/-->
   </div><!--pro-right/-->
   <div class="clears"></div>
  </div><!--width1190/-->
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
 <script type="text/javascript">
 	var url="showhousebyinfo.do?";
 	function findbytag1(tag,startrent,endrent){
 		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : "refreshinfo.do",
			data : {
				tag1:tag,
				startrent:startrent,
				endrent:endrent
			},
			success:function(){
				//alert(dates);
				window.location.href="showhousebyinfo.do";
			},
			error: function() {
                alert("失败，请稍后再试！");
            }
		});
 	}
 	function findbytag2(tag,houseclass){
 		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : "refreshinfo.do",
			data : {
				tag2:tag,
				houseclass:houseclass
			},
			success:function(){
				//alert(dates);
				window.location.href="showhousebyinfo.do";
			},
			error: function() {
                alert("失败，请稍后再试！");
            }
		});
 	}
 	function findbytag3(tag,startarea,endarea){
 		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : "refreshinfo.do",
			data : {
				tag3:tag,
				startarea:startarea,
				endarea:endarea
			},
			success:function(){
				//alert(dates);
				window.location.href="showhousebyinfo.do";
			},
			error: function() {
                alert("失败，请稍后再试！");
            }
		});
 	}
 	function findbytag4(tag,housetype){
 		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : "refreshinfo.do",
			data : {
				tag4:tag,
				housetype:housetype
			},
			success:function(){
				//alert(dates);
				window.location.href="showhousebyinfo.do";
			},
			error: function() {
                alert("失败，请稍后再试！");
            }
		});
 	}
 	function subrent(){
 		var startrent=$('#startrent').val();
 		var endrent=$('#endrent').val();
 		$.ajax({
			type : "post",
			async : false,  //同步请求
			url : "refreshinfo.do",
			data : {
				tag1:5,
				startrent:startrent,
				endrent:endrent
			},
			success:function(){
				//alert(dates);
				window.location.href="showhousebyinfo.do";
			},
			error: function() {
                alert("失败，请稍后再试！");
            }
		});
 	}
 	var totalcount=${hlist.size()};
 	var currentPage=${currentPage};
	var pagecount=${pagecount};
 	$("#page").jqPaginator({
        totalCounts:totalcount,
        pageSize:pagecount,
        visiblePages: 5,
        currentPage: currentPage,
        disableClass:'disabled',
        prev: '<li class="prev"><a href="javascript:void(0);">上一页<\/a><\/li>',
        next: '<li class="next"><a href="javascript:void(0);">下一页<\/a><\/li>',
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
        				//alert(dates);
        				window.location.href="showhouse.do";
        			},
            	})
            }
        }
    });
 </script>
 <script type="text/javascript">
var selectprovince='${province}';
$('#showlocation').val(selectprovince);
$('#showlocation').blur(function(){
	 var province=$('#showlocation').val();
	 $.ajax({
		 type : "post",
		 url : "setlocation.do",
		 data:{
			 province:province
		 },
		 success:function(){
			 window.location.href="showallhouse.do";
		 }
	 })
 })
 </script>
</body>
</html>