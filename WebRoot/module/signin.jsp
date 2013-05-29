<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我刷-注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  	<link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/css/bootstrap-responsive.css" rel="stylesheet">
    <link href="assets/css/docs.css" rel="stylesheet">
    <link href="assets/js/google-code-prettify/prettify.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="assets/js/html5shiv.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="assets/ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="assets/ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="assets/ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="assets/ico/favicon.png">
    <style type="text/css">
	  h1, h2, h3, .masthead p, .subhead p, .marketing h2, .lead, th, td, body
{
  font-family: "Helvetica Neue", Helvetica, Arial, "Microsoft Yahei UI", "Microsoft YaHei", SimHei, "\5B8B\4F53", simsun, sans-serif;
  font-weight: normal;
}
	  </style>
   <script src="assets/js/jquery.js"></script>
  <script type="text/javascript">                                
		$(document).ready(function(){
		
			/**
			 *前端无ajax验证，目前只验证了为不为空，还要加入邮箱格式是否正确
			 *用户名密码是否符合条件
			 *
			 **/
     		
     		var ePassed = false;
     		var uPassed = false;
     		var pPassed = false;
     		
     		$("#signinB").click(function(){
     			$("#vercode").text("");
     			if($("#vercode").val()==""){
     				$("#vercodeError").text("*请输入验证码");
     			} else {
     				if(ePassed && uPassed && pPassed){
     					//alert(111);
     					$("form").submit();
     				}
     			}
     			
     		});
     		
     		
     		
     		$("#vercodeImg").click(function(){
     		
     			$("#vercodeImg").attr("src","${basePath }authImg");
     		});
     		
     		$("#email").blur(function(){
     			ePassed = false;
     			if($("#email").val() == "") {
     				$("#emailError").text("*邮箱不能为空");
     			} else if(!emailF($("#email").val())) {
     				$("#emailError").text("*邮箱格式不正确!");
     			} else {
     				 emailEt();
     			}
     			
     		});
     		
     		$("#username").blur(function(){
     			uPassed = false;
     			if($("#username").val() == "") {
     				$("#usernameError").text("*用户名不能为空！");
     			} else if(!passwordF($("#username").val())) {
     				alert($("#username").val());
     				$("#usernameError").text("*用户名必须是5-20位的字母和数字!");
     			} else {
     				 usernameEt();
     			}
     			
     		});
     		
     		$("#password").blur(function(){
     			pPassed = false;
     			if($("#password").val() == "") {
     				$("#passwordError").text("*密码不能为空！");
     			} else if(!passwordF($("#password").val())) {
     				$("#passwordError").text("*密码必须是5-20位的字母和数字!");
     			} else {
     				$("#passwordError").text("符合");
     				pPassed = true;
     			}
     			
     		});
     		
     		function emailF(email) {
     			var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
                return isok= reg.test(email );
     			
     		}
     		
     		function usernameF(usernmae) {
     			var reg = /^[A-Za-z0-9]{5,20}$/;
     			return isok = reg.test(username);
     		}
     		
     		function passwordF(password) {
     			var reg = /^[A-Za-z0-9]{5,20}$/;
     			return isok = reg.test(password);
     		}
     		
     		function oneW(one) {
     			var reg = /^[*]{1}[u4e00-u9fa5]$/;
     			return isok =reg.test(one);
     		}
     		//验证邮箱是否已被占用
     		function emailEt(){
     			$.getJSON("${basePath }emailexist.action", "email=" + $("#email").val(), function(result){
     				if(result["emailExist"]){
     					$("#emailError").text("*邮箱已被使用!");
     				} else {
     					$("#emailError").text("√邮箱可以使用");
     					ePassed = true;
     				}
     			});
     		}
     		//验证用户名是否已被占用
     		function usernameEt(){
     			$.getJSON("${basePath }usernameexist.action", "username=" + $("#username").val(), function(result){
     				if(result["usernameExist"]){
     					$("#usernameError").text("*用户名已被使用!");
     				} else {
     					$("#usernameError").text("√用户名可以使用");
     					uPassed = true;
     				}
     			});
     		}
     		
     	
     		
     
     	});
     	
     	
     	
     	
    
    </script>                                 
    
    
    
    <style type="text/css">
    	
    </style>                               

  </head>

  <body data-spy="scroll" data-target=".bs-docs-sidebar">

    <!-- Navbar
    ================================================== -->
    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="./index.html">我刷网</a>
          <div class="nav-collapse collapse">
            <ul class="nav">
              <li class="">
                <a>关于</a>
              </li>
              <li class="">
                <a>联系我们</a>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>

	<div class="container">
	<form class="form-horizontal bs-docs-example" action="${basePath }signin.action" method="post">
            <div class="control-group">
              <label class="control-label" for="inputEmail">邮箱</label>
              <div class="controls">
                <input type="text" id="email" name="email" placeholder="邮箱">
                <span class="help-inline error" id="emailError">${emailError }</span>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="inputEmail">用户名</label>
              <div class="controls">
                <input type="text" id="username" name="username" placeholder="用户名">
                <span class="help-inline error" id="usernameError">${usernameError }</span>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="inputPassword">密码</label>
              <div class="controls">
                <input type="password" id="password" name="password" placeholder="密码">
                 <span class="help-inline error" id="passwordError">${passwordError }</span>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" >验证码</label>
              <div class="controls">
                <input type="text" class="span1" name="vercode" id="vercode" placeholder="">
                <img id="vercodeImg"  src="${basePath }authImg">
                <span class="help-inline" id="vercodeError">${vercodeError }</span>
              </div>
            </div>
            <div class="control-group">
              <div class="controls">
                <input type="button" id="signinB" class="btn btn-success" value="注册">
                <a href="${basePath }module/login.jsp" class="link-option">已有账号，现在登录</a>
              </div>
            </div>
      </form>
     </div>
    




    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap-transition.js"></script>
    <script src="assets/js/bootstrap-alert.js"></script>
    <script src="assets/js/bootstrap-modal.js"></script>
    <script src="assets/js/bootstrap-dropdown.js"></script>
    <script src="assets/js/bootstrap-scrollspy.js"></script>
    <script src="assets/js/bootstrap-tab.js"></script>
    <script src="assets/js/bootstrap-tooltip.js"></script>
    <script src="assets/js/bootstrap-popover.js"></script>
    <script src="assets/js/bootstrap-button.js"></script>
    <script src="assets/js/bootstrap-collapse.js"></script>
    <script src="assets/js/bootstrap-carousel.js"></script>
    <script src="assets/js/bootstrap-typeahead.js"></script>
    <script src="assets/js/bootstrap-affix.js"></script>

    <script src="assets/js/holder/holder.js"></script>
    <script src="assets/js/google-code-prettify/prettify.js"></script>

    <script src="assets/js/application.js"></script>



  </body>
</html>