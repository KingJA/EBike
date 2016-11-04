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
<title>预约</title>
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


<form id="appointForm" action="/appoint/sendAppoint" method="post" class="elegant-aero">
<h1>预约上牌
<span>请填写以下信息.</span>
</h1>
<label>
<span>预约日期 :</span>
<input class="Wdate" id="appointTime" type="text" placeholder="请点击选择预约日期" onClick="WdatePicker({isShowClear:false,readOnly:true})"/>
<input type="hidden" id="appointTimeStr" name="appointTimeStr" />
</label>
<label>
<span>管理所 :</span><select id="place" name="place">
					<option></option>
					<option value="1">江南管理所</option>
					<option value="2">江北管理所</option>
				</select>
</label>

<label>
<span>留言 :</span>
<textarea id="message" name="message" placeholder="请输入留言信息"></textarea>
</label>

<label>
<span>&nbsp;</span>
<input type="button" class="button" value="提交" onclick="submitAppointForm()"/>
<input type="button" class="button" value="重置" onclick="$('#appointForm').reset()"/>
</label>
</form>


</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/frontend/js/jquery-1.7.1.min.js"></script>
<script language="javascript" type="text/javascript" src="/frontend/js/WdatePicker.js"></script>
<script type="text/javascript">
function submitAppointForm(){
	if($("#appointTime").val()=='') {
		alert("预约日期不能为空！");
		return false;
	}else{
		$("#appointTimeStr").val($("#appointTime").val());
	}
	if($("#place").val()=='') {
		alert("请选择附近的管理所！");
		return false;
	}
	if(confirm("确认预约信息无误吗？")){
		$("#appointForm").submit();
	}
}
</script>
</body>
</html>
