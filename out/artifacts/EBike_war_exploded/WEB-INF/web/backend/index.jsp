<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@include file="back_common/taglib.jsp" %>
<!DOCTYPE html>
<jsp:include page="back_common/ieCompatibility.jsp"></jsp:include>
<html  class="no-js">
<head>
<meta charset="utf-8"/>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta content="width=device-width, initial-scale=1.0" name="viewport"/>
<meta content="" name="description"/>
<meta content="" name="author"/>

<title>后台管理</title>
<!-- BEGIN PACE PLUGIN FILES -->
<jsp:include page="back_common/core/pacePluginFiles.jsp"></jsp:include>
<!-- END PACE PLUGIN FILES -->
<!-- BEGIN GLOBAL MANDATORY STYLES -->
<jsp:include page="back_common/core/globalMandatoryStyles.jsp"></jsp:include>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/select2/select2.css"/>
<link rel="stylesheet" type="text/css" href="/EBike/assets/plugins/select2/select2-metronic.css"/>
<link rel="stylesheet" href="/EBike/assets/plugins/data-tables/DT_bootstrap.css"/>
<!-- 图片按钮 -->
<link href="/EBike/assets/plugins/fancybox/source/jquery.fancybox.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<jsp:include page="back_common/core/themeStyles.jsp"></jsp:include>
<!-- END THEME STYLES -->
<link rel="shortcut icon" href="/EBike/favicon.ico"/>

<style type="text/css" class="init">
/* div.container {
	width: 100%;
} */
/* 
th,td {
	white-space: nowrap;
}
td.highlight {
	background-color: whitesmoke !important;
}

th,td {
	white-space: nowrap;
}

body { font-size: 140%; } */
</style>

</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed page-sidebar-fixed">
<!-- BEGIN HEADER -->
   <jsp:include page="back_common/bodyHeader.jsp"></jsp:include>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
	<!-- BEGIN SIDEBAR -->
	 <jsp:include page="back_common/sidebar.jsp"></jsp:include>
	<!-- END SIDEBAR -->
	<!-- BEGIN CONTENT -->
	<div class="page-content-wrapper">
		<div class="page-content">
			<!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<div class="modal fade" id="deleteBasic" tabindex="-1" role="basic" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
							<h4 class="modal-title">删除</h4>
						</div>
						<div class="modal-body">
							 确定要删除该条记录吗？
						</div>
						<div class="modal-footer">
							<button type="button" id="cancelBtn" name="cancelBtn"  class="btn default" data-dismiss="modal">取消</button>
							<button type="button" id="okBtn" name="okBtn"  class="btn blue" data-dismiss="modal">确定</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<!-- /.modal -->
			<!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
			<!-- BEGIN STYLE CUSTOMIZER -->
			<jsp:include page="back_common/commonCustomStyle.jsp"></jsp:include>
			<!-- END STYLE CUSTOMIZER -->
			<!-- BEGIN PAGE HEADER-->
			<jsp:include page="back_common/commonAction.jsp"></jsp:include>
			<!-- END PAGE HEADER-->
			<!-- BEGIN PAGE CONTENT-->
			<div class="row">
				<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					
						<div class="portlet-body">
							登录管理员:${adminName}<br/>
							欢迎登录
							<!-- <div class="table-toolbar table-responsive">
								<div class="btn-group">
									<button id="addBtn" class="btn green">
									添加公众账号 <i class="fa fa-plus"></i>
									</button>
								</div>
							</div>
							<table class="table table-striped table-bordered table-advance table-hover" id="sample_1">
							<thead>
							<tr role="row" class="heading">
								<th>id</th>
								<th  width="12%">公众号名称</th>
								<th >会员套餐</th>
								<th >创建时间/到期时间</th>
								<th >已定义/上限</th>
								<th >操作</th>
							</tr>
							</thead>
							<tbody>
								 <c:forEach var="item" items="${pageView.records}">
									<tr class="odd gradeX">
									    <td>
											${item.id}
										</td>
										<td>
										  ${item.accountName}
										</td>
										<td>
											${item.lastUpdate}
										</td>
										<td>
											${item.lastUpdate}
										</td>
										<td>
											${item.lastUpdate}
										</td>
										<td>
											<a name="editBtn" href="javascript:;" class="btn default btn-sm purple ">
												<i class="fa fa-edit"></i> 编辑
											</a>
											<a name="deleteBtn" href="javascript:;" class="btn default btn-sm black">
												<i class="fa fa-trash-o"></i> 删除
											</a>
											<a name="managerBtn" href="javascript:;" class="btn default btn-sm black">
												<span class="glyphicon glyphicon-cog">
												</span> 管理
											</a>
										</td>
									</tr>
								 </c:forEach>
							</tbody>
							</table> -->
						</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>
			</div>
			
			<!-- END PAGE CONTENT-->
		</div>
	</div>
	<!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<jsp:include page="back_common/commonFooter.jsp"></jsp:include>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<jsp:include page="back_common/core/corePlugins.jsp"></jsp:include>
