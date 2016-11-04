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
	<title>用户注册</title>
	<link type="text/css" rel="stylesheet" href="/frontend/css/v2/style.css">
	<link type="text/css" rel="stylesheet" href="/frontend/css/v2/member.css">
	<script type="text/javascript" src="/frontend/js/jquery-1.7.1.min.js"></script>
</head>
<body id="page">
<header class="header"> 
	<span class="fh left"><a href="javascript:history.back(1)">&nbsp;</a></span>  	注册
  	<span class="hd_right right">
</span>
</header>
<span id="login_errorMsg" style="padding:10px;"></span>
<div class="Login">
  <div class="Login_top">
    <ul>
      <li><A href="/login">登录</A></li>
      <li class="cur"><A href="/register">注册</A></li>
    </ul>
  </div>
  <div> 
    <div class="Login_bottom" >
      <form id="registForm" action="" onSubmit="return checkRegForm()" method="post">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td height="60" align="left" valign="middle"><input type="text" value="" id="mobileRegNum" name="mobileRegNum" placeholder="用户名" class="login_wbk">
              </td>
          </tr>
          <tr>
            <td height="60" align="left" valign="middle"><input type="password" id="passwordReg" name="passwordReg" placeholder="设置密码"  class="login_wbk"></td>
          </tr>
          <tr>
            <td height="60" align="left" valign="middle"><input type="password" id="repassword" name="repassword" placeholder="确认密码"  class="login_wbk"></td>
          </tr>
          <tr>
            <td height="60" align="left" valign="middle"><input type="text" id="mobile" name="mobile" placeholder="手机号"  class="login_wbk">
            <span id="mobileNumMsg"></span></td>
          </tr>
          <tr>
            <td height="60" align="left" valign="middle"><input type="text" id="certNo" name="certNo" placeholder="身份证号码，18位"  class="login_wbk"></td>
          </tr>
          <!-- <tr>
            <td height="60" align="left" valign="middle"><input type="text" id="captcha" name="captcha" placeholder="短信验证码"  class="login_wbk inputcheckbox" style=" width:49%;margin:0;">
              <A id="getCaptcha" name="getCaptcha" class="hqxzm inputcheckbox" style="cursor: pointer;width:39%; margin:0; margin-left:2%;" >获取验证码</A> </td>
          </tr>
          <tr>
            <td height="60" align="center" valign="middle"><Span>注册即同意<a href="agreement.html"><span style=" font-size:14px; text-decoration:underline;">海尔商城用户服务协议</span></a></Span></td>
          </tr> -->
          <tr>
            <td height="60" align="center" valign="middle">
			<a href="javascript:void(0)" id="memberRegist" class="dl_login">提交注册</a>
			<a href="javascript:void(0)" class="dl_login submiting" style="display:none;">快速提交中...</a>
			</td>
          </tr>
          <tr>
            <td height="30" >&nbsp;</td>
          </tr>
        </table>
      </form>
    </div>
   </div>
</div>
<script type="text/javascript">
			
		//表单提交
		$("#memberRegist").click(function(){
			if(!checkRegForm()){
				return false;
			}
			var mobileNum = $("#mobileRegNum").val();
			var mobile = $("#mobile").val();
			var certNo = $("#certNo").val();
			var password = $("#passwordReg").val();
			var repassword = $("#repassword").val();
			$(this).hide();
			$(".submiting").show();
			$.ajax({
				type : "post",
				url : "/user/register.do",
				data: {
					mobileNum: mobileNum,
					password: password,
					repassword: repassword,
					mobile: mobile,
					certNo: certNo
				},
				dataType : "json",
				success : function(result) {
					if(result.code == 1){
						alert("注册成功!");
						//国双注册监控
						/*if (window._gsTracker) {
					        _gsTracker.track("../../targetpage/regok");
					    }
					    //CIG注册监控
					 	_cigRegistMonitoring();
					 	//品众注册监控
					 	_pzRegistMonitoring();*/
					 	//页面跳转
						window.location.href = "/login";
					}else{
						alert(result.msg);
						$("#memberRegist").show();
						$(".submiting").hide();
					}
				}
			});
		});
		
		//发送验证码
		/*$("#getCaptcha").click(function(){
			var mobileNum = $("#mobileRegNum").val();
			if(!isMobileNO(mobileNum)){
				alert("请输入正确的手机号");
				return;
			}	
			$.getJSON("getCaptcha.html@mobileNum="+mobileNum,function(result){	
				if(result.success){
					timeDown($("#getCaptcha"), 60);
					alert("验证码发送成功，请注意查收");
				}else{
					alert(result.message);
				}
			});
		});*/
		
		//倒计时
		function timeDown(obj,seconds) {//obj为按钮的对象，seconds是秒数
			var wait = seconds;
	        if (wait == 0) {
	            obj.removeAttr("disabled");           
	            obj.html("获取验证码");//改变按钮中value的值
	            wait = seconds;
	        } else {
	            obj.attr("disabled", true);//倒计时过程中禁止点击按钮
	            obj.html(wait + "秒后重新获取");//改变按钮中value的值
	            wait--;
	            setTimeout(function() {
	                timeDown(obj,wait);//循环调用
	            },
	            1000)
	        }
	    }
	    
		//手机号校验
		function isMobileNO(mobileNum){
			/*var pattern = new RegExp("^((13[0-9])|(14[57])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
			if(!pattern.test(mobileNum)){
				$("#mobileNumMsg").text("手机号不正确！");
				return false;
			}
			$("#mobileNumMsg").empty();*/
			return true;
		}
		
		function checkRegForm(){
			var mobileNum = $("#mobileRegNum").val();
			if(mobileNum==''){
				alert("用户名不能为空！");
				return false;
			}
			var mobile = $("#mobile").val();
			if(mobileNum==''){
				alert("手机号不能为空！");
				return false;
			}
			if(!isMobileNO(mobile)){
				return false;
			}
			if($("#certNo").val()==''){
				alert("身份证号不能为空！");
				return false;
			}
			/*var captcha = $("#captcha").val();
			if(captcha == null || captcha == ""){
				alert("请输入验证码");
				return false;
			}*/
			var filter = /^[A-Za-z0-9_]{6,20}$/;
			var password = $("#passwordReg").val();
			var repassword = $("#repassword").val();
			if(!filter.test(password)){
				alert("密码由6~20个数字、字母、下划线组成，区分大小写");
				return false;
			}
			if(password != repassword){
				alert("两次密码输入不一致");
				return false;
			}
			return true;
		}
	</script>

<footer class="footer">
	<div id="footer" class="ft_top">
				<a href="/login">登录</a>|<a href="/register">注册</a>
			</div>
  	<p><a href="javascript:scroll(0,0)">返回顶部</a>|<a href="/index">返回首页</a>|<a href="/complaint">投诉中心</a> </p>
</footer>



</body>
</html>
