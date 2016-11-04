<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=1.0" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>选号</title>
<link rel="stylesheet" type="text/css" href="/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/frontend/css/index.css">
<script type="text/javascript" src="/frontend/js/Adaptive.js"></script>
</head>

<body>

<header>
	<a class="large button blue" style="float:left" onclick="history.go(-1)">返回</a>
</header>

<div id="_contain">

<div class="name">
	<p>电动车可选车牌列表</p>
</div>

<div class="favorable">
<c:forEach items="${carNumbers}" var="carNumber" >
<div class="fa">
    <div class="fa-lt">
        <p class="fb-name"><span style="font-size: 18px">${carNumber.carNum }<a class="medium button orange" style="float:right" onclick="selectNumber('${carNumber}','${carNumber.carNum }')">选择</a></span></p>
    </div>
</div>
</c:forEach>

</div>
 
<div class="more">
	<input type="hidden" id="carNumberPage" value="${page }" />
	<p id="loadMore">查看更多<img src="/frontend/images/icon/arr-right.png"></p>
</div>    

</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/frontend/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
function selectNumber(id,carNum){
	if(confirm("确认选择"+carNum+"当作您的车牌号码吗?")){
		$.ajax({  
               type : 'POST',  
               url :"/carNumber/updateCarNumber" ,
               data:{"id" : id} ,
               dataType : 'json', 
               async : false,  //同步
               success : function(data) {
               		if(data.code==1){
						alert("选择成功");
						window.location.href="/index";
					}else{
						alert(data.msg);
					}
               },  
               error : function() {  
                  //serverError3.show();
               }  
       	}); 
	}
}
	$(".more").click(function(){
		$.ajax({  
               type : 'POST',  
               url :"/carNumber/loadCarNumbers" ,
               data:{"page" : $("#carNumberPage").val()} ,
               dataType : 'json', 
               async : false,  //同步
               success : function(data) {
               		if(data.code==1){
	               		for(i=0;i<data.res.length;i++){
							$(".favorable").append('<div class="fa">'
													+'<div class="fa-lt">'
													+'<p class="fb-name">'+data.res[i].carNum+' <a class="large button orange" onclick="selectNumber(\"'+data.res[i].id+'\",\"'+data.res[i].carNum+'\")"  style="float:right">选择</a></p>'
													+'</div></div>');
						}
						var newPage = $("#carNumberPage").val()+1;
						$("#carNumberPage").val(newPage);
					}else{
						$("#loadMore").html("没有更多信息了");
						$(".more").onclick = "";
					}
               },  
               error : function() {  
                  //serverError3.show();
               }  
       	});   
	
	});
</script>
</body>
</html>
