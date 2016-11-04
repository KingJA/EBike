<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../back_common/taglib.jsp" %>
<!DOCTYPE html>
<jsp:include page="../back_common/ieCompatibility.jsp"></jsp:include>
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>处理用户投诉</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>

<!-- BEGIN PACE PLUGIN FILES -->
<jsp:include page="../back_common/core/pacePluginFiles.jsp"></jsp:include>
<!-- END PACE PLUGIN FILES -->
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<jsp:include page="../back_common/core/globalMandatoryStyles.jsp"></jsp:include>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/select2/select2-metronic.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/jquery-tags-input/jquery.tagsinput.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/typeahead/typeahead.css">
<!-- END PAGE LEVEL STYLES -->

<!-- BEGIN THEME STYLES -->
<jsp:include page="../back_common/core/themeStyles.jsp"></jsp:include>
<!-- END THEME STYLES -->

<!-- 上传文件 -->

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
			
			<!-- 页面主内容 -->
			<!-- END PAGE HEADER-->
			   <div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
						<div class="portlet-body">
						    
								  <div class="portlet">
									<div class="portlet-title">
										<div class="caption">
											<i class="fa fa-shopping-cart"></i>处理用户投诉
										</div>
										<div class="actions btn-set">
											<button type="button" name="back" id="backBtn" class="btn default"><i class="fa fa-angle-left"></i> 返回</button>
											<button class="btn default" id="resetBtn" ><i class="fa fa-reply"></i> 撤销</button> 
										  </div>
									</div>	
								</div>
						  <div class="portlet-body form">
									<form action="/EBike/backendcomplaint/updateComplaint" method="post" id="form_complaint" class="form-horizontal">
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
												<label class="control-label col-md-3">标题
												<span class="required">
													 *
												</span>
												</label>
												<div class="col-md-4">
													<c:out value='${complaint.title}'/>
													<input type="hidden" name="id" value="<c:out value='${complaint.id}'/>"/>
													<input type="hidden" name="status" value="1"/>
												</div>
											</div>
											
											<div class="form-group">
												<label class="control-label col-md-3">内容
												<span class="required">
													 *
												</span>
												</label>
												<div class="col-md-9">
													${complaint.content}
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3">处理结果
												<span class="required">
													 *
												</span>
												</label>
												<div class="col-md-9">
													<input type="text" name="result" value="" maxlength="400"/>
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
<jsp:include page="../back_common/core/corePlugins.jsp"></jsp:include>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="/EBike/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/select2/select2.min.js"></script>

<script type="text/javascript" src="/EBike/assets/plugins/fuelux/js/spinner.min.js"></script>

<script type="text/javascript" src="/EBike/assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>
<%--<script type="text/javascript" src="/EBike/assets/plugins/jquery.input-ip-address-control-1.0.min.js"></script> --%>
<script src="/EBike/assets/plugins/jquery.pwstrength.bootstrap/src/pwstrength.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/typeahead/handlebars.min.js" type="text/javascript"></script>
<script src="/EBike/assets/plugins/typeahead/typeahead.min.js" type="text/javascript"></script>
<!-- dialog -->
<script src="/EBike/assets/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/EBike/assets/scripts/core/app.js" ></script>
<script src="/EBike/assets/plugins/jquery-json/jquery.json-2.4.min.js" ></script>
<script src="/EBike/back_common/js/serializeObjectPlugin.js" ></script>
<script src="/EBike/back_common/js/globalConfigure.js" ></script>
<!-- 效验文件自定义实现form-validation.js -->
<!-- 上传文件 -->

<script type="text/javascript" language="javascript" class="init"> 

jQuery(document).ready(function() {   
	   App.init();
	$("#ebikeManagementMenu").addClass("active");
	$("#complaintManageMenu").addClass("active");
	$("#menu_1").text("电动车管理");
	$("#menu_2").text("投诉管理");
	
	   $('#cancelBtn').on( 'click', function () {
	       window.location.href = "/EBike/backendcomplaint/complaintManagement?activeTab=tab_0";
	    } );
	   
	   $('#backBtn').on( 'click', function () {
	       window.location.href = "/EBike/backendcomplaint/complaintManagement?activeTab=tab_0";
	    } );
	   
	   $('#resetBtn').on( 'click', function () {
	    } );
	   
});

</script>
</body>
</html>