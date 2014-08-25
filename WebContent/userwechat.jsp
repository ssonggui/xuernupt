<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/logo.png">

    <title>学耳南邮</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/bootstrap/dist/css/jumbotron.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/css/btstrapto.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/bootstrap.js"></script>

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
	 a {
	 	color: #716b7a;
	 }


	</style>
    
  </head>
<% session.setAttribute("sessionpath", request.getServletPath()) ;%>
  <body>
 <c:set value="3" var="navactive" scope="request"/>
  <c:if test="${cookie.loginname.value==null }">
	<c:import url="navbar.jsp"/>
  </c:if>
	<c:if test="${cookie.loginname.value!=null }">
		<c:import url="cookienavbar.jsp"/>
    </c:if>
    <!-- Main jumbotron for a primary marketing message or call to action -->


    <div class="container">
      <!-- Example row of columns -->
	<div class="row">
		<div class="col-md-8 col-md-offset-2">
		<p><h3>普通用户无法查看本站微信公共平台信息记录，谢谢您的参与！</h3></p>
		
		</div>
		<div class="col-md-4 col-md-offset-4">
			<p><h2>关注xuernupt,潇洒扫一扫</h2></p>
		
		</div>
		<div class="col-md-2 col-md-offset-5">
	
		<img src="<%=request.getContextPath()%>/img/wechat.jpg" class="img-responsive" alt="Responsive image" class="img-thumbnail">
		</div>
	
	</div>
      <footer class="bs-footer">
        <p>&copy; xuernupt 2014</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->



  </body>
</html>
