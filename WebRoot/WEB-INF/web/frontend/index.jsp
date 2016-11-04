<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>
<!doctype html>
<html>
<head>
	<meta charset="UTF-8">
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" />
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<meta content="telephone=no" name="format-detection" />
	<meta content="email=no" name="format-detection" />
	<!-- 防止跨域攻击 -->
    <meta name="csrf-param" content="authenticity_token">
    <meta name="csrf-token" content="U/dleDQyH0ryL/fsE3nhaybtLoqaXqmZZGdpJGhSiTI=">
<title>电动车防盗管理系统</title>
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/index.css">
<link type="text/css" rel="stylesheet" href="/EBike/frontend/css/flexslider.css" />
<script type="text/javascript" src="/EBike/frontend/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/EBike/frontend/js/Adaptive.js"></script>
<script type="text/javascript" src="/EBike/frontend/js/jquery.flexslider.js"></script>
<script type="text/javascript" >
$(function(){
	if($(".flexslider").length != 0) {
		$('.flexslider').flexslider({
			animation: "slide",
			start: function(slider){
			}
		});
	}
	$("#indexMenu").addClass("act");
});

function updateLicense(){
	if(confirm("确认同步车牌信息?")){
		$.ajax({
			type: "post",
			url: "/EBike/user/updateLicense.do",
			data: {},
			dataType: "json",
			async:false,
			success: function(data){
				if(data.code==1){
					window.location.href="/EBike/index";
				}else{
					alert(data.msg);
				}
			}
		});
	}
}
</script>
<style type="text/css">
.bannerPane { text-align:center; overflow: hidden; }
.bannerPane img {  }
</style>
</head>
<body style="overflow:hidden">
<header>
	<i class="logo"></i>
    <!-- <a href="#">
    <div class="sch">
    	<p><img src="/EBike/frontend/images/icon/sch.png">搜索目的地、帖子、景点</p>
    </div>
    </a> -->
    <div class="head">

</header>

<div id="_contain">
<div class="bannerPane">
			  <section class="slider">
				<div class="flexslider">
				  <ul class="slides">
				  <img src="/EBike/frontend/img/system_bg.jpg" alt="">
				  <!--<c:forEach items="${adsList}" var="ad">
					<li>
						<img src="/EBike${ad.adUrl}" title="${ad.adName}" width="600px" height="280px"/>
						</li>
						</c:forEach>-->
				  </ul>
				</div>
			  </section>
			</div>
<!-- <div class="banner">
	<c:forEach items="${adsList}" var="ad">
		<img src="/EBike${ad.adUrl}" title="${ad.adName}" />
	</c:forEach>
    <div class="logo-dbs">
    	<div class="dbs-img">
        	<img src="/EBike/frontend/images/icon/logo.png">
        </div>
        <p>铭智电动车管理系统</p>
    </div>
</div>
 -->
<div class="menu" style="display:none">
	<div class="nav">
    	<!--<img src="/EBike/frontend/images/menu/nav_1.png">
        <p>看攻略</p> -->
    </div>
    <c:if test="${sessionScope.carNumber==null}">
		<div class="nav">
	    	<!--  <img src="/EBike/frontend/images/menu/nav_2.png" <c:if test="${sessionScope.userId==null}"> onclick="window.location.href='/EBike/login'" </c:if><c:if test="${sessionScope.userId!=null}"> onclick="window.location.href='/EBike/selectNumber'" </c:if> style="cursor:pointer" />
	        <p>车辆选号</p>-->
	    </div>
    </c:if>
	<div class="nav">
    	<!--<img src="/EBike/frontend/images/menu/nav_3.png" <c:if test="${sessionScope.userId==null}"> onclick="window.location.href='/EBike/login'" </c:if><c:if test="${sessionScope.userId!=null}"> onclick="sendAppoint()" </c:if> style="cursor:pointer" />
        <p>预约上牌</p>-->
    </div>
	<div class="nav">
    	<!--<img src="/EBike/frontend/images/menu/nav_4.png">
        <p>找附近</p> -->
    </div>
</div>

<div class="name">
	<p>目前您的车辆所在位置 &nbsp;&nbsp;&nbsp;&nbsp;<a class=" button blue"  href="javascript:void(0)" onclick="updateLicense()">同步车牌</a> </p>
