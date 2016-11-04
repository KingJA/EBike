<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="back_common/taglib.jsp" %>
<%
//设置无缓存
response.setHeader("progma","no-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires",0);

/*User user = (User) request.getSession().getAttribute("loginUser");  
if(user != null) {    
	
	response.sendRedirect(path+"/admin/index");
	System.out.println("---------------用户已经登录 ---------------------- ");
}*/
%>
<!DOCTYPE html>
<jsp:include page="back_common/ieCompatibility.jsp"></jsp:include>
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>登录</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<!-- <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/> -->
<link href="/EBike/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/select2/select2-metronic.css"/>
<!-- END PAGE LEVEL SCRIPTS -->
<!-- BEGIN THEME STYLES -->
<link href="/EBike/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="/EBike/assets/css/pages/login-soft.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/css/custom.css" rel="stylesheet" type="text/css"/>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="/EBike/favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="login">
<!-- BEGIN LOGO -->
<div class="logo">
	<a href="#">
		<img src="/EBike/assets/img/GIZII.png" height="42px" alt="logo" class="img-responsive" style="margin-left:auto;margin-right:auto;"/>
	</a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">
	<!-- BEGIN LOGIN FORM -->
	<form class="login-form" action="" method="post">
		<h3 class="form-title">登录您的管理账户</h3>
		<div class="alert alert-danger display-hide">
			<button class="close" data-close="alert"></button>
			<span>
				 输入你的账号和密码。
			</span>
		</div>
		<div class="form-group">
			<!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
			<label class="control-label visible-ie8 visible-ie9">用户名</label>
			<div class="input-icon">
				<i class="fa fa-user"></i>
				<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="userName" id="userName" value=""/>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label visible-ie8 visible-ie9">请输入你的密码</label>
			<div class="input-icon">
				<i class="fa fa-lock"></i>
				<input class="form-control placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="passWd" id="password" value=""/>
			</div>
		</div>
		<div class="form-actions">
			<label class="checkbox">
			<input type="checkbox" name="remember" value="1"/> 记住我 </label>
			<button type="submit" id="submitBtn" class="btn blue pull-right">
			登录 <i class="m-icon-swapright m-icon-white"></i>
			</button>
			<h4>${msg }</h4>
		</div>
		<!-- 后期做成用微信号登录，用APP注册号登录-->
		 <div class="login-options">
		 <br/> <br/> 
		</div> 
		<!-- <div class="forget-password">
			<h4>忘记密码 ?</h4>
			<p>
				 没关系, 单击
				<a href="javascript:;" id="forget-password">
					 这里
				</a>
				 重置你的密码.
			</p>
		</div> -->
		<!-- <div class="create-account">
			<p>
				 还没有账号 ?&nbsp;
				<a href="javascript:;" id="register-btn">
					 新建账户
				</a>
			</p>
		</div> -->
	</form>
	<!-- END LOGIN FORM -->
	<!-- BEGIN FORGOT PASSWORD FORM -->
	<!--  <form class="forget-form" action="" method="post">
		<h3>忘记 ?</h3>
		<p>
			 输入你的Email地址重置密码。
		</p>
		<div class="form-group">
			<div class="input-icon">
				<i class="fa fa-envelope"></i>
				<input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email"/>
			</div>
		</div>
		<div class="form-actions">
			<button type="button" id="back-btn" class="btn">
			<i class="m-icon-swapleft"></i> 返回 </button>
			<button type="submit" class="btn blue pull-right">
			提交 <i class="m-icon-swapright m-icon-white"></i>
			</button>
		</div>
	</form>-->
	<!-- END FORGOT PASSWORD FORM -->
</div>
<!-- END LOGIN -->
<!-- BEGIN COPYRIGHT -->
<center>2015 &copy; 云媒信息</center>
<!-- END COPYRIGHT -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
	<script src="assets/plugins/respond.min.js"></script>
	<script src="assets/plugins/excanvas.min.js"></script> 
	<![endif]-->
<script src="/EBike/assets/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="/EBike/assets/plugins/jquery-validation/dist/jquery.validate.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/backstretch/jquery.backstretch.min.js" type="text/javascript"></script>
<script type="text/javascript" src="/EBike/assets/plugins/select2/select2.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/EBike/assets/scripts/core/app.js" type="text/javascript"></script>
<script src="/EBike/assets/scripts/custom/login-soft.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
		jQuery(document).ready(function() {   
		  App.init();
		  Login.init();
		});
		
	</script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>