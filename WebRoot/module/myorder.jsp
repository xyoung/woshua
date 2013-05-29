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
     
     function showTable () {
     
     	$.getJSON("${basePath}ordertable.action",function(result){
				//alert(result["pageNum"]);
				
				//alert(
				//$("ul.pager li:first").html("共" + result["pageNum"] +"页" );
				//$("ul.pager li:third").html("<a>" + result["page"] +"</a>" );
				$("#orderTable tbody").remove();
				$.each(result["orderList"], function(i, field){
					var url= "href='orderinfo.action?orderId="+field.orderId+"'";
					var op = "无法再修改";
					if(field.orderState==0)
						op = "<a href='${basePath}editorder.action?orderId="+field.orderId+"'>修改</a>&nbsp;<a href='javascript:void' onclick='alert("+field.orderId +")'>删除</a>";
					if(field.orderState==1)
						op = "<a>修改</a>";
					//alert(url);
					$("#orderTable tbody").append("<tr><td><a "+url+">"+field.orderId
       					+"</a></td><td>"+(field.orderType==0?"普通":"紧急")
       					+"</td><td>"+field.consignee
       					+"</td><td>"+field.price
       					+"</td><td>"+field.generateTime
       					+"</td><td>"+(field.orderState==0?"未审核":(field.orderState==1?"已审核":(field.orderState==2?"生产":"配送")))+"</td><td>"+op+"</td></tr>");
				});
				

    		});
     }
      $(document).ready(function(){
     
      
      //var result=${orderList };
       //alert(result);
      // $.each(result,function(i,feild){
       	//alert(i + "+" +feild);
      // 	$("#orderTable tbody").append("<tr><td>"+feild.orderId
      // 	+"</td><td>"+feild.orderType
      // 	+"</td><td>"+feild.consignee
      // 	+"</td><td>"+feild.price
      // 	+"</td><td>"+feild.generateTime
      // 	+"</td><td>"+feild.orderState+"</td><td></td> </tr>");
     //  });
       
       			/*$.ajax({
					type:"POST",
					url:"${basePath}ordertable.action",
					//data:paraStr+"&pageIndex="+pageNumber+"&pageRowsCount="+pageSize,
					success:function(data){
						alert(data);
						$.each(data["orderList"],function(i,feild){
						//alert(i+":"+feild);
       					$("#orderTable tbody").append("<tr><td>"+feild.orderId
       					+"</td><td>"+feild.orderType
       					+"</td><td>"+feild.consignee
       					+"</td><td>"+feild.price
       					+"</td><td>"+feild.generateTime
       					+"</td><td>"+feild.orderState+"</td><td></td> </tr>");
       					});
					}
				});*/
				
				$.getJSON("${basePath}ordertable.action","page=${page}", function(result){
				//alert(result["pageNum"]);
				
				//alert(
				//$("ul.pager li:first").html("共" + result["pageNum"] +"页" );
				//$("ul.pager li:third").html("<a>" + result["page"] +"</a>" );
				$.each(result["orderList"], function(i, field){
					var url= "href='orderinfo.action?orderId="+field.orderId+"'";
					var op = "无法再修改";
					if(field.orderState==0)
						op = "<a href='${basePath}editorder.action?orderId="+field.orderId+"'>修改</a>&nbsp;<a href='javascript:void(0)'  onclick='deleteOrder("+field.orderId+")' >删除</a>";
											
					if(field.orderState==1)
						op = "<a>修改</a>";
					//alert(url);
					$("#orderTable tbody").append("<tr><td><a "+url+">"+field.orderId
       					+"</a></td><td>"+(field.orderType==0?"普通":"紧急")
       					+"</td><td>"+field.consignee
       					+"</td><td>"+field.price
       					+"</td><td>"+field.generateTime
       					+"</td><td>"+(field.orderState==0?"未审核":(field.orderState==1?"已审核":(field.orderState==2?"生产":"配送")))+"</td><td>"+op+"</td></tr>");
       				
				});
				
					var page = result.page;
       				var pagenum = result.pageNum;
       				var sum = result.colNum;
       				
       				
       				/*if(page == 1) {
       					$("pageUl").append("<li class='disabled'><a href='#'>&laquo;</a></li><li class='active'><a href='#'>1</a></li>");
       					if(pagenum <= 5) {
       						for(i=2; i <= pagenum; i++) {
       							$("pageUl").append("<li><a href='#'>"+i+"</a></li>");
       						}
       					} else {
       						for(i = 2; i <=4; i++) {
       							$("pageUl").append("<li><a href='#'>"+i+"</a></li>");
       						}
       						$("pageUl").append("<li><a href='#'>...</a></li>");
       					}
       				} else if(page <=3 ) {
       					$("pageUl").append("<li><a href='#'>&laquo;</a></li><li><a href='#'>1</a></li>");
       					for(i=2; i<page; i++){
       						$("pageUl").append("<li><a href='#'>"+i+"</a></li>");
       					}
       					$("pageUl").append("<li class='active'><a href='#'>"+page+"</a></li>");
       					if((pagenum - page)<=2 || pagenum <= 5) {
       						for(i = page+1; i<=pagenum; i++) {
       							$("pageUl").append("<li><a href='#'>"+i+"</a></li>");
       						}
       					} else {
       						$("pageUl").append("<li><a href='#'>"+(page+1)+"</a></li><li><a href='#'>...</a></li>");
       						$("pageUl").append("<li><a href='#'>"+pagenum+"</a></li>");
       					}
       				} else {
       					$("pageUl").append("<li><a href='#'>&laquo;</a></li><li><a href='#'>1</a></li><li><a href='#'>...</a></li>");
       					$("pageUl").append("<li><a href='#'>&laquo;</a></li><li><a href='#'>"+(page-1)+"</a></li><li class='active'><a href='#'>"+page+"</a></li>");
       					if((pagenum - page)<=2) {
       						for(i = page+1; i<=pagenum; i++) {
       							$("pageUl").append("<li><a href='#'>"+i+"</a></li>");
       						}
       					} else {
       						$("pageUl").append("<li><a href='#'>"+(page+1)+"</a></li><li><a href='#'>...</a></li>");
       						$("pageUl").append("<li><a href='#'>"+pagenum+"</a></li>");
       					}
       				}
       				if(page == pagenum) {
       					$("pageUl").append("<li class='disabled'><a href='#'>&raquo;</a></li>");
       				} else {
       					$("pageUl").append("<li class='disabled'><a href='#'>&raquo;</a></li>");
       				}*/
       				////////////////////////////////////////
       				var preUrl = "${basePath}myorder.action?page=" + (page-1);
       				var nextUrl = "${basePath}myorder.action?page=" + (page+1);
       				if(pagenum <= 5) {
       					//alert("pagenum <= 5:"+page +" "+ pagenum+" "+sum);
       					if(page == 1) {
       						//alert("page == 1");
       						$("#pageUl").append("<li class='disabled'><a>&laquo;</a></li>");
       					} else {
       						$("#pageUl").append("<li><a href='"+preUrl+"'>&laquo;</a></li>");
       					}
       					
       					for(i = 1; i < page; i++) {
       						$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+i+"'>" + i + "</a></li>");
       					}
       					$("#pageUl").append("<li class='active'><a>" + page + "</a></li>");
       					for(i = page + 1; i <= pagenum; i++) {
       						$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+i+"'>" + i + "</a></li>");
       					}
       				} else {
       					if(page == 1) {
       						$("#pageUl").append("<li class='disabled'><a>&laquo;</a></li>");
       					} else {
       						$("#pageUl").append("<li><a href='"+preUrl+"'>&laquo;</a></li>");
       					}
       					
       					if(page <= 3) {
       						for(i = 1; i < page; i++){
       							$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+i+"'>"+i+"</a></li>");
       						}
       						$("#pageUl").append("<li class='active'><a>"+page+"</a></li>");
       						if((pagenum - page) <= 2 ) {
       							for(i = page+1; i<=pagenum; i++) {
       								$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+i+"'>"+i+"</a></li>");
       							}
       						} else {
       							$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+(page+1)+"'>"+(page+1)+"</a></li><li><a>...</a></li>");
       							$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+pagenum+"'>"+pagenum+"</a></li>");
       						}
       					} else {
       						$("#pageUl").append("<li><a href='${basePath}myorder.action?page=1'>1</a></li><li><a>...</a></li>");
       						$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+(page-1)+"'>"+(page-1)+"</a></li><li class='active'><a>"+page+"</a></li>");
       						if((pagenum - page)<=2) {
       							for(i = page+1; i<=pagenum; i++) {
       								$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+i+"'>"+i+"</a></li>");
       							}
       						} else {
       							$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+(page+1)+"'>"+(page+1)+"</a></li><li><a>...</a></li>");
       							$("#pageUl").append("<li><a href='${basePath}myorder.action?page="+pagenum+"'>"+pagenum+"</a></li>");
       						}
       					}
       					
       				}
       				if(page == pagenum || pagenum == 0) {
       					$("#pageUl").append("<li class='disabled'><a>&raquo;</a></li>");
       				} else {
       					$("#pageUl").append("<li><a href='"+nextUrl+"'>&raquo;</a></li>");
       				}
       				
       				//alert($("#pageUl"));
       				
       				
    			});
    			
    			
    			
    			
    		
       
      
      		
      
      });
      
      	function deleteOrder(orderId){
    			//alert(orderId);
    			var con = confirm("确定要删除订单："+orderId);
    			if(con = true){
    			window.location.href="${basePath }deleteorder.action?orderId="+orderId +"&page=${page}";
    		}
    	}
     
     
     </script>

  </head>

  <body>

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
              <li class="active">
                <a href="${basePath }myorder.action" class="active">我的订单</a>
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
    		<h2>我的订单</h2>
  		</div>
	</header>


  <div class="container">
 
  
  	<div class="bs-docs-example">
  	 <a class="btn btn-success" href="${basePath }module/neworder.jsp" >创建新订单</a>
  	 <hr class="featurette-divider">
            <table class="table table-striped" id="orderTable">
              <thead>
                <tr>
                  <th>订单编号</th>
                  <th>订单类型</th>
                  <th>收货人</th>
                  <th>订单金额</th>
                  <th>订单时间</th>
                  <th>订单状态</th>
                  <th>操作</th>
                </tr>
              </thead>
              <tbody>
                
              </tbody>
            </table>
          </div>
         
	<div class="pagination pagination-centered pull-right">
              <ul id="pageUl">
                
             </ul>
            </div>
   
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