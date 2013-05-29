<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我刷-登录</title>
    
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
    <link href="assets/css/print.css" rel="stylesheet">
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
	  <script src="assets/js/jquery.js"></script>
	  
	  <style type="text/css">
	  h1, h2, h3, .masthead p, .subhead p, .marketing h2, .lead, th, td, body
{
  font-family: "Helvetica Neue", Helvetica, Arial, "Microsoft Yahei UI", "Microsoft YaHei", SimHei, "\5B8B\4F53", simsun, sans-serif;
  font-weight: normal;
}
	  </style>
	<script type="text/javascript">                                
		$(document).ready(function(){
		
     		$("#loginB").click(function(){
     	
     			$("#usernameError").text("");
     			$("#passwordError").text("");
     			$("#vercodeError").text("");
     			if($("#vercode").val()==""){
     				$("#vercodeError").text("*请输入验证码");
     			}
     			else if($("#username").val()==""){
     				$("#usernameError").text("*请填写用户名");
     			}else if($("#password").val()==""){
     				$("#passwordError").text("*请输入密码");
     			}else {
     				$("form").submit();
     			}
     			
     		});
     		$("#vercodeImg").click(function(){
     		
     			$("#vercodeImg").attr("src","${basePath }authImg");
     		});
     
     	});
     	
     	
     	
     	
    
    </script>
    <style type="text/css">
    	.control-label img{
    		cursor:hand;
    	}
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
                <a >关于</a>
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
	
	<form class="form-horizontal bs-docs-example"    action="${basePath }login.action" method="post" >
            <div class="control-group">
              <label class="control-label" for="inputEmail">用户名</label>
              <div class="controls">
                <input type="text" name="username" id="username" placeholder="用户名"   value="${username }">
                <span class="help-inline error" id="usernameError">${usernameError }</span>
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="inputPassword">密码</label>
              <div class="controls">
                <input type="password" name="password" id="password" placeholder="密码">
                <span class="help-inline" id="passwordError">${passwordError }</span>
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
                <label class="checkbox">
                  <input type="checkbox"> 记住我
                </label>
                <input id="loginB" type="button" class="btn btn-success" value="登录" >
                <a href="${basePath }module/signin.jsp" class="link-option">没有账号，现在注册</a>
              </div>
            </div>
      </form>
     </div>
    




    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
  
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