</div>
<div class="banner1" style="overflow-y:scroll">
	<!-- <img src="/EBike/frontend/images/index/banner.png"> -->
    <div class="logo-dbs1">
    <!--<div class="dbs-img">
        		 <img src="/EBike/frontend/images/index/bike.jpg">
        	</div> -->
        <p style="font-size: 15px" id="location">
	        <c:if test="${sessionScope.loginUser==null}">
	        	请先<a href="/EBike/login">登录</a>后查看您的电动车最新位置<br/>
    <center><a class="large button blue"  href="/EBike/register">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;<a class="large button red"  href="/EBike/login">登录</a> </center>
	        </c:if>
	        <c:if test="${sessionScope.loginUser!=null}">
	            
	        	<c:forEach items="${carNumbers}" var="carNumber">
	        		车牌[<span class="carNumberClass" style="line-height:0.9rem;">${carNumber.carNum}</span>]:&nbsp;&nbsp;&nbsp;&nbsp;<a id="defence${carNumber.carNum}" class="super button <c:if test="${carNumber.defenceStatus==0}"> red </c:if><c:if test="${carNumber.defenceStatus==1}">green</c:if>" href="javascript:void(0)" onclick="setDefence('${carNumber.carNum}')">
	        		<c:if test="${carNumber.defenceStatus==0}">锁</c:if><c:if test="${carNumber.defenceStatus==1}">开</c:if></a><span id="defenceText${carNumber.carNum}" style="font-size:12px"><c:if test="${carNumber.defenceStatus==0}">(本车未上锁)</c:if><c:if test="${carNumber.defenceStatus==1}">(本车已锁定)</c:if></span>
	        		<br/><span id="currentLocation${carNumber.carNum}" style="line-height:0.9rem;"><!-- 获取位置中... --></span><br/>
	        	</c:forEach>
	        </c:if>
        </p>
    </div>
</div>

<!--  <div class="name">
	<p>电动车商城</p>
</div>

<div class="favorable">

<div class="fb">
    <div class="fb-lt">
    	<img src="/EBike/frontend/images/scenics/scenic_3.png">
        <p class="fb-name">塞班岛5-6天（欢乐自由 行）</p>
        <p class="price">
        	<span class="discount">4.7折</span>
            <span class="num"><big>5699</big>元起</span>
        </p>
    </div>
</div>
<div class="fb">
    <div class="fb-lt">
    	<img src="/EBike/frontend/images/scenics/scenic_4.png">
        <p class="fb-name">夏威夷7天6晚 （三天跟团三天自由行）</p>
        <p class="price">
        	<span class="discount">8.7折</span>
            <span class="num"><big>11799</big>元起</span>
        </p>
    </div>
</div>
<div class="fb">
    <div class="fb-lt">
    	<img src="/EBike/frontend/images/scenics/scenic_5.png">
        <p class="fb-name">体验全球最长的过山车15天超爽旅游</p>
        <p class="price">
        	<span class="discount">6.2折</span>
            <span class="num"><big>21099</big>元起</span>
        </p>
    </div>
</div>
<div class="fb">
    <div class="fb-lt">
    	<img src="/EBike/frontend/images/scenics/scenic_6.png">
        <p class="fb-name">美国纽约曼哈顿5天游（体验不一样的风情）</p>
        <p class="price">
        	<span class="discount">2.8折</span>
            <span class="num"><big>2889</big>元起</span>
        </p>
    </div>
</div>

</div>-->
 
<!--  <div class="more">
	<p>查看更多<img src="/EBike/frontend/images/icon/arr-right.png"></p>
</div>  -->  

</div>

<jsp:include page="footer.jsp"></jsp:include>
<script type="text/javascript" src="/EBike/frontend/js/api.js"></script>
<script>
if('${sessionScope.userId}'!=''){
		apiready = function(){
				/*var push = api.require('push');
				push.bind({
				    userName:'${sessionScope.loginUser.userName}',
				    userId:userId
				},function(ret,err){
				    if(ret.status){
				        //api.alert({msg:'绑定成功'});
				    }else{
				        api.alert({msg:err.msg});
				    }
				});
				push.setListener(
				    function(ret,err){
				        if(ret){
				            api.alert({msg:ret.data});
				        }
				    }
				);*/
				var ajpush = api.require('ajpush');  
                var param = {  
                    alias : '${sessionScope.userId}',  
                    tags : ['${sessionScope.userId}']
                };  
                ajpush.bindAliasAndTags(param, function(ret) {  
                    var statusCode = ret.statusCode;  
                });  
                ajpush.init(function(ret) {  
                    if (ret && ret.status) {  
                        //success  
                        ajpush.setListener(function(ret) {  
                            var id = ret.id;  
                            var title = ret.title;  
                            var content = ret.content;  
                            var extra = ret.extra;  
                            console.log("id=" + id + ",title=" + title + ",content=" + content + ",extra=" + extra);  
                        });  
                    }  
                });  
		};
}
</script>
<script type="text/javascript">
var userId = "${sessionScope.userId}";

