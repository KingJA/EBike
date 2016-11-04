<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>

 <div class="btn-group pull-right">
		<button class="btn dropdown-toggle" data-toggle="dropdown">工具 <i class="fa fa-angle-down"></i>
		</button>
		<ul class="dropdown-menu pull-right">
			<li>
				<a href="#">
					 打印
				</a>
			</li>
			<li>
				<a href="#">
					另存为 PDF
				</a>
			</li>
			<li>
				<a href="#">
					 导出到 Excel
				</a>
			</li>
		</ul>
</div>