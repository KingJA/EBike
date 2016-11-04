//var json =  $("#testform").serializeJson();//
(function($) {
	$.fn.serializeJson = function() {
		var serializeObj = {};
		var array = this.serializeArray();
		var str = this.serialize();
		$(array).each(
				function() {
					if (serializeObj[this.name]) {
						if ($.isArray(serializeObj[this.name])) {
							serializeObj[this.name].push(this.value);
						} else {
							serializeObj[this.name] = [
									serializeObj[this.name], this.value ];
						}
					} else {
						serializeObj[this.name] = this.value;
					}
				});
		return serializeObj;
	};
})(jQuery);




//var json = $("#testform").form2json();
(function($) {
	function paramString2obj (serializedParams) {
		
		var obj={};
		function evalThem (str) {
			var attributeName = str.split("=")[0];
			var attributeValue = str.split("=")[1];
			if(!attributeValue){
				return ;
			}
			
			var array = attributeName.split(".");
			for (var i = 1; i < array.length; i++) {
				var tmpArray = Array();
				tmpArray.push("obj");
				for (var j = 0; j < i; j++) {
					tmpArray.push(array[j]);
				};
				var evalString = tmpArray.join(".");
				if(!eval(evalString)){
					eval(evalString+"={};");				
				}
			};
	    
			eval("obj."+attributeName+"='"+attributeValue+"';");
			
		};
	
		var properties = serializedParams.split("&");
		for (var i = 0; i < properties.length; i++) {
			evalThem(properties[i]);
		};
	
		return obj;
	}
	
	
	$.fn.form2json = function(){
		var serializedParams = this.serialize();
		var obj = paramString2obj(serializedParams);
		return JSON.stringify(obj);
	}

})(jQuery);


(function() {

   //http://localhost:8081/
   jQuery.getWebPath = function(){
	    //获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
	    var curWwwPath=window.document.location.href;
	    //获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
	    var pathName=window.document.location.pathname;
	    var pos=curWwwPath.indexOf(pathName);
	    //获取主机地址，如： http://localhost:8083
	    var localhostPaht=curWwwPath.substring(0,pos);
	    //获取带"/"的项目名，如：/uimcardprj
	    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
	    return(localhostPaht+projectName);

	}

})();



