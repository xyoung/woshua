<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("basePath", basePath);
%>

<!DOCTYPE html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>我刷-我的订单</title>
    
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
		var orderType="${orderType}";
		if(orderType == "1"){
			$("input[name=orderType][value=option2]").attr("checked",true);
		}
		
		$("#orderSubmit").click(function(){
			//alert(123);
			$("#orderForm").submit();
		});
		
		var save = "${save}";
		if(save == "2") {
			alert("设置成功");
		}
		
		
		
		
	});
	
	
      
    </script>
    
    

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
                <a href="${basePath }myorder.action">我的订单</a>
              </li>
              <li class="">
                <a >关于</a>
              </li>
              <li class="">
                <a >联系我们</a>
              </li>
            </ul>
          </div>
           <div class="btn-group pull-right">
                <button class="btn btn-info">${username }</button>
                <button class="btn btn-info dropdown-toggle" data-toggle="dropdown"><span class="caret"></span></button>
                <ul class="dropdown-menu">
                  <li><a href="${basePath }myaccount.action">我的账号</a></li>
                  <li><a href="${basePath }logout.action">注销</a></li>
                </ul>
            </div>
        </div>
      </div>
    </div>

	<!-- Subhead
	================================================== -->
	<header class="jumbotron subhead" id="overview">
  		<div class="container">
    		<h2>修改订单</h2>
  		</div>
	</header>

<div class="container">
  
  
  	
  		<form class="form-horizontal bs-docs-example " action="${basePath }saveorder.action" id="orderForm" name=formen method="post">
  			<lead>订单编号：${orderId }</lead>
  			<input type="text" class="span2" name="orderId" style="display:none" value="${orderId }">
  			 <hr class="featurette-divider">
  			<div class="control-group">
              <label class="control-label" for="inputEmail">*订单类型:</label>
              
              
              <div class="controls">
              <label class="radio">
  				<input type="radio" name="orderType" id="optionsRadios1" value="option1" checked>
  				普通
			</label>
			
			
			<label class="radio">
  				<input type="radio" name="orderType" id="optionsRadios2" value="option2">
  					加急
				</label>
				
				</div>
              
            </div>
            <div class="control-group">
              <label class="control-label" for="inputEmail">*收货人:</label>
              <div class="controls">
                <input type="text" class="span2" name="consignee" value="${consignee }">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="inputPassword">*详细地址:</label>
              <div class="controls">
                <input type="text" class="span4" name="address" value="${ address}">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="inputEmail">*联系电话:</label>
              <div class="controls">
                <input type="text" class="span2" name="phone" value="${phone }">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="inputEmail">*规格:</label>
              <div class="controls">
                <input type="text" class="span2" name="specification" value="${specification }">
              </div>
            </div>
            
            
            
          </form>
          
          	<p class="pull-right"> <button id="returnSubmit" class="btn btn-success">返回</button>
          	 
    	   <button id="orderSubmit" class="btn btn-success">确认</button><p>
    	  
             

   
 
  </div>



    <!-- Footer
    ================================================== -->
    <footer class="footer">
      <div class="container">
        <p>Designed and built with all the love in the world by <a href="http://twitter.com/mdo" target="_blank">@mdo</a> and <a href="http://twitter.com/fat" target="_blank">@fat</a>.</p>
        <p>Code licensed under <a href="http://www.apache.org/licenses/LICENSE-2.0" target="_blank">Apache License v2.0</a>, documentation under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.</p>
        <p><a href="http://glyphicons.com">Glyphicons Free</a> licensed under <a href="http://creativecommons.org/licenses/by/3.0/">CC BY 3.0</a>.</p>
        <ul class="footer-links">
          <li><a href="http://blog.getbootstrap.com">Blog</a></li>
          <li class="muted">&middot;</li>
          <li><a href="https://github.com/twitter/bootstrap/issues?state=open">Issues</a></li>
          <li class="muted">&middot;</li>
          <li><a href="https://github.com/twitter/bootstrap/blob/master/CHANGELOG.md">Changelog</a></li>
        </ul>
      </div>
    </footer>
    




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