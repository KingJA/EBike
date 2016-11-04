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
<title>电动车防盗管理系统</title>
</head>
<script type="text/javascript" src="/EBike/frontend/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/EBike/frontend/js/api.js"></script>
<script type="text/javascript" src="/EBike/frontend/js/SHA1.js"></script>
<script>
if(${message.code}==1){
            var now = Date.now();
            var    appKey = SHA1("A6994920167756" + "UZ" + "4E1FC6D6-F396-88BB-A651-F1BAEA197731" + "UZ" + now) + "." + now;
apiready = function(){
        function push() {
            api.ajax({
                url : 'https://p.apicloud.com/api/push/message',
                method : "post",
                headers : {
                    "X-APICloud-AppId" : "A6994920167756",
                    "X-APICloud-AppKey" : appKey
                },
                dataType : "json",
                data : {
                    "values" : {
                        "title" : "${title}",
                        "content" : "${content}",
                        "type" : 2, //– 消息类型，1:消息 2:通知
                        "platform" : 0, //0:全部平台，1：ios, 2：android
                    	"userIds" : "${userId}" //推送用户id, 多个用户用英文逗号分隔，通过说明4获取用户ID。
                    }
                }
            }, function(ret, err) {
                //coding...
                alert(JSON.stringify(ret))
                alert(JSON.stringify(err))
            });
        }
        push();
};

/*$.ajax({
      "url": "https://d.apicloud.com/mcm/api/Company",
      "method": "POST",
      "cache": false,
      "headers": {
        "X-APICloud-AppId": "A6994920167756",
        "X-APICloud-AppKey": appKey
      },
      "data": {
        "name": "API Cloud",
        "level": "Branch",
        "area": "Haidian District"
      }
}).success(function (data, status, header) {
      //success body
}).fail(function (header, status, errorThrown) {
      //fail body
});*/
}else{
	alert(${message.msg});
}


</script>