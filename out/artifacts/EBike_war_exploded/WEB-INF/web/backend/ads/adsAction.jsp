<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../back_common/taglib.jsp" %>
<!DOCTYPE html>
<jsp:include page="../back_common/ieCompatibility.jsp"></jsp:include>
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
<meta charset="utf-8"/>
<title>添加/修改</title>
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
<link rel="stylesheet" type="text/css" href="/assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="/assets/plugins/select2/select2-metronic.css"/>
<link rel="stylesheet" type="text/css" href="/assets/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>
<link rel="stylesheet" type="text/css" href="/assets/plugins/bootstrap-switch/css/bootstrap-switch.min.css"/>
<link rel="stylesheet" type="text/css" href="/assets/plugins/jquery-tags-input/jquery.tagsinput.css"/>
<link rel="stylesheet" type="text/css" href="/assets/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet" type="text/css" href="/assets/plugins/typeahead/typeahead.css">
<!-- END PAGE LEVEL STYLES -->

<!-- BEGIN THEME STYLES -->
<jsp:include page="../back_common/core/themeStyles.jsp"></jsp:include>
<!-- END THEME STYLES -->

<!-- 上传文件 -->
<link rel="stylesheet" type="text/css" href="/kindeditor/themes/default/default.css">

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
											<i class="fa fa-shopping-cart"></i><c:if test="${doType=='add'}"> 添加</c:if><c:if test="${doType=='edit'}"> 修改</c:if>
										</div>
										<div class="actions btn-set">
											<button type="button" name="back" id="backBtn" class="btn default"><i class="fa fa-angle-left"></i> 返回</button>
											<button class="btn default" id="resetBtn" ><i class="fa fa-reply"></i> 撤销</button> 
										  </div>
									</div>	
								</div>
						  <div class="portlet-body form">
									<form <c:if test="${doType eq 'add'}">action="/backendads/saveAds"</c:if>  <c:if test="${doType eq 'edit'}">action="/backendads/updateAds"</c:if> method="post" id="form_ads" class="form-horizontal">
									    <input type="hidden" name="id"  value="${ads.id}"/>
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
												<label class="control-label col-md-3">广告名称
												<span class="required">
													 *
												</span>
												</label>
												<div class="col-md-4">
													<input type="text" name="adName" data-required="1" class="form-control" value="<c:out value='${ads.adName}'/>" />
													<input type="hidden" name="id" value="<c:out value='${ads.id}'/>"/>
												</div>
											</div>
											<div class="form-group">
												<label class="control-label col-md-3">图片&nbsp;&nbsp;</label>
												<div class="col-md-9">
													<div class="fileinput fileinput-new" data-provides="fileinput">
														<div class="fileinput-new thumbnail" style="width: 200px; height: 150px;">
															<c:if test="${doType eq 'add'}"><img  class="thumb_img" src="http://www.placehold.it/200x150/EFEFEF/AAAAAA&amp;text=no+image" alt=""/></c:if> 
														    <c:if test="${doType eq 'edit'}"><img  class="thumb_img" src="${ads.adUrl}" alt=""/></c:if>
															<input id="adUrl" type="text" name="adUrl" class="hide" value="${ads.adUrl}" style="display: none; ">
														</div>
														<div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;">
														</div>
													       <span class="help-inline">
					                                            <button class="btn select_img green" type="button" >选择图片</button>
																<span class="help-inline">建议尺寸：宽1242像素，高660像素,图片大小不要超过2MB</span>
					                                        </span>
													  </div>
													<div class="clearfix margin-top-10">
														<span class="label label-danger">
															 备注!
														</span>
														 图像预览只能在IE10 +，ff3.6 +，safari6.0 +，chrome6.0 +和opera11.1 +。在较旧的浏览器中不支持。
													</div>
												</div>
											</div>
											<!-- <div class="form-group">
												<label class="control-label col-md-3">链接
												<span class="required">
													 *
												</span>
												</label> 
												<div class="col-md-4">
													<input type="text" id="imageLink" name="imageLink" value="${ads.imageLink}" data-required="1" class="form-control"/>
												</div>
											</div> -->
											
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
<script type="text/javascript" src="/assets/plugins/jquery-validation/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="/assets/plugins/jquery-validation/dist/additional-methods.min.js"></script>
<script type="text/javascript" src="/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/ckfinder/ckfinder.js"></script>

<script type="text/javascript" src="/assets/plugins/fuelux/js/spinner.min.js"></script>

<script type="text/javascript" src="/assets/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>
<%--<script type="text/javascript" src="/assets/plugins/jquery.input-ip-address-control-1.0.min.js"></script> --%>
<script src="/assets/plugins/jquery.pwstrength.bootstrap/src/pwstrength.js" type="text/javascript"></script>
<script src="/assets/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="/assets/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript"></script>
<script src="/assets/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>
<script src="/assets/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>
<script src="/assets/plugins/typeahead/handlebars.min.js" type="text/javascript"></script>
<script src="/assets/plugins/typeahead/typeahead.min.js" type="text/javascript"></script>
<!-- dialog -->
<script src="/assets/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->

<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="/assets/scripts/core/app.js" ></script>
<script src="/assets/plugins/jquery-json/jquery.json-2.4.min.js" ></script>
<script src="/back_common/js/serializeObjectPlugin.js" ></script>
<script src="/back_common/js/globalConfigure.js" ></script>
<!-- 效验文件自定义实现form-validation.js -->
<script src="/backend/ads/js/form-ads-validation.js" ></script>
<!-- 上传文件 -->
<script src="/kindeditor/kindeditor.js"></script>
<script src="/kindeditor/lang/zh_CN.js"></script>

<script type="text/javascript" language="javascript" class="init"> 
var ckEditor; //定义全局变量 ckeditor

jQuery(document).ready(function() {   
	   App.init();
	   FormValidation.init();//"/shortCut/microStationDecoration?activeTab=tab_0"
	   $("#systemSettingMenu").addClass("active");
	   $("#adManageMenu").addClass("active");
	   $("#menu_1").text("系统设置");
	   $("#menu_2").text("广告管理");
	
	   $('#cancelBtn').on( 'click', function () {
	       window.location.href = "/backendads/adsManagement?activeTab=tab_0";
	    } );
	   
	   $('#backBtn').on( 'click', function () {
	       window.location.href = "/backendads/adsManagement?activeTab=tab_0";
	    } );
	   
	   $('#resetBtn').on( 'click', function () {
              $('#adsForm')[0].reset();
	    } );
	
	
	    KindEditor.ready(function (K) {
			var editor = K.editor({
				themeType: "simple",
				allowFileManager: true
	
			});
			K('button.select_img').click(function (e) {
				editor.loadPlugin('image', function () {
					editor.plugin.imageDialog({
						imageUrl: $(e.target).parent().parent().find("input[type=text]").val(),
						clickFn: function (url, title, width, height, border, align) {
							var $input = $(e.target).parent().parent().find("input[type=text]")
							$input.val(url)
							$input.hide();
							var t_img = $(e.target).parent().parent().find(".thumb_img:first");
							if (t_img.length == 0) {
								var tmp = '<img class="thumb_img" src="{0}" style="max-height: 100px;">';
								$input.before(tmp.format(url))
							} else {
								t_img.attr("src", url);
							}
	
							editor.hideDialog();
						}
					});
				});
			});
		});
	     
});

</script>
</body>
</html>