<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script type="text/javascript" src="/EBike/assets/plugins/select2/select2.min.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/data-tables/jquery.dataTables.js"></script>
<script type="text/javascript" src="/EBike/assets/plugins/data-tables/DT_bootstrap.js"></script>
<!-- dialog -->
<script src="/EBike/assets/plugins/bootbox/bootbox.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script type="text/javascript" src="/EBike/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<!-- 图片按钮 -->
<script type="text/javascript" src="/EBike/assets/plugins/fancybox/source/jquery.fancybox.pack.js"></script>
<script src="/EBike/assets/scripts/core/app.js"></script>
<script src="/EBike/assets/scripts/custom/search.js"></script>
<script>
//var oTable;
jQuery(document).ready(function() {     
	
	//$("#individualCenterMenu").addClass("active");
	//$("#publicNoManagementMenu").addClass("active");
	$("#menu_1").text("欢迎界面");
	$("#menu_2").text("");
    App.init();
   // oTable =  TableManaged.init();
    
   /* $("#sample_1 tbody tr").click( function( e ) {
        if ( $(this).hasClass('active') ) {
            $(this).removeClass('active');
        }
        else {
            oTable.$('tr.active').removeClass('active');
            $(this).addClass('active');
        } 
    });
     
    $('a[name=editBtn]').click(function(){
    	var $tr = $(this).parent().parent();
    	$tr.trigger("click");
    	
    	var aData = oTable.fnGetData($tr[0]); 
        if (null != aData)  
        {
        	 window.location.href = "/EBike/microPlatform/publicNoManagement/edit?id="+aData[0];
        }
    	
    });
    
     $('a[name=managerBtn]').click(function(){
    	var $tr = $(this).parent().parent();
    	$tr.trigger("click");
    	
    	var aData = oTable.fnGetData($tr[0]); 
        if (null != aData)  
        {
        	 window.location.href = "/EBike/microPlatform/microPlatformManager?id="+aData[0];
        }
    	
    });
    
    
    $('#addBtn').on( 'click', function () {
	       window.location.href = "/EBike/microPlatform/publicNoManagement/add";
	    } );
    
    $('a[name=deleteBtn]').click(function(){
    	var $tr = $(this).parent().parent();
    	$tr.trigger("click");
    	
    	
    	var aData = oTable.fnGetData($tr[0]); 
        if (null != aData)  
        {
        	 bootbox.dialog({
        		 message: "确定要删除这条记录吗?",
                 //title: "Custom title",
                 buttons: {
                  main: {
                     label: "取消",
                     //className: "green",
                     callback: function() {
                       //alert("great success");
                     }
                   },
                   success: {
                     label: "确定",
                     //className: "red",
                     callback: function() {
                    	 window.location.href = "/EBike/microPlatform/publicNoManagement/delete?id="+aData[0];
                     }
                   }
                 }
             });
        	 
        }
    	
    });*/
});
/*
function fnGetSelected( oTableLocal )
{
    return oTableLocal.$('tr.active');
}*/
</script>
</body>
<!-- END BODY -->
</html>