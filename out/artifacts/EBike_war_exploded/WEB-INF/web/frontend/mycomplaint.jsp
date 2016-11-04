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
<title>我的投诉</title>
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/style.css">
<link rel="stylesheet" type="text/css" href="/EBike/frontend/css/index.css">
<script type="text/javascript" src="/EBike/frontend/js/Adaptive.js"></script>
</head>

<body>

<header>
	<i class="logo"></i>
    <!-- <a href="#">
    <div class="sch">
    	<p><img src="/EBike/frontend/images/icon/sch.png">搜索目的地、帖子、景点</p>
    </div>
    </a> -->
    <a class="large button blue" style="float:right" href="javascript:void(0)" onclick="window.location.href='/EBike/newComplaint'">+ 投诉</a>
</header>

<div id="_contain">

<div class="name">
	<p>我的投诉</p>
</div>

<div class="favorable">
	<c:forEach items="#{complaints}" var="complaint">
		<div class="fa">
		    <div class="fa-lt">
		        <p class="fb-name"><span style="font-size: 18px">${complaint.title}<a class="large button orange" style="float:right" href="/EBike/complaintDetail/${complaint.id}">查看详情</a></span></p>
		    </div>
		</div>
	</c:forEach>
</div>
 
<div class="more">
	<input type="hidden" id="complaintPage" value="${page }" />
	<p id="loadMore">查看更多<img src="/EBike/frontend/images/icon/arr-right.png"></p>
</div>    

</div>

<jsp:include page="footer.jsp"></jsp:include> 
    
<script type="text/javascript" src="/EBike/frontend/js/jquery-1.7.1.min.js"></script>
<script type="text/javascript">
	$(".more").click(function(){
 		$.ajax({  
               type : 'POST',  
               url :"/EBike/complaint/loadComplaints" ,  
               data:{"page" : $("#complaintPage").val(),"userId":"${sessionScope.userId}"} ,
               dataType : 'json', 
               async : false,  //同步
               success : function(data) {
               		if(data.code==1){
	               		for(i=0;i<data.res.length;i++){
							$(".favorable").append('<div class="fa">'
													+'<div class="fa-lt">'
													+'<p class="fb-name">'+data.res[i].title+' <a class="large button orange" href="/EBike/complaintDetail/'+data.res[i].id+'" style="float:right">查看详情</a></p>'
													+'</div></div>');
						}
						var newPage = $("#complaintPage").val()+1;
						$("#complaintPage").val(newPage);
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
