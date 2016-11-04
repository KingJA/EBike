<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ctx" value="${pageContext.servletContext.contextPath}"/>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no" name="viewport"  />
	<meta name="format-detection" content="telephone=no" />
	<meta content="yes" name="apple-mobile-web-app-capable" />
	<meta content="black" name="apple-mobile-web-app-status-bar-style" />
	<meta content="telephone=no" name="format-detection" />
	<meta content="false" id="twcClient" name="twcClient" />
	<title>用户登录</title>
	<link type="text/css" rel="stylesheet" href="/EBike/frontend/css/v2/style.css">
	<link type="text/css" rel="stylesheet" href="/EBike/frontend/css/v2/member.css">
	<script type="text/javascript" src="/EBike/frontend/js/jquery-1.7.1.min.js"></script>
</head>
<body id="page">
<header class="header"> 
	<span class="fh left"><a href="javascript:history.back(1)">&nbsp;</a></span>  	登录
  	<span class="hd_right right">
</span>
</header>
<span id="login_errorMsg" style=" padding:10px;"></span>
<div class="Login">
  <div class="Login_top">
    <ul>
      <li class="cur"><A href="/EBike/login">登录</A></li>
      <li><A href="/EBike/register">注册</A></li>
    </ul>
  </div>
  <div> 
    <div class="Login_bottom">
      <form id="loginForm" action="" method="post">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="60" align="center" valign="middle"><input type="text" id="mobileNum" value="" name="mobileNum" placeholder="手机号/用户名" class="login_wbk"></td>
          </tr>
          <tr>
            <td height="60" align="center" valign="middle"><input type="password" id="password" name="password" placeholder="密码"  class="login_wbk"></td>
          </tr>
          <tr>
            <td height="60" align="center" valign="middle"><A href="#" id="memberLogin" class="dl_login">登录</A></td>
          </tr>
          <tr>
            <td height="55" align="right" valign="middle">&nbsp;</td>
          </tr>
        </table>
      </form>
    </div>
   </div>
</div>
<script type="text/javascript">
	
 		//表单提交
		$("#memberLogin").click(function(){
			if(!checkForm()){
				return false;
			}
			var username = $("#mobileNum").val();
			var password = $("#password").val();
			$.ajax({
				type: "post",
				url: "/EBike/user/login.do",
				data: {
					userName: username,
					passWord: password,
					login:1
				},
				dataType: "json",
				success: function(result) {
					if(result.code == 1){
						/*if(window._gsTracker) {
					        _gsTracker.track("../../targetpage/login_success");
					    }*/
						window.location.href= "/EBike/index";
					}else{
						/*if(result.message == 'pc用户手机号未验证'){
							if(confirm("该手机号码已绑定您的邮箱账号，但未通过验证，您可以选择使用邮箱登录，或者点击确认去验证手机号")){
								window.location.href = "toMemberVerifyMobile.html@mobileNum="+username;
							}
						}else{*/
							alert(result.msg);
						//}
					}
				}
			});
		});
		
		//表单校验
		function checkForm(){
			var mobileNum = $("#mobileNum").val();
			var password = $("#password").val();
			//var mobileReg = /^((13[0-9])|(15[^4,\D])|(18[0236789]))\d{8}$/;
			//var mobileReg = /^((13[0-9])|(14[57])|(15[^4,\D])|(18[0-9]))\d{8}$/;
			//var emailReg = /^([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)*@([a-zA-Z0-9]*[-_]?[a-zA-Z0-9]+)+[\\.][A-Za-z]{2,3}([\\.][A-Za-z]{2})?$/;
			
			if(mobileNum == "" || mobileNum == null){
				alert("用户名不能为空！");
				return false;
			}
			/*if(!mobileReg.test(mobileNum) && !emailReg.test(mobileNum)){
				alert("用户名不正确");
				return false;
			}*/
			if(password == "" || password == null){
				alert("请输入密码！");
				return false;
			}
			return true;
		}

		//手机号校验
		function isMobileNO(mobileNum){
			var pattern = new RegExp("^((13[0-9])|(14[57])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
			if(!pattern.test(mobileNum)){
				$("#mobileNumMsg").text("用户名不正确！");
				return false;
			}
			$("#mobileNumMsg").empty();
			return true;
		}
		
		//输入框样式
		$(".Login_top>ul>li").on("click",function(){
			var i=$(this).prev().length;
			$("div div.Login_bottom").eq(i).show().siblings().hide();
			$(this).addClass("cur").siblings().removeClass("cur");
				$("#login_errorMsg").text('');
		});
		
	</script>
	<footer class="footer">
	<div id="footer" class="ft_top">
				<a href="/EBike/login">登录</a>|<a href="/EBike/register">注册</a>
			</div>
  	<p><a href="javascript:scroll(0,0)">返回顶部</a>|<a href="/EBike/index">返回首页</a>|<a href="/EBike/complaint">投诉中心</a> </p>
</footer>

</body>
</html>

