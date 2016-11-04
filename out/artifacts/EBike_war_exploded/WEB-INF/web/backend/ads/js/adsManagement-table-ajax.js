var AdsTableAjax = function() {

	var handleRecords = function() {

		var grid = new Datatable();
		grid
				.init({
					src : $("#adsManagementTable"),
					onSuccess : function(grid) {

					},
					onError : function(grid) {

					},
					dataTable : {
						"sAjaxDataProp" : "records",
						"sAjaxSource" : adsManagementURL,
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
									"mDataProp" : null,
									"sDefaultContent" : "",
									// "sWidth":"23%",
									bSortable : false,
									"fnRender" : function(oObj) {
										var adUrl = oObj.aData.adUrl;
										return '<img src="'+adUrl+'" width="100px" height="80px" />';
									}
								},
								{
									"mDataProp" : "adName",
									"sClass" : "center"
								},
								{
									"mDataProp" : "createTimeStr",
									"sClass" : "center"
								},
								{
									"mDataProp" : null,
									// "sWidth":"23%",
									"sDefaultContent" : "",
									bSortable : false,
									"fnRender" : function(oObj) {
										var id = oObj.aData.id;
									    var queryParams = id;
										var str = '<a name="editAdsBtn" onclick="editAds(\''
											    + queryParams
												+ '\')" href="javascript:;" class="btn default btn-sm purple ">'
												+ '<i class="fa fa-edit"></i> 编辑   '
												+ '</a>    '
												+ '<a name="deleteAdsBtn" onclick="deleteAds(\''
												+ queryParams
												+ '\')"  href="javascript:;" class="btn default btn-sm black">'
												+ '<i class="fa fa-trash-o"></i> 删除'
												+ '</a>   ';

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