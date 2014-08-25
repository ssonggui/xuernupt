<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="<%=request.getContextPath()%>/img/logo.png">
    <title>学耳南邮--Boy</title>
    
        <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/bootstrap/dist/css/jumbotron.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/css/btstrapto.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/video-js/video-js.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/video-js/video.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/bootstrap.js"></script>

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->


</head>
<% session.setAttribute("sessionpath", request.getServletPath()) ;%>

<body class="home">
   <c:set value="2" var="navactive" scope="request"/>
	<c:if test="${cookie.loginname.value!=null }">
		<c:import url="cookienavbar.jsp"/>
    </c:if>
	
	<div class="container">
		<div class="row">
		<div class="col-md-9 col-md-offset-1 ">
			${content }
		</div>
		</div>

	</div>
	

</body>
</html>