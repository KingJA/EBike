<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>
<footer>
	<a class="tab-link-1" href="/index" title="首页"></a>
	<a class="tab-link-2" href="/mycenter" title="会员中心"></a>
	<a class="tab-link-3" href="tel:0579-88888888" title="客服"></a>
	<a class="tab-link-4" href="/complaint" title="投诉中心"></a>
</footer>