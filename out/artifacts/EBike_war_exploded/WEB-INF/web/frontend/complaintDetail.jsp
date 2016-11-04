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
<title>投诉详情</title>
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/index.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/form.css">
<script type="text/javascript" src="/EBike/frontend/js/Adaptive.js"></script>
</head>

<body style="background: #D2E9FF;">

<div id="_contain">

<form id="complaintForm" method="post" class="elegant-aero">
	<label>
	<span>投诉主题 :</span>
	<input type="text" value="${complaint.title}" readonly />
	</label>
	<label>
	<span>投诉内容 :</span>
	<textarea id="content" name="content" readonly>${complaint.content}</textarea>
	</label>
	<label>
	<span>投诉用户:</span>
	<input type="text" value="${complaint.userName}" readonly />
	</label>
	<label>
	<span>投诉状态:</span>
	<input type="text" value="${complaint.statusText}" readonly />
	</label>
	<label>
	<span>处理结果:</span>
	<input type="text" value="${complaint.result}" readonly />
	</label>
	<label>
	<span>投诉时间:</span>
	<input type="text" value="${complaint.createTimeStr}" readonly />
	</label>
	<label>
	<span>&nbsp;</span>
	<input type="button" class="button" value="返回" onclick="history.go(-1)"/>
	</label>
</form>

</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/EBike/frontend/js/jquery-1.7.1.min.js"></script>
</body>
</html>
