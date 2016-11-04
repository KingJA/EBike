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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>个人中心</title>
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/person.css">
<script type="text/javascript" src="/EBike/frontend/js/Adaptive.js"></script>
<script type="text/javascript" src="/EBike/frontend/js/jquery-1.11.0.min.js"></script>
</head>
<script type="text/javascript">
$(function(){
	$("#mycenterMenu").addClass("act");
});
</script>
<body>

<div class="head">
	<div class="head-img">
    	<img src="/EBike/frontend/images/person/head.png">
    	<c:if test="${sessionScope.loginUser==null }">
    		<p><span class="line"><a href="/EBike/login">登录</a></span><span><a href="/EBike/register">注册</a></span></p>
	    </c:if>
	    <c:if test="${sessionScope.loginUser!=null }">
	    	<p><span class="line">${sessionScope.loginUser.userName}</span><span><a href="javascript:void(0)" onclick="logout()">退出登录</a></span></p>
	    </c:if>
    </div>
    <div class="logo-dbs">
    	<div class="dbs-img">
        	<img src="/EBike/frontend/images/icon/logo.png">
        </div>
        <p>电动车防盗管理系统</p>
    </div>
    <!--  <div class="bt"><p class="bt-lf">0关注</p><p>0粉丝</p></div>-->
</div>

<!-- <div class="whe">
	<div class="whe-lt whe-br">
    	<p class="lf-tp"><img src="/EBike/frontend/images/person/flag.png">足迹</p>
        <p class="lf-bt"><span>0国家</span><span>0城市</span></p>
    </div>
    <div class="whe-lt">
    	<p class="lf-tp"><img src="/EBike/frontend/images/icon/heart.png">足迹</p>
        <p class="lf-bt"><span>0国家</span><span>0城市</span></p>
    </div>
</div>
<div class="whe">
	<div class="whe-lt whe-br">
    	<p class="lf-tp"><img src="/EBike/frontend/images/person/in.png">足迹</p>
        <p class="lf-bt"><span>0国家</span><span>0城市</span></p>
    </div>
    <div class="whe-lt">
    	<p class="lf-tp"><img src="/EBike/frontend/images/person/out.png">足迹</p>
        <p class="lf-bt"><span>0国家</span><span>0城市</span></p>
    </div>
</div> -->

<div class="person">
	<div class="pn-lt" onclick="window.location.href='/EBike/myinfo'" style="cursor:pointer">
    	<p><img class="img-lf" src="/EBike/frontend/images/person/lt_1.png">用户信息<img class="img-rt" src="/EBike/frontend/images/icon/arr_rt.png"></p>
    </div>
	<div class="pn-lt" onclick="window.location.href='/EBike/myappoint'" style="cursor:pointer">
    	<p><img class="img-lf" src="/EBike/frontend/images/person/lt_1.png">我的预约<img class="img-rt" src="/EBike/frontend/images/icon/arr_rt.png"></p>
    </div>
	<div class="pn-lt" onclick="window.location.href='/EBike/mycomplaint'" style="cursor:pointer">
    	<p><img class="img-lf" src="/EBike/frontend/images/person/lt_2.png">我的投诉<img class="img-rt" src="/EBike/frontend/images/icon/arr_rt.png"></p>
    </div>
    <c:if test="${sessionScope.loginUser!=null }">
	    <div class="pn-lt" onclick="window.location.href='/EBike/changePasswd'" style="cursor:pointer">
	    	<p><img class="img-lf" src="/EBike/frontend/images/person/lt_2.png">修改密码<img class="img-rt" src="/EBike/frontend/images/icon/arr_rt.png"></p>
	    </div>
	    <div class="pn-lt" onclick="logout()" style="cursor:pointer">
	    	<p><img class="img-lf" src="/EBike/frontend/images/person/lt_2.png">退出登录<img class="img-rt" src="/EBike/frontend/images/icon/arr_rt.png"></p>
	    </div>
    </c:if>
	<!-- <div class="pn-lt">
    	<p><img class="img-lf" src="/EBike/frontend/images/person/lt_3.png">我的收藏<img class="img-rt" src="/EBike/frontend/images/icon/arr_rt.png"></p>
    </div>
	<div class="pn-lt">
    	<p><img class="img-lf" src="/EBike/frontend/images/person/lt_4.png">我的问答<img class="img-rt" src="/EBike/frontend/images/icon/arr_rt.png"></p>
    </div>
	<div class="pn-lt">
    	<p><img class="img-lf" src="/EBike/frontend/images/person/lt_5.png">我的驴友<img class="img-rt" src="/EBike/frontend/images/icon/arr_rt.png"></p>
    </div>
	<div class="pn-lt">
    	<p><img class="img-lf" src="/EBike/frontend/images/person/lt_6.png">我的折扣<img class="img-rt" src="/EBike/frontend/images/icon/arr_rt.png"></p>
    </div> -->
    <div class="jg"></div>
</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
</body>
</html>