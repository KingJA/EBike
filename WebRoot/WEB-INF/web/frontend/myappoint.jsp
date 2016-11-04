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
<title>我的预约</title>
<link rel="stylesheet" type="text/css" href="/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/frontend/css/index.css">
<script type="text/javascript" src="/frontend/js/Adaptive.js"></script>
</head>

<body>

<header>
	<i class="logo"></i>
    <!-- <a href="#">
    <div class="sch">
    	<p><img src="/frontend/images/icon/sch.png">搜索目的地、帖子、景点</p>
    </div>
    </a> -->
    <a class="large button blue" style="float:right" href="javascript:void(0)" onclick="sendAppoint()">+ 预约</a>
</header>

<div id="_contain">

<div class="name">
	<p>我的预约</p>
</div>

<div class="favorable">
	<c:forEach items="${appointments}" var="appoint">
		<div class="fa">
		    <div class="fa-lt">
		        <p class="fb-name"><span style="font-size: 18px">${appoint.appointTimeStr}-${appoint.statusText}<a class="medium button orange" style="float:right" href="/appointDetail/${appoint.id}">查看详情</a></span></p>
		    </div>
		</div>
	</c:forEach>
</div>
<!--  
<div class="more">
	<input type="hidden" id="appointPage" value="${page }" />
	<p id="loadMore">查看更多<img src="/frontend/images/icon/arr-right.png"></p>
</div>    
--> 
</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/frontend/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript" >
function sendAppoint(){
		$.ajax({
				type: "post",
				url: "/appoint/checkAppointByUser",
				data: {
				},
				dataType: "json",
				async:false,
				success: function(data){
					if(data.code==1){
						window.location.href='/sendAppoint';
					}else if(data.code==2){
						alert(data.msg);
						window.location.href='/myappoint';
					}else{
						alert(data.msg);
					}
				}
		});
}
</script>
</body>
</html>
