<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>
	<!-- BEGIN SIDEBAR -->
	<div class="page-sidebar-wrapper">
		<div class="page-sidebar navbar-collapse collapse">
			<!-- add "navbar-no-scroll" class to disable the scrolling of the sidebar menu -->
			<!-- BEGIN SIDEBAR MENU -->
			<ul class="page-sidebar-menu" data-auto-scroll="true" data-slide-speed="200">
				<li class="sidebar-toggler-wrapper tooltips" data-container="body" data-placement="right" data-html="true" data-original-title="折叠/展开左侧菜单栏">
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
					<div class="sidebar-toggler hidden-phone">
					</div>
					<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
				</li>
				<li class="sidebar-search-wrapper">
					<!-- BEGIN RESPONSIVE QUICK SEARCH FORM -->
					 <form class="sidebar-search" action="extra_search.html" method="POST">
						<div class="form-container">
							<!-- <div class="input-box">
								<a href="javascript:;" class="remove">
								</a>
								<input type="text" placeholder="搜索..."/>
								<input type="button" class="submit" value=" "/>
							</div> -->
						</div>
					</form> 
					<!-- END RESPONSIVE QUICK SEARCH FORM -->
				</li>
				<li id="ebikeManagementMenu">
					<a href="javascript:;">
						<span class="title">
						<i class="fa fa-table"></i>
							电动车管理
						</span>
						<span class="arrow ">
						</span>
					</a>
					<ul class="sub-menu">
						<li id="userManageMenu">
							<a href="/backenduser/userManagement"><i class="fa fa-globe"></i>
								车主/用户管理
							</a>
						</li>
						<li id="carNumManageMenu">
							<a href="/backendcarNum/carNumManagement"><i class="fa fa-bars"></i>
								选号管理
							</a>
						</li>
						<li id="appointManageMenu">
							<a href="/backendappoint/appointManagement"><i class="fa fa-envelope"></i>
								预约管理
							</a>
						</li>
						<li id="complaintManageMenu">
							<a href="/backendcomplaint/complaintManagement"><i class="fa fa-envelope"></i>
								投诉管理
							</a>
						</li>
					</ul>
				</li>
				<li id="systemSettingMenu">
					<a href="javascript:;">
						<span class="title">
						<i class="fa fa-cogs"></i>
							系统管理
						</span>
						<span class="arrow ">
						</span>
					</a>
					<ul class="sub-menu">
						<li id="adminManageMenu">
							<a href="/backenduser/adminManagement"><i class="fa fa-user"></i>
								管理员管理
							</a>
						</li>
						<li id="adManageMenu">
							<a href="/backendads/adsManagement"><i class="fa fa-user"></i>
								广告管理
							</a>
						</li>
						<!--  <li id="personManageMenu">
							<a href="/backendperson/personManagement"><i class="fa fa-th"></i>
								人员例子
							</a>
						</li>
						<li id="roleManagementMenu">
							<a href="/backendrole/roleManagement"><i class="fa fa-globe"></i>
								角色管理
							</a>
						</li>
						<li id="privilegeManageMenu">
							<a href="/backendprivilege/list"><i class="fa fa-tags"></i>
								权限管理
							</a>
						</li>-->
						<li id="dictManageMenu">
							<a href="/backenddict/index"><i class="fa fa-th"></i>
								 字典管理
							</a>
						</li>
					</ul>
				</li>
			</ul>
			<!-- END SIDEBAR MENU -->
		</div>
	</div>
	<!-- END SIDEBAR -->
