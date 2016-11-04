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
<title>预约详情</title>
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/index.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/form.css">
<script type="text/javascript" src="/EBike/frontend/js/Adaptive.js"></script>
</head>

<body style="background: #D2E9FF;">

<div id="_contain">

<form id="appointForm" method="post" class="elegant-aero">
	<label>
	<span>预约时间 :</span>
	<input type="text" value="${appoint.appointTimeStr}" readonly />
	</label>
	<label>
	<span>管理所:</span>
	<input type="text" value="${appoint.placeText}" readonly />
	</label>
	<label>
	<span>预约状态:</span>
	<input type="text" value="${appoint.statusText}" readonly />
	</label>
	<label>
	<span>申请时间:</span>
	<input type="text" value="${appoint.applyTimeStr}" readonly />
	</label>
	<label>
	<span>用户留言:</span>
	<input type="text" value="${appoint.message}" readonly />
	</label>
	<span>&nbsp;</span>
	<input type="button" class="button" value="返回" onclick="history.go(-1)"/>
	<c:if test="${appoint.status==0}"><input type="button" class="button" value="取消预约" onclick="cancelAppoint('${appoint.id}')"/></c:if>
	</label>
</form>

</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/EBike/frontend/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
function cancelAppoint(id){
	if(confirm("确认取消这次预约吗?")){
		$.ajax({
				type: "post",
				url: "/EBike/appoint/cancelAppoint",
				data: {
					"id":id
				},
				dataType: "json",
				async:false,
				success: function(data){
					if(data.code==1){
						window.location.href='/EBike/myappoint';
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
