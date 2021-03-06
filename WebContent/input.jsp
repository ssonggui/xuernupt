<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="xuefn" uri="http://www.xuernupt.com/taglib" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="./img/logo.png">
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
<script type="text/javascript">

	
</script>    
<style type="text/css">
	.bs-navbar{
	  text-shadow: 0 -1px 0 rgba(0,0,0,.15);
	  background-color: #563d7c;
	  border-color: #463265;
	  box-shadow: 0 1px 0 rgba(255,255,255,.1);
		}
	a{
		color:#002628;
	}
	.page-header {
  padding-bottom: 9px;
  margin: 40px 0 20px;
  border-bottom: 1px solid #FFFAD0;
}
	.page-header h2{
		color:#8C0008;
	}
</style>
	
	
</head>


<body class="home">
    <nav class="navbar navbar-inverse navbar-fixed-top bs-navbar" role="navigation">
      <div class="container">


        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="<%=request.getContextPath()%>/"><div><img width="15" height="15" src="./img/logo.png" alt="logo" class="img-rounded">XUERNUPT</div></a>         
        </div>
        <div class="navbar-collapse collapse">
        	<ul class="nav navbar-nav">
        		<li><a href="<%=request.getContextPath()%>/course">课程互动</a></li>
        		<li><a href="<%=request.getContextPath()%>/bfg">凤逑凰</a></li>
        		<li><a href="<%=request.getContextPath()%>/WeChat">微信</a></li>
        		<li><a href="<%=request.getContextPath()%>/about">关于</a></li>
        	</ul>


        </div><!--/.navbar-collapse -->
      </div>
    </nav>
	
	<div class="container">
		<div class="row">
			
			<div class="col-md-1"></div>
			<div class="col-md-8">
			<div class="page-header">
				<h3><a href="<%=request.getContextPath()%>">${successmsg }请登录</a></h3><br/>
			</div>
			
			<p>${successmsg }<a href="<%=request.getContextPath()%>/login"></a></p>
			</div>
		</div>
	</div>
	
	<footer class="bs-footer">
        <p>&copy; xuernupt 2014</p>
    </footer>
</body>
</html>