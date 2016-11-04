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
<title>用户信息</title>
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/index.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/form.css">
<script type="text/javascript" src="/EBike/frontend/js/Adaptive.js"></script>
</head>

<body style="background: #D2E9FF;">

<div id="_contain">

<form id="userForm" method="post" class="elegant-aero">
	<label>
	<span>用户名 :</span>
	<input type="text" value="${sessionScope.loginUser.userName}" readonly />
	</label>
	<label>
	<span>真实姓名 :</span>
	<input type="text" value="${sessionScope.loginUser.realName}" readonly />
	</label>
	<label>
	<span>手机号:</span>
	<input type="text" value="${sessionScope.loginUser.mobile}" readonly />
	</label>
	<label>
	<span>身份证号:</span>
	<input type="text" value="${sessionScope.loginUser.certNo}" readonly />
	</label>
	<label>
	<span>车牌号:</span>
	<c:if test="${sessionScope.carNumber==null||sessionScope.carNumber==''}">
		<input type="button" class="button" value="选号" onclick="window.location.href='/EBike/selectNumber'"/>
	</c:if>
	<c:if test="${sessionScope.carNumber!=null&&sessionScope.carNumber!=''}">
		<input type="text" value="${sessionScope.carNumber}" readonly />
	</c:if>
	</label>
	<label>
	<span>&nbsp;</span>
	<input type="button" class="button" value="返回" onclick="window.location.href='/EBike/mycenter'"/><input type="button" class="button" value="修改完善" onclick="window.location.href='/EBike/modifyInfo'"/>
	</label>
</form>

</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/EBike/frontend/js/jquery-1.7.1.min.js"></script>
</body>
</html>
