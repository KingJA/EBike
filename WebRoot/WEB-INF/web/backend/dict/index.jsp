<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="../back_common/taglib.jsp" %>
<!DOCTYPE html>
<jsp:include page="../back_common/ieCompatibility.jsp"></jsp:include>
<html>
<head>
<meta charset="utf-8">
<link rel="shortcut icon" type="image/ico"
	href="http://www.datatables.net/favicon.ico">
<meta name="viewport" content="initial-scale=1.0, maximum-scale=2.0">
<title>字典管理</title>

<!-- BEGIN GLOBAL MANDATORY STYLES -->
<link href="/assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="/assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="/assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="/assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="/assets/plugins/select2/select2-metronic.css"/>
<link rel="stylesheet" href="/assets/plugins/data-tables/DT_bootstrap.css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="/assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
<link href="/assets/css/style.css" rel="stylesheet" type="text/css"/>
<link href="/assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
<link href="/assets/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="/assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
<link href="/assets/css/custom.css" rel="stylesheet" type="text/css"/>

<!-- table style -->
 <link rel="stylesheet" type="text/css"
	href="/assets/plugins/dataTables/resources/syntax/shCore.css">
<link rel="stylesheet" type="text/css"
	href="/assets/plugins/dataTables/media/css/jquery.dataTables.css">

<style type="text/css">
.content {
	margin-left: 200px;
}

.type {
	float: left;
	margin-left: -200px;
	width: 155px;
	padding: 20px 20px;
	border: 1px solid #eee;
	height: 100%;
}
.type ul{
	list-style-type: none;
	text-align: left
}
.type li {
	cursor: pointer;
	line-height: 30px;
	font-size: 14px;
	text-align: left;
}

.type li a {
	color: #333;
	display: block;
	height: 30px;
	width: 100%;
}

.type li a:hover {
	color: #fff;
	background: #7fd4f1;
	text-decoration: none;
}

.type li a.cur {
	color: #fff;
	background: #00A8E8;
	text-decoration: none;
}

.data {
	width: 100%;
}
.error{
	border: 1px solid red;
}
</style>


</head>

<!-- BEGIN BODY -->
<body class="page-header-fixed ">
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
			   <div id="container" style="margin-top:-20px;">
			<div class="title" style="text-align: center;">
							<h2>数据字典管理</h2>
						</div>
				<div class="mainwrap fr">
					<div class="mTop"></div>
					<div class="main">
						
						<div class="tabAreaList">
							<div class="content">
								<div class="type" style=" height: 300px;overflow: auto; width: 200px;">
									<ul>
										<c:forEach items="${dicts}" var="item">
											<li><a href="javascript:ajaxt(<c:out value='${item.id}' />);"><c:out
														value='${item.dictName}' /></a></li>
										</c:forEach>
									</ul>
								</div>
								<div class="data" style="margin-left: 10px;">
									<table width="100%" border="0" cellspacing="0" cellpadding="0"
										class=" uk-form uk-margin uk-form-controls ">
										<tr>
											<td colspan="4">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0"
													class="listTab   uk-table uk-table-hover uk-table-striped">
													<thead style="background-color:#DDDDDD ">
														<th width="30%" height="30px">
															<div align="center">
																<strong>编号</strong>
															</div>
														</th>
														<th width="50%">
															<div align="center">
																<strong>值</strong>
															</div>
														</th>
														<th width="20%">
															<div align="center">
																<strong>操作</strong>
															</div>
														</th>
													</thead>
													<tbody id="tbobyCenter">
													
													</tbody>
												</table>
											</td>
										</tr>
									</table>
									<hr>
									<div style="margin-left: 20px;margin-top: 20px">
									
									<form id="mform" name="modifyform" method="post"
										>
										<input type="hidden" name="id" id="dicId"
											value="<c:out value='${dicData.id}' />" /> <input
											type="hidden" name="categoryId" id="dictId"
											value="<c:out value='${dictId}' />" />
										<table class="wwFormTable">
											<table width="50%" border="0" cellspacing="0" cellpadding="0"
												class="waikuan  uk-form uk-margin uk-form-controls">
												<tr height="50px">
													<td class="ziduan"><label class="n1">编码：</label></td>
													<td class="tian"><input type="text" id="dicCode"
														name="code" onfocus="removeClass();"
														value="<c:out value='${dicData.code}' />" id="key"
														class="span-4" /></td>
												</tr>
												<tr height="30px">
													<td class="ziduan"><label class="n1">值：</label></td>
													<td class="tian"><input name="dictDesc" id="dicName"
															id="value" style="width: 100%;" value="<c:out value='${dicData.dictDesc}' />" />
															
														</td>
												</tr>
												
												<tr height="30px">
													<td></td>
													<td><input type="button"  id="submitVal"
														class="uk-button uk-button-primary" value="保存" /></td>
												</tr>
											</table>
										</table>
									</form>
</div>
								</div>
							</div>
						</div>
						<div class="mBottom"></div>
					</div>
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
<script src="/assets/plugins/jquery-1.11.0.min.js" type="text/javascript"></script>
<script src="/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="/assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="/assets/plugins/data-tables/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="/assets/plugins/data-tables/DT_bootstrap.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<!-- 冲突 -->
<script src="/assets/scripts/core/app.js"></script>

 <script type="text/javascript" language="javascript"
	src="/assets/plugins/dataTables/media/js/jquery.js"></script>
 <script type="text/javascript" language="javascript"
	src="/assets/plugins/dataTables/media/js/jquery.dataTables.js"></script>
