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
    <title>学耳南邮--error</title>
    
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


</head>


<body class="home">
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">


        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%=request.getContextPath()%>/"><div><img width="15" height="15" src="<%=request.getContextPath()%>/img/logo.png" alt="logo" class="img-rounded">XUERNUPT</div></a>         
        </div>
        <div class="navbar-collapse collapse">
        	<ul class="nav navbar-nav">
        		<li><a href="<%=request.getContextPath()%>/course">课程互动</a></li>
        		<li><a href="<%=request.getContextPath()%>/bfg">凤逑凰</a></li>
        		<li><a href="<%=request.getContextPath()%>/">凰球凤</a></li>
        		<li><a href="<%=request.getContextPath()%>/about">关于</a></li>
        	</ul>


        </div><!--/.navbar-collapse -->
      </div>
    </nav>
	
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8"><p><h2>请求页面不存在或者其他原因(如上传数据过大等)导致，请返回<a href="<%=request.getContextPath()%>/">首页</a></h2></p>
			
			</div>
		</div>
	</div>
	

</body>
</html>