function checkLocation(){
	$.each($(".carNumberClass"),function(i,n){
		var ccarNumber = $(n).text();
		$.ajax({
				type: "post",
				url: "/EBike/user/getLocation.do",
				data: {
				"carNum":ccarNumber
				},
				dataType: "json",
				async:false,
				success: function(data){
					if(data.code==1){
						$("#currentLocation"+ccarNumber).html("你的车被移动，请确认是否车主本人移动");
						/*var latitude = data.res.latitude;
						var longitude = data.res.longitude;
						if(latitude==null || longitude==null){
							$("#currentLocation"+ccarNumber).html(data.res.alertAddr);
						}else{
							var location = latitude + "," + longitude;
							$.ajax({
									type: "get",
									url: "http://api.map.baidu.com/geocoder/v2/",
									data: {
										"ak": "KCUlsW2Z2bhyF9zGpGsTQRlm",
										//"callback": "renderReverse",
										"location":location,
										"output":"json",
										"pois":1
									},
									dataType: "jsonp",
									async:false,
									success: function(data){
										if(data.status==0){
											$("#currentLocation"+ccarNumber).html(data.result.formatted_address);
										}else{
											alert("data.status:"+data.status);
										}
									}
							});
						}*/
					}else{
						//alert(data.msg);
					}
				}
		});
	});
}

$(function(){
	if(userId!=''){
		if("${sessionScope.loginUser.certNo}"==''&&"${sessionScope.carNumber}"==''){
			$("#currentLocation").html("请先完善登记身份证信息(我的-用户信息-<a href='/EBike/modifyInfo'>修改完善</a>)或选择车牌号(<a href='/EBike/selectNumber'>选号</a>)后查询电动车最新位置");
		}else{
		    setInterval(checkLocation,10000);
			/*$.each($(".carNumberClass"),function(i,n){
				var ccarNumber = $(n).text();
				$.ajax({
						type: "get",
						url: "http://122.226.49.30:60001/wy/wy/elecfence/warm-info-getCardWarmInfo.action",
						data: {
							"queryType": 1,//根据车牌号来查
							"queryValue": ccarNumber
						},
						dataType: "json",
						error:function(result){
							$("#currentLocation"+ccarNumber).html("最新位置暂时无法获取，请确认位置接口无误");
						},
						success: function(result) {
							if(result.records!=null){
								if(result.records.position==null){
									$("#currentLocation"+ccarNumber).html("最新位置暂时无法获取，请确认登记信息准确无误");
								}else{
									var latitude = result.records.position.latitude;
									var longitude = result.records.position.longitude;
									
									var location = latitude + "," + longitude;
									$.ajax({
											type: "get",
											url: "http://api.map.baidu.com/geocoder/v2/",
											data: {
												"ak": "KCUlsW2Z2bhyF9zGpGsTQRlm",
												"callback": "renderReverse",
												"location":location,
												"output":"json",
												"pois":1
											},
											dataType: "json",
											async:false,
											success: function(data){
												if(data.status==0){
													$("#currentLocation"+ccarNumber).html(data.result.formatted_address);
												}else{
													alert("data.status:"+data.status);
												}
											}
									});
								}
							}
						}
				});
			});*/

		}
	}
});

function renderReverse(data){
	if(data.status==0){
		$("#currentLocation").html(data.result.formatted_address);
	}else{
		alert("data.status:"+data.status);
	}
}
/*请求设防*/
function setDefence(carNumber){
		var set_status = "1";
		var success_result = "开";
		if($("#defenceText"+carNumber).text()=="(本车已锁定)"){
			set_status = "0";
			success_result = "锁";
		}
		$.ajax({
				type: "post",
				url: "/EBike/user/setDefence",
				data: {
				"set_status":set_status,
				"carNum":carNumber
				},
				dataType: "json",
				async:false,
				success: function(data){
					if(data.code==1){
						//$("#defence"+carNumber).onclick="deleteDefence("+carNumber+")";
						$("#defence"+carNumber).text(success_result);
						if(success_result=="开") {
							$("#defence"+carNumber).removeClass("red").addClass("green");
							$("#defenceText"+carNumber).text("(本车已锁定)");
						}
						else {
							$("#currentLocation"+carNumber).html("");
						    $("#defence"+carNumber).removeClass("green").addClass("red");
						    $("#defenceText"+carNumber).text("(本车未上锁)");
						}
						//if(data.res!=null) $("#currentLocation"+carNumber).html(data.res);
					}else{
						alert(data.msg);
					}
				}
		});
}
function sendAppoint(){
		$.ajax({
				type: "post",
				url: "/EBike/appoint/checkAppointByUser",
				data: {
				},
				dataType: "json",
				async:false,
				success: function(data){
					if(data.code==1){
						window.location.href='/EBike/sendAppoint';
					}else if(data.code==2){
						alert(data.msg);
						window.location.href='/EBike/myappoint';
					}else{
						alert(data.msg);
					}
				}
		});
}


</script>
</body>
</html>