<script type="text/javascript" language="javascript"
	src="/assets/plugins/dataTables/resources/syntax/shCore.js"></script>
 <script type="text/javascript" language="javascript"
	src="/assets/plugins/dataTables/resources/demo.js"></script>
	
<%-- <script type="text/javascript" language="javascript"
	src="/assets/plugins/dataTables/resources/foundation/dataTables.foundation.js"></script> --%>
<!-- <script type="text/javascript" language="javascript"
	src="assets/plugins/dataTables/extensions/ColReorder/js/dataTables.colReorder.js"></script> -->
<!-- <script type="text/javascript" language="javascript" src="assets/plugins/dataTables/extensions/ColVis/js/dataTables.colVis.js"></script> -->
<!-- <script type="text/javascript" language="javascript"
	src="assets/plugins/dataTables/extensions/FixedColumns/js/dataTables.fixedColumns.js"></script> -->
<!-- <script type="text/javascript" language="javascript" src="assets/plugins/dataTables/extensions/KeyTable/js/dataTables.keyTable.js"></script> -->
<%-- <script type="text/javascript" language="javascript"
	src="/assets/plugins/dataTables/extensions/TableTools/js/dataTables.tableTools.js"></script> --%>
<!-- <script type="text/javascript" language="javascript" src="assets/plugins/dataTables/plugIn/scrolling.js"></script> -->
	

<script type="text/javascript" language="javascript" class="init"> 

$(document).ready(function() {
	
	$("#systemSettingMenu").addClass("active");
	$("#dictManageMenu").addClass("active");
	$("#menu_1").text("系统设置");
	$("#menu_2").text("字典管理");
} ); 
jQuery(function () {
		ajaxt($("#dictId").val());
		jQuery("#submitVal").click(function () {
			if(jQuery("#key").val()==""){
				//alert("请填写编码！");
				jQuery("#key").addClass("error");
				return false;
			}
			$.ajax({
				url : "/backenddict/save",
				data : $("#mform").serialize(),
				type : "POST",
				dataType : 'json',
				async : false, //同步
				success : function(data) {
					var jsonData = eval(data);
					$("#tbobyCenter").text("");
					$.each(jsonData,function(i, e) {
						$("#tbobyCenter").append("<tr height='30px' id='tes_"+e['id']+"'><td><div align='center'>"+e['code']+"</div></td>"
						+"<td><div align='center'>"+e['dictDesc']+"</div></td>"
						+"<td><div align='center'><a href='#' onclick='updates("+e['id']+");'"
						+"class='do_edit' target='_parent'> <i class='uk-icon-pencil'></i> 修改</a>"
						+"<a href='#' onclick='deleteItem("+e['id']+");'"
						+"class='do_del' target='_parent'> <i class='uk-icon-minus-sign'></i> 删除</a></div></td>");
					});
						
				},
				error : function() {
					//serverError3.show();
				}
			});
			$("#dicId").val("");
			$("#dicCode").val("");
			$("#dicName").val("");
		});
		 App.init();
	});
	function removeClass(){
		jQuery("#key").removeClass("error");
	}
	function ajaxt(id){
		$.ajax({
				url : "/backenddict/search?dictId="+id,
				//data : $("#mform").serialize(),
				type : "POST",
				dataType : 'json',
				async : false, //同步
				success : function(data) {
					var jsonData = eval(data);
					$("#tbobyCenter").text("");
					$.each(jsonData,function(i, e) {
						$("#tbobyCenter").append("<tr height='30px' id='tes_"+e['id']+"'><td><div align='center'>"+e['code']+"</div></td>"
						+"<td><div align='center'>"+e['dictDesc']+"</div></td>"
						+"<td><div align='center'><a href='#' onclick='updates("+e['id']+");'"
						+"class='do_edit' target='_parent'> <i class='uk-icon-pencil'></i> 修改</a>"
						+"<a href='#' onclick='deleteItem("+e['id']+");'"
						+"class='do_del' target='_parent'> <i class='uk-icon-minus-sign'></i> 删除</a></div></td>");
					});
				},
				error : function() {
					//serverError3.show();
				}
			});
			$("#dicId").val("");
			$("#dictId").val(""+id);
			$("#dicCode").val("");
			$("#dicName").val("");
	}
	function updates(id){
		$.ajax({
				url : "/backenddict/updates?id="+id,
				//data : $("#mform").serialize(),
				type : "POST",
				dataType : 'json',
				async : false, //同步
				success : function(data) {
					//var jsonData = eval(data);
					data = eval(data);
					$.each(data,function(i, e) {
						$("#dicId").val(""+e['id']);
						$("#dictId").val(""+e['categoryId']);
						$("#dicCode").val(""+e['code']);
						$("#dicName").val(""+e['dictDesc']);
					});
				},
				error : function() {
					//serverError3.show();
				}
			});
	}
	function deleteItem(id){
		if(confirm('确定删除么？')){
			$.ajax({
				url : "/backenddict/delete?id="+id,
				//data : $("#mform").serialize(),
				type : "POST",
				dataType : 'json',
				async : false, //同步
				success : function(data) {
					data = eval(data);
					$.each(data,function(i, e) {
						if(e['success']==1){
							$("#tes_"+id).remove();
						}
					});					
				}
			});
		}
	}
</script>
</body>
</html>