function areagetAll(id,selectid,val){  //以ID来取出省份或者省份下的个数，selectid 是省还是县，val默认选中值
	var url = null;
	if(id==null||id==''){
		url = "/area/getAllProvinces.do";
	}else{
		url = "/area/initByCity.do";
	}
	$.ajax({
		type : "post",
		url : url,
		data : {
			id:id
		},
		dataType : "json",
		timeout : 10000,
		success : function(data) {
			//返回的数据用data.d获取内容v
			if(selectid==null||selectid==''){
				selectid="s1";
			}
			if(val==null||val==''){
				val=0;
			}
			var s1 = $("#"+selectid);
			
			var s = data.allCities;
			$(s).each(function(i,n){
				s1.append("<option value=\""+n.id+"\">"+n.name+"</option>");
			});
			s1.val(val);
		},
		error : function(err) {
			alert("失败!");
		}
	});
}
function changes(){
	$("#s1").bind("change",function(){
		var id = $(this).children('option:selected').val();
		if(id==null||id==''){
			areagetAll();
		}else{
			areagetAll(id,"s2",0);
		}
		$("#s2").html("<option value=\"0\"></option>");
		$("#s3").html("<option value=\"0\"></option>");
	});
	$("#s2").bind("change",function(){
		areagetAll($(this).children('option:selected').val(),"s3",0);
		$("#s3").html("<option value=\"0\"></option>");
	});
	$("#s3").bind("change",function(){
		var id = $(this).children('option:selected').val();
		if(id!=null||id!=''){
			$("#J_Street").attr("disabled",false);
			$("#J_Street").css("background-color","#ffffff");
		}
	});
}
function areagetQuery(id,object,index,select,selectid){
	if(object.length>index){
		if(select==0){
			id=object[index].province;
			selectid = "province"+index;
		}else if(select==1){
			id=object[index].city;
			selectid = "city"+index;
		}else {
			id=object[index].strict;
			selectid = "strict"+index;
		}
	$.ajax({
		type : "post",
		url : "/area/queryByCity.do",
		data : {
			id:id
		},
		dataType : "json",
		timeout : 10000,
		success : function(data) {
			var s1 = $("#"+selectid);
			var s = data.selectedProvince;
			s1.append(s.name);
			select++;
			if(select==3){
				index++;
				select=0;
			}
			areagetQuery(null,object,index,select,null);
		},
		error : function(err) {
			alert("失败!");
		}
	});
	}
}