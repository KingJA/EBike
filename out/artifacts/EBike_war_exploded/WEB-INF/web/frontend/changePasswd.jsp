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
<title>修改密码</title>
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/index.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/form.css">
<script type="text/javascript" src="/EBike/frontend/js/Adaptive.js"></script>
</head>

<body style="background: #D2E9FF;">

<header>
	<a class="large button blue" style="float:left" onclick="history.go(-1)">返回</a>
</header>

<div id="_contain">

<form id="passwdForm" action="" method="post" class="elegant-aero">
<h1>修改密码
<span>请填写以下信息.</span>
</h1>

<span>原密码 :</span>
<input id="oldpasswd" name="oldpasswd" type="password" placeholder="请填写原密码" />
<br/><br/>
<span>新密码 :</span>
<input id="passwd" name="passwd" type="password" placeholder="请填写新密码" />
<br/><br/>
<span>重复新密码 :</span>
<input id="repeatpasswd" name="repeatpasswd" type="password" placeholder="请再次输入新密码" />
<br/><br/>
<span>&nbsp;</span>
<input type="button" class="button" value="提交" onclick="submitPasswdForm()"/>
<input type="button" class="button" value="重置" onclick="$('#passwdForm').reset()"/>

</form>


</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/EBike/frontend/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
function submitPasswdForm(){
	var oldpasswd = $("#oldpasswd").val();
	var password = $("#passwd").val();
	var repassword = $("#repeatpasswd").val();
	if(oldpasswd==''){
		alert("请输入原密码");
		return fasle;
	}
	if(password==''){
		alert("请输入新密码");
		return fasle;
	}
	if(repassword==''){
		alert("请再次输入新密码");
		return fasle;
	}
	if(password != repassword){
		alert("两次密码输入不一致");
		return false;
	}
	$.ajax({
		type : "post",
		url : "/EBike/user/changePwd",
		data: {
			oldPwd: oldpasswd,
			newPwd: password
		},
		dataType : "json",
		success : function(result) {
			if(result.code == 1){
				alert("密码修改成功!");
			 	//页面跳转
				window.location.href = "/EBike/mycenter";
			}else{
				alert(result.msg);
			}
		}
	});
}
</script>
</body>
</html>
