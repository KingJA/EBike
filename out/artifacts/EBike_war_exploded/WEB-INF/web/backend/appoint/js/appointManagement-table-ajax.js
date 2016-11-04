var AppointTableAjax = function() {

	var handleRecords = function() {

		var grid = new Datatable();
		grid.init({
					src : $("#appointManagementTable"),
					onSuccess : function(grid) {

					},
					onError : function(grid) {

					},
					dataTable : {
						"sAjaxDataProp" : "records",
						"sAjaxSource" : appointManagementURL,
						"aoColumns" : [
								{
									"mDataProp" : null,
									"sDefaultContent" : "",
									// "sWidth":"23%",
									bSortable : false,
									"fnRender" : function(oObj) {
										var id = oObj.aData.id;
										return '<input type="checkbox" class="checkboxes" value="1"/>';
									}
								},
								{
									"mDataProp" : "appointTimeStr",
									"sClass" : "center"
								},
								{
									"mDataProp" : "userName",
									"sClass" : "center"
								},
								{
									"mDataProp" : "placeText",
									"sClass" : "center"
								},
								{
									"mDataProp" : "statusText",
									"sClass" : "center"
								},
								{
									"mDataProp" : null,
									// "sWidth":"23%",
									"sDefaultContent" : "",
									bSortable : false,
									"fnRender" : function(oObj) {
										var id = oObj.aData.id;
										var status = oObj.aData.status;
									    var queryParams = id;
										var str ="";
										if(status==0){
											str = '<a name="authAppointBtn" onclick="authAppoint(\''
											    + queryParams
												+ '\')" href="javascript:;" class="btn default btn-sm purple ">'
												+ '<i class="fa fa-edit"></i> 审核   '
												+ '</a>    ';
										}
										return str;
									}
								} ],
						"aaSorting" : [ [ 2, "desc" ] ],
						"aoColumnDefs" : [ {
							'bSortable' : false,
							'aTargets' : [ 0 ]
						}, /*{
							'bSortable' : false,
							"bVisible" : false,
							'aTargets' : [ 2 ]
						}, */{/* "sWidth": "10%",*/
							"bSearchable" : false,
							"aTargets" : [ 0 ]
						}, {
							"bSearchable" : false,
							"aTargets" : [ 1 ]
						} ]
					}
				});

		return grid;
	}

	return {

		init : function() {

			return handleRecords();

		}

	};

}();