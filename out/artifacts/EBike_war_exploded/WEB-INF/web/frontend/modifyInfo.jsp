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
<title>完善用户信息</title>
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/index.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/form.css">
<script type="text/javascript" src="/EBike/frontend/js/Adaptive.js"></script>
</head>

<body style="background: #D2E9FF;">

<div id="_contain">

<form id="userForm" method="post" class="elegant-aero">
<h1>完善用户信息</h1>
	<label>
	<span>用户名 :</span>
	<input type="text" value="${sessionScope.loginUser.userName}" readonly />
	</label>
	<label>
	<span>真实姓名 :</span>
	<input type="text" id="realName" value="${sessionScope.loginUser.realName}" />
	</label>
	<label>
	<span>手机号:</span>
	<input type="text" id="mobile" value="${sessionScope.loginUser.mobile}" />
	</label>
	<label>
	<span>身份证号:</span>
	<input type="text" id="certNo" value="${sessionScope.loginUser.certNo}" />
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
	<input type="button" class="button" value="返回" onclick="window.location.href='/EBike/mycenter'"/><input type="button" class="button" value="提交" onclick="submitUserInfo()"/>
	</label>
</form>

</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/EBike/frontend/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
function isMobileNO(mobileNum){
	var pattern = new RegExp("^((13[0-9])|(14[57])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
	if(!pattern.test(mobileNum)){
		alert("手机号不正确！");
		return false;
	}
	return true;
}
function submitUserInfo(){
	var mobile = $("#mobile").val();
	if(isMobileNO(mobile)){
		$.ajax({
			type: "post",
			url: "/EBike/user/updateUser",
			data: {
				"id":"${sessionScope.userId}",
				"realName":$("#realName").val(),
				"mobile":mobile,
				"certNo":$("#certNo").val()
			},
			dataType: "json",
			async:false,
			success: function(data){
				if(data.code==1){
					window.location.href='/EBike/myinfo';
				}else{
					alert(data.msg);
				}
			}
		});
	}
}
</script>
</body>
</html>
