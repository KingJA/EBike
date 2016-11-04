<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>

              <div class="row">
				<div class="col-md-12">
					<!-- BEGIN PAGE TITLE & BREADCRUMB-->
					<h3  style="height:3px;">
					 <small>&nbsp;</small>
					</h3>
					<ul class="page-breadcrumb breadcrumb">
						<li class="btn-group">
							<button type="button" class="btn blue dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-delay="1000" data-close-others="true">
							<span>
								操作
							</span>
							<i class="fa fa-angle-down"></i>
							</button>
							<ul class="dropdown-menu pull-right" role="menu">
								<!-- <li>
									<a href="#">
										打印
									</a>
								</li>
								<li>
									<a href="#">
										导出excel
									</a>
								</li> -->
							</ul>
						</li>
						<li>
							<i class="fa fa-home"></i>
							<a  href="/EBike/admin/index">
								工作台
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a id="menu_1" href="#">
								
							</a>
							<i class="fa fa-angle-right"></i>
						</li>
						<li>
							<a id="menu_2" href="#">
								
							</a>
						</li>
					</ul>
					<!-- END PAGE TITLE & BREADCRUMB-->
				</div>
			</div>