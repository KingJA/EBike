
var Datatable = function () {

    var tableOptions;  // main options
    var dataTable; // datatable object
    var table;    // actual table jquery object
    var tableContainer;    // actual table container object
    var tableWrapper; // actual table wrapper jquery object
    var tableInitialized = false;
    var ajaxParams = []; // set filter mode
    
    var countSelectedRecords = function() {
        var selected = $('tbody > tr > td:nth-child(1) input[type="checkbox"]:checked', table).size();
        var text = tableOptions.dataTable.oLanguage.sGroupActions;
        if (selected > 0) {
            $('.table-group-actions > span', tableWrapper).text(text.replace("_TOTAL_", selected));
        } else {
            $('.table-group-actions > span', tableWrapper).text("");
        }
    }
    

	function fnSetKey(aoData, sKey, mValue) {
		for ( var i = 0, iLen = aoData.length; i < iLen; i++) {
			if (aoData[i].name == sKey) {
				aoData[i].value = mValue;
			}
		}
	}

	function fnGetKey(aoData, sKey) {
		for ( var i = 0, iLen = aoData.length; i < iLen; i++) {
			if (aoData[i].name == sKey) {
				return aoData[i].value;
			}
		}
		return null;
	}

    return {

        // main function to initiate the module
        init: function (options) {
            
            if (!$().dataTable) {
                return;
            }

            var the = this;

            // default settings
            options = $.extend(true, {
                src: "",  // actual table 
                filterApplyAction: "filter",
                filterCancelAction: "filter_cancel",
                resetGroupActionInputOnSuccess: true,
                dataTable: {
                    //"sDom" : "<'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'<'table-group-actions pull-right'>>r><'table-scrollable't><'row'<'col-md-8 col-sm-12'pli><'col-md-4 col-sm-12'>r>>", // datatable layout
                    
                	"aLengthMenu": [
                                    [5, 15, 20],
                                    [5, 15, 20] 
                                ],
                    "iDisplayLength": 5,
                    "oLanguage": { 
                        "sProcessing": '<img src="../assets/img/loading-spinner-grey.gif"/><span>&nbsp;&nbsp;加载中...</span>',
                       // "sLengthMenu": "<span class='seperator'>|</span>View _MENU_ records",
                        "sLengthMenu": "每页显示 _MENU_ 条记录",
                        //"sInfo": "<span class='seperator'>|</span>Found total _TOTAL_ records",
                        "sInfo": "当前数据为从第 _START_ 到第 _END_ 条数据 ",
                       // "sInfoEmpty": "No records found to show",
                        "sInfoEmtpy": "显示 0 至 0 共 0 条",
                        "sSearch": "搜索:", 
                        "sInfoFiltered": "(总共有 _MAX_ 条记录)",
                        "sUrl": "",
                        "sGroupActions": "_TOTAL_ records selected:  ",
                        "sAjaxRequestGeneralError": "无法完成请求。请检查您的网络连接",
                        "sEmptyTable":  "表格中没有可用数据",
                        "sZeroRecords": "没有检索到数据",
                        "oPaginate": {
                		    "sFirst": "首页",
                		    "sPrevious": "前页",
                		    "sNext": "后页",
                		    "sLast": "尾页"/*,
                		    "sPage": "Page",
                            "sPageOf": "of"*/
                		}
                    },
                    "bSort": true,
                    "aoColumnDefs" : [{  // define columns sorting options(by default all columns are sortable extept the first checkbox column)
                        'bSortable' : false,//禁用单列排序
                        'aTargets' : [ 0 ]
                    }],
                    "bPaginate" : true, //是否显示（应用）分页器  
                    "bAutoWidth": false,   // disable fixed width and enable fluid table
                    "bSortCellsTop": true, // make sortable only the first row in thead
                    "sPaginationType": "bootstrap_full_number", // pagination type(bootstrap, bootstrap_full_number or bootstrap_extended)
                    "bProcessing": true, // enable/disable display message box on record load
                    "bServerSide": true, // enable/disable server side ajax loading
                    "sAjaxSource": "", // define ajax source URL 
                    "sServerMethod": "POST",
                    "aaSorting": [[ 1, "desc" ]] ,
                    "fnServerData": function ( sSource, aoData, fnCallback, oSettings ) {
                    	
                    	var aDataSet = {};
                    	var sEcho = fnGetKey(aoData, "sEcho");
                        var iDisplayStart = fnGetKey(aoData, "iDisplayStart");
                        var iDisplayLength = fnGetKey(aoData, "iDisplayLength");
                        var aaSorting = fnGetKey(aoData, "aaSorting");
                        
                        var pageIndex = iDisplayStart / iDisplayLength + 1;
                        var pageSize = iDisplayLength;
                        var pageNow = iDisplayStart/iDisplayLength+1;  
                        
                        aDataSet.sEcho = sEcho;
                        aDataSet.pageSize = pageSize;
                        aDataSet.pageNow = pageNow;
                        
                      oSettings.jqXHR = $.ajax( {
                        "dataType": 'json',
                        "type": "POST",
                        "url": sSource,
                        "data": aDataSet,
                        "success": function(res, textStatus, jqXHR) {
                            if (res.sMessage) {
                                App.alert({type: (res.sStatus == 'OK' ? 'success' : 'danger'), icon: (res.sStatus == 'OK' ? 'check' : 'warning'), message: res.sMessage, container: tableWrapper, place: 'prepend'});
                            } 
                            if (res.sStatus) {
                                if (tableOptions.resetGroupActionInputOnSuccess) {
                                    $('.table-group-action-input', tableWrapper).val("");
                                }
                            }
                            if ($('.group-checkable', table).size() === 1) {
                                $('.group-checkable', table).attr("checked", false);
                                $.uniform.update($('.group-checkable', table));
                            }
                            if (tableOptions.onSuccess) {
                                tableOptions.onSuccess.call(the);
                            }
                            fnCallback(res, textStatus, jqXHR);
                        },
                        "error": function() {
                            if (tableOptions.onError) {
                                tableOptions.onError.call(the);
                            }
                            App.alert({type: 'danger', icon: 'warning', message: tableOptions.dataTable.oLanguage.sAjaxRequestGeneralError, container: tableWrapper, place: 'prepend'});
                            $('.dataTables_processing', tableWrapper).remove();
                        }
                      } );
                    },

                    // pass additional parameter
                    "fnServerParams": function ( aoData ) {
                        //here can be added an external ajax request parameters.
                        for(var i in ajaxParams) {
                            var param = ajaxParams[i];
                            aoData.push({"name" : param.name, "value": param.value});
                        }
                    },
                   
                    "fnDrawCallback": function( oSettings ) { // run some code on table redraw
                        if (tableInitialized === false) { // check if table has been initialized
                            tableInitialized = true; // set table initialized
                            table.show(); // display table
                        }
                        App.initUniform($('input[type="checkbox"]', table));  // reinitialize uniform checkboxes on each table reload
                        countSelectedRecords(); // reset selected records indicator
                    }
                }
            }, options);

            tableOptions = options;
                       
            table = $(options.src);
            tableContainer = table.parents(".table-container");

            //注释,此处不用扩展类dataTables_extended_wrapper
            //$.fn.dataTableExt.oStdClasses.sWrapper = $.fn.dataTableExt.oStdClasses.sWrapper + " dataTables_extended_wrapper";

            // initialize a datatable
            dataTable = table.dataTable(options.dataTable);
    
            tableWrapper = table.parents('.dataTables_wrapper');

            // modify table per page dropdown input by appliying some classes
            //注释,不用扩展类，使用原本非ajax的样式
           // $('.dataTables_length select', tableWrapper).addClass("form-control input-xsmall input-sm");
            $('.dataTables_filter input', tableWrapper).addClass("form-control input-medium input-inline"); // modify table search input
            $('.dataTables_length select', tableWrapper).addClass("form-control input-xsmall input-sm"); // modify table per page dropdown
            $('.dataTables_length select', tableWrapper).select2(); // initialize select2 dropdown

            // build table group actions panel
            if ($('.table-actions-wrapper', tableContainer).size() === 1) {
                $('.table-group-actions', tableWrapper).html($('.table-actions-wrapper', tableContainer).html()); // place the panel inside the wrapper
                $('.table-actions-wrapper', tableContainer).remove(); // remove the template container
            }
            // handle group checkboxes check/uncheck
            /*$('.group-checkable', table).change(function () {
                var set = $('tbody > tr > td:nth-child(1) input[type="checkbox"]', table);
                var checked = $(this).is(":checked");
                $(set).each(function () {
                    $(this).attr("checked", checked);
                });
                $.uniform.update(set);
                countSelectedRecords();
            });*/
            
            $('.group-checkable', table).change(function () {
                var set = jQuery(this).attr("data-set");
                var checked = jQuery(this).is(":checked");
                jQuery(set).each(function () {
                    if (checked) {
                        $(this).attr("checked", true);
                        $(this).parents('tr').addClass("active");
                    } else {
                        $(this).attr("checked", false);
                        $(this).parents('tr').removeClass("active");
                    }
                });
                $.uniform.update(set);
            });

            // handle row's checkbox click
            table.on('change', 'tbody > tr > td:nth-child(1) input[type="checkbox"]', function(){
                countSelectedRecords();
            });

        },

        getSelectedRowsCount: function() {
            return $('tbody > tr > td:nth-child(1) input[type="checkbox"]:checked', table).size();
        },

        getSelectedRows: function() {
            var rows = [];
            $('tbody > tr > td:nth-child(1) input[type="checkbox"]:checked', table).each(function(){
                rows.push({name: $(this).attr("name"), value: $(this).val()});
            });

            return rows;
        },

        addAjaxParam: function(name, value) {
           ajaxParams.push({"name": name, "value": value});
        },

        clearAjaxParams: function(name, value) {
           ajaxParams = [];
        },

        getDataTable: function() {
            return dataTable;
        },

        getTableWrapper: function() {
            return tableWrapper;
        }, 

        gettableContainer: function() {
            return tableContainer;
        }, 

        getTable: function() {
            return table;
        }        

    };

};