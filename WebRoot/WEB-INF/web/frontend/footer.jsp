<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>
<footer>
	<a href="/index">
		<div id="indexMenu" class="foot">
	    	<img src="/frontend/images/foot/ft_1.png">
	        <p>首页</p>
	    </div>
    </a>
	<a href="/mycenter">
		<div id="mycenterMenu" class="foot">
	    	<img src="/frontend/images/foot/ft_4.png">
	        <p>我的</p>
	    </div>
    </a>
    <a href="tel:0579-88888888">
		<div class="foot">
	    	<img src="/frontend/images/foot/ft_2.png">
	        <p>客服</p>
	    </div>
    </a>
    <a href="/complaint">
		<div id="complaintMenu" class="foot">
	    	<img src="/frontend/images/foot/ft_3.png">
	        <p>投诉</p>
	    </div>
    </a>

</footer>   