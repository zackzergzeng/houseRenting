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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
</style>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/js.js"></script>
<script src="js/city-picker.data.js"></script>
<script src="js/city-picker.js"></script>
<script src="js/main.js"></script>
<link type="text/css" rel="stylesheet" href="bootstrap-fileinput-master/css/fileinput.css" />
<script type="text/javascript" src="bootstrap-fileinput-master/js/fileinput.js"></script>
<script type="text/javascript" src="bootstrap-fileinput-master/js/locales/zh.js"></script>
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
    <li><a href="showindex.do">首页</a></li>
    <li><a href="showallhouse.do">租房</a></li>
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
     <h3 class="vipright-title">添加房产信息</h3>
     <form action="updatehouseinfo.do" method="post">
     	<h2>类别</h2>
     	<label class="radio-inline">
		  <input type="radio" name="houseClass" id="entireRent" value="1"> 整租
		</label>
		<label class="radio-inline">
		  <input type="radio" name="houseClass" id="sharedRent" value="2"> 合租
		</label>
		<h3>基础信息</h3>
     	<div id="distpicker" class="form-group col-sm-12">
     	<label for="inputEmail3" class="col-sm-2 control-label" style="text-align:center">地址</label>
			<div class="col-sm-9">
				<div class="col-sm-12" style="position: relative; padding:0px;">
					<input id="location" name="location" class="form-control" readonly type="text" value="//" data-toggle="city-picker">
				</div>
				<div class="col-sm-12" style="padding:0px;">
				    <input type="text" class="form-control" id="address" name="address" placeholder="具体地址" value="${house.address }">
				</div>
			</div>
		</div>
		<div class="form-group col-sm-12">
		  <label for="inputEmail3" class="col-sm-2 control-label" style="text-align:center">租金</label>
		  <div class="col-sm-9">
		    <input type="text" class="form-control" id="rents" name="rents" placeholder="租金" value="${house.rents }">
		  </div>
		</div>
		<div class="form-group col-sm-12">
		  <label for="inputEmail3" class="col-sm-2 control-label" style="text-align:center">面积</label>
		  <div class="col-sm-9">
		    <input type="text" class="form-control" id="area" name="area" placeholder="面积" value="${house.area }">
		  </div>
		</div>
		<div class="form-group col-sm-12">
			<label for="exampleInputPassword1" class="col-sm-2 control-label" style="text-align:center">装修程度</label>
			<div class="col-sm-9">
				<select class="form-control" id="fitment" name="fitment">
				  <option value="1">精装修</option>
				  <option value="2">普通装修</option>
				  <option value="3">毛坯房</option>
				</select>
			</div>
		</div>
		<div class="form-group col-sm-12">
			<label for="exampleInputPassword1" class="col-sm-2 control-label" style="text-align:center">朝向</label>
			<div class="col-sm-9">
				<select class="form-control" id="orientation" name="orientation">
				  <option value="1">南</option>
				  <option value="2">东</option>
				  <option value="3">西</option>
				  <option value="4">北</option>
				  <!-- <option>南北</option>
				  <option>东西</option>
				  <option>东南</option>
				  <option>东北</option>
				  <option>西南</option>
				  <option>西北</option> -->
				</select>
			</div>
		</div>
		<div class="form-group col-sm-12">
			<label for="exampleInputPassword1" class="col-sm-2 control-label" style="text-align:center">楼层</label>
			<div class="col-sm-9">
				<select class="form-control" id="level" name="level">
				  <option value="1">底层</option>
				  <option value="2">低楼层</option>
				  <option value="3">中楼层</option>
				  <option value="4">高楼层</option>
				  <option value="5">顶层</option>
				</select>
			</div>
		</div>
		<div class="form-group col-sm-12">
			<label for="exampleInputPassword1" class="col-sm-2 control-label" style="text-align:center">户型</label>
			<div class="col-sm-9">
				<select class="form-control" id="houseType" name="houseType">
				  <option value="1">1室</option>
				  <option value="2">2室</option>
				  <option value="3">3室</option>
				  <option value="4">4室</option>
				  <option value="5">5室以上</option>
				</select>
			</div>
		</div>
		<div class="form-group col-sm-12">
		  <label for="inputEmail3" class="col-sm-2 control-label" style="text-align:center">楼龄</label>
		  <div class="col-sm-9">
		    <input type="text" class="form-control" id="age" name="age" placeholder="楼龄" value="${house.age }">
		  </div>
		</div>
		<div class="form-group col-sm-12">
		  <label for="inputEmail3" class="col-sm-2 control-label" style="text-align:center">说明</label>
		  <div class="col-sm-9">
		    <textarea class="form-control" name="introduction" rows="3">${house.introduction }</textarea>
		  </div>
		</div>
		<div class="form-group col-sm-12">
		   <label for="inputEmail3" class="col-sm-2 control-label" style="text-align:center">图片</label>
		   <div class="col-sm-10"></div>
		   <c:forEach items="${house.imagelist }" var="image">
			   <div class="col-sm-2"></div>
			   <div class="col-sm-10">
			   	<img src="${image.loading }" width="200px" height="200px">
			   	<a id="img${image.imageId }" name="delimg" href="javascript:;" onclick="deleteimg(${image.imageId})">删除</a>
			   </div>
			</c:forEach>
		</div>
		<div class="form-group col-sm-12">
		   <label for="inputEmail3" class="col-sm-2 control-label" style="text-align:center">图片</label>
		   <div class="col-sm-10">
		      <input id="myFile1" type="file" name="myFile" multiple class="fileloading">
		   </div>
		</div>
		<div class="col-sm-5"></div>
		<div class="col-sm-2">
			<button id="formsub" type="button" class="btn btn-primary btn-lg" onclick="exam()">提交</button>
			<!-- <button type="submit" class="btn btn-primary btn-lg">提交</button> -->
		</div>
		<div class="col-sm-5"></div>
     </form>
     
    </div><!--vip-right/-->
    <div class="clearfix"></div>
  </div><!--width1190/-->
 </div><!--content/-->
 <div class="copy">Copyright@ 2015 邻居大妈 版权所有 沪ICP备1234567号-0&nbsp;&nbsp;&nbsp;&nbsp;技术支持：<a target="_blank" href="http://www.webqin.net/">秦王网络</a> </div>
 <div class="bg100"></div>
 <script type="text/javascript" src="js/changehouseinfo.js"></script>
 <script type="text/javascript">
 function deleteimg(imageId){
	 var id="img"+imageId;
	 var a=document.getElementById(id);
	 if(a.text=='删除'){
		 $.ajax({
				type : "post",
				url : "deleteimage.do",
				data : {
					imageId:imageId
				},
				success:function(){
					 a.text="取消删除"
				}
			});
	 }else{
		 $.ajax({
				type : "post",
				url : "readdimage.do",
				data : {
					imageId:imageId
				},
				success:function(){
					 a.text="删除"
				}
			});
	 }
	 
 }
 </script>
 <script type="text/javascript">
 var chihouseClass="${house.houseClass}";
 var chiprovince="${house.province}";
 var chicity="${house.city}";
 var chidistrict="${house.district}";
 var chifitment="${house.fitment}";
 var chihouseType="${house.houseType}";
 var chiorientation="${house.orientation}";
 var chilevel="${house.level}";
 var houseId="${house.houseId}";
 
 setLocation(chiprovince,chicity,chidistrict)
 setHouseClassInChi(chihouseClass);
 setFitmentInChi(chifitment);
 setHouseTypeInChi(chihouseType);
 setOrientationInChi(chiorientation);
 setLevelInChi(chilevel);
 $("#myFile1").fileinput({
	 language: 'zh', //设置语言
     uploadUrl: "upload.do", //上传的地址
     allowedFileExtensions: ['jpg', 'gif', 'png'],//接收的文件后缀
     //initialPreview: imageurl,  
     //uploadExtraData:{"id": 1, "fileName":'123.mp3'},
     uploadAsync: true, //默认异步上传
     showUpload: true, //是否显示上传按钮
     showRemove : true, //显示移除按钮
     showPreview : true, //是否显示预览
     showCaption: false,//是否显示标题
     browseClass: "btn btn-primary", //按钮样式
     //dropZoneEnabled: true,//是否显示拖拽区域
     //minImageWidth: 50, //图片的最小宽度
     //minImageHeight: 50,//图片的最小高度
     //maxImageWidth: 1000,//图片的最大宽度
     //maxImageHeight: 1000,//图片的最大高度
     //maxFileSize: 0,//单位为kb，如果为0表示不限制文件大小
     //minFileCount: 0,
     //maxFileCount: 10, //表示允许同时上传的最大文件个数
     enctype: 'multipart/form-data',
     validateInitialCount:true,
     previewFileIcon: "<i class='glyphicon glyphicon-king'></i>",
     //initialPreviewConfig: [ //配置预览中的一些参数 
      //   {url: "deletePic", key: 1},
      //   {url: "deletePic", key: 2}
       //],
     msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！"
 }).on('filepreupload', function(event, data, previewId, index) {     //上传中
     var form = data.form, files = data.files, extra = data.extra,
     response = data.response, reader = data.reader;
     console.log('文件正在上传');
 }).on("fileuploaded", function (event, data, previewId, index) {    //一个文件上传成功
	 var res = data.response;
     $.ajax({
			type : "post",
			async : false,  //同步请求
			url : "setImage.do",
			data : {
				path:res.success
			},
			success:function(){
				alert("ok");
			}
		});
	 console.log('文件上传成功！'+data.id);

 }).on('fileerror', function(event, data, msg) {  //一个文件上传失败
     console.log('文件上传失败！'+data.id);
 });
 function exam(){
	 var tagsub=true;
	 $('.form-group input').each(function(){
		 var value=$(this).val();
		 var id=$(this).attr('id');
		 if(value==""&&id!='myFile'){
			 tagsub=false;
			 $(this).parent().parent().addClass('has-error');
		 }
		 else{
			 $(this).parent().parent().removeClass('has-error');
		 }
	 })
	 if(tagsub==false){
		 alert('请填写未填的必填内容');
	 }else{
		 $('#formsub').attr('type',"submit");
	 }
 }
 </script>
</body>
</html>