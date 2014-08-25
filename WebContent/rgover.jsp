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
    <link href="bootstrap/dist/css/bootstrap.css" rel="stylesheet">
 	<link href="bootstrap/dist/css/jumbotron.css" rel="stylesheet">
 	<link href="css/btstrapto.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="bootstrap/dist/js/jquery-2.1.1.min.js"></script>
    <script src="bootstrap/dist/js/bootstrap.js"></script>

    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

    
  </head>

<body class="home">
<c:import url="navbar.jsp"/>
<div class="container">
	<div class="page-header"><p><h2>恭喜，注册成功</h2></p></div>
	<div class="row">
	<div class="col-md-3">

	<p><a href="<%=request.getContextPath()%>/login" class="btn btn-info btn-lg pull-left">登陆</a></p>
	</div>
	</div>
</div>
</body>
</html>