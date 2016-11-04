<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../back_common/taglib.jsp" %>
<!DOCTYPE html>
<jsp:include page="../back_common/ieCompatibility.jsp"></jsp:include>
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>添加</title>
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
<link rel="stylesheet" href="/EBike/assets/plugins/data-tables/DT_bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/EBike/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="/EBike/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="/EBike/assets/css/custom.css" rel="stylesheet" type="text/css"/>

<!-- form style -->
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/jquery-tags-input/jquery.tagsinput.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/typeahead/typeahead.css">

</head>

<style type="text/css" class="init">
/* body{
	width: 100%;
	height: 100%;
} */

	
</style>

<!-- BEGIN BODY -->
<body class="page-header-fixed page-sidebar-fixed">
<!-- BEGIN HEADER -->
  <jsp:include page="../back_common/bodyHeader.jsp"></jsp:include>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
  <!-- BEGIN CONTAINER -->
 <div class="page-container">
	<!-- BEGIN SIDEBAR -->
     <jsp:include page="../back_common/sidebar.jsp"></jsp:include>
     
     <!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			   <!-- BEGIN STYLE CUSTOMIZER -->
			  <jsp:include page="../back_common/commonCustomStyle.jsp"></jsp:include>
			  <!-- END STYLE CUSTOMIZER -->
			  
			<!-- BEGIN PAGE HEADER-->
			<jsp:include page="../back_common/commonAction.jsp"></jsp:include>
			<!-- END PAGE HEADER-->
			   <div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet-body">
						    
								  <div class="portlet">
									<div class="portlet-title">
										<div class="caption">
											<i class="fa fa-shopping-cart"></i>添加
										</div>
										<div class="actions btn-set">
											<button type="button" name="back" id="backBtn" class="btn default"><i class="fa fa-angle-left"></i> 返回</button>
											<button class="btn default" id="resetBtn" ><i class="fa fa-reply"></i> 撤销</button> 
											<!-- <button class="btn green" id="saveBtn" ><i class="fa fa-check"></i> 保存</button>
											<button class="btn green"><i class="fa fa-check-circle"></i> Save & Continue Edit</button>
											<div class="btn-group">
												<a class="btn yellow" href="#" data-toggle="dropdown">
													<i class="fa fa-share"></i> More <i class="fa fa-angle-down"></i>
												</a>
												<ul class="dropdown-menu pull-right">
													<li>
														<a href="#">
															 Duplicate
														</a>
													</li>
													<li>
														<a href="#">
															 Delete
														</a>
													</li>
													<li class="divider">
													</li>
													<li>
														<a href="#">
															 Print
														</a>
													</li>
												</ul>
											</div>  -->
										  </div>
									</div>	
								</div>
						  <div class="portlet-body form">
									<form action="/EBike/backendperson/save" method="post" id="form_person" class="form-horizontal">
										<div class="form-body">
											<!-- <h3 class="form-section">Advance validation. <small>Custom radio buttons, checkboxes and Select2 dropdowns</small></h3> -->
											<div class="alert alert-danger display-hide">
												<button class="close" data-close="alert"></button>
												表单中包含错误，请检查
											</div>
											<div class="alert alert-success display-hide">
												<button class="close" data-close="alert"></button>
												表单效验成功!
											</div>
											<div class="form-group">
												<label class="control-label col-md-3">姓名
												<span class="required">
													 *
												</span>
												</label>
												<div class="col-md-4">
													<input type="text" name="name" data-required="1" class="form-control"/>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3">年龄
												<span class="required">
													 *
												</span>
												</label>
												<div class="col-md-4">
													<input type="text" name="age" data-required="1" class="form-control"/>
												</div>
											</div>
											
											

										</div>
										<div class="form-actions fluid">
											<div class="col-md-offset-3 col-md-9">
												<button type="submit" id="submitBtn" class="btn green">提交</button>
												<button type="button" id="cancelBtn" class="btn default">取消</button>
											</div>
										</div>
									</form>
									<!-- END FORM-->
								</div><!-- END body form-->
						
						
						</div>
					</div>
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
  <!-- BEGIN FOOTER -->
<jsp:include page="../back_common/commonFooter.jsp"></jsp:include>
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
<script type="text/javascript" src="/EBike/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/select2/select2.min.js"></script>
<%-- <script type="text/javascript" src="/EBike/assets/plugins/bootstrap-wysihtml5/wysihtml5-0.3.0.js"></script> --%>
<script type="text/javascript" src="/EBike/assets/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/ckeditor/ckeditor.js"></script>
<%-- <script type="text/javascript" src="/EBike/assets/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/bootstrap-markdown/lib/markdown.js"></script> --%>

<script type="text/javascript" src="/EBike/assets/plugins/fuelux/js/spinner.min.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/jquery.input-ip-address-control-1.0.min.js"></script>
<script src="/EBike/assets/plugins/jquery.pwstrength.bootstrap/src/pwstrength.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/typeahead/handlebars.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/typeahead/typeahead.min.js" type="text/javascript"></script>

<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL STYLES -->
<script src="/EBike/assets/scripts/core/app.js" ></script>
<script src="/EBike/assets/scripts/custom/components-form-tools.js"></script>
<!-- 效验文件自定义实现form-validation.js -->
<script src="/EBike/person/js/form-person-validation.js" ></script>
	

<script type="text/javascript" language="javascript" class="init"> 
	
jQuery(document).ready(function() {   
	
	   	   $("#systemSettingMenu").addClass("active");
	    $("#personManageMenu").addClass("active");
		$("#menu_1").text("系统设置");
	$("#menu_2").text("人员管理");
	
	   /*$('#submitBtn').on( 'click', function () {
	       window.location.href = "/EBike/car/save";
	    } );*/
	   
	   $('#cancelBtn').on( 'click', function () {
	       window.location.href = "/EBike/backendperson/personManagement";
	    } );
	   
	   $('#backBtn').on( 'click', function () {
	       window.location.href = "/EBike/backendperson/personManagement";
	    } );
	   
	   $('#resetBtn').on( 'click', function () {

	    } );
	   
	   App.init();
	   FormValidation.init();
	   ComponentsFormTools.init();
	});

</script>
</body>
</html>