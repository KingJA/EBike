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
<title>添加投诉</title>
<link rel="stylesheet" type="text/css" href="/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/frontend/css/index.css">
<link rel="stylesheet" type="text/css" href="/frontend/css/form.css">
<script type="text/javascript" src="/frontend/js/Adaptive.js"></script>
</head>

<body style="background: #D2E9FF;">

<header>
	<a class="large button blue" style="float:left" onclick="history.go(-1)">返回</a>
</header>

<div id="_contain">

<form id="complaintForm" action="/complaint/sendComplaint" method="post" class="elegant-aero">
<h1>添加投诉
<span>请填写以下信息.</span>
</h1>
<label>
<span>投诉主题 :</span>
<input id="title" name="title" type="text" placeholder="请填写投诉主题" />
</label>

<label>
<span>投诉内容 :</span>
<textarea id="content" name="content" rows="20" placeholder="请填写投诉内容"></textarea>
</label>
<label>
<span>&nbsp;</span>
<input type="button" class="button" value="提交" onclick="submitComplaintForm()"/>
<input type="button" class="button" value="重置" onclick="$('#complaintForm').reset()"/>
</label>
</form>


</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/frontend/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
function submitComplaintForm(){
	if($("#title").val()=='') {
		alert("投诉主题不能为空！");
		return false;
	}
	if($("#content").val()=='') {
		alert("投诉内容不能为空！");
		return false;
	}
	$("#complaintForm").submit();
}
</script>
</body>
</html>
