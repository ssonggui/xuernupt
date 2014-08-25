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
    <link rel="shortcut icon" href="./img/logo.png">
    <title>学耳南邮--登录</title>
    
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
			//input失去焦点事件onblur（），调用这个js方法验证
			function namevalidate(field) {
				
				if (field.value.length != 0) {
					$.ajax({
						type: "post",
						url: "<%=request.getContextPath()%>/check",
						data: {name:field.value},
						success:function(a){
							if(a.name=="1")
								field.value="帐户名不存在";
							
						}
					
					});
					

				}
			}

			function passwdvalidate(field) {
				
				if (field.value.length == 0) {
					field.placeholder="密码不能为空";
				}
			}

			
		</script>
	
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
          <a class="navbar-brand" href="<%=request.getContextPath()%>/"><div><img width="15" height="15" src="./img/logo.png" alt="logo" class="img-rounded">XUERNUPT</div></a>         
        </div>
        <div class="navbar-collapse collapse">
        	<ul class="nav navbar-nav">
        		<li><a href="<%=request.getContextPath()%>/course">课程动脉</a></li>
        		<li><a href="<%=request.getContextPath()%>/bfg">凤逑凰</a></li>
        		<li><a href="<%=request.getContextPath()%>/WeChat">微信</a></li>
        		<li><a href="<%=request.getContextPath()%>/about">关于</a></li>
        	</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="<%=request.getContextPath()%>/Rg">注册</a></li>
			</ul>

        </div><!--/.navbar-collapse -->
      </div>
    </nav>
	
	<div class="container">
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4">
				<p><h2>${bfgmsg }请登录您的账户</h2></p>
				<form role="form" action="<%=request.getContextPath()%>/checkpasswd" name="login" method="post" id="login">
					
					  <div class="form-group">
						<label for="name">账户</label>
						<input type="text" class="form-control" placeholder="输入账户名" name="name" id="name" onblur="namevalidate(this)">
					  </div>
					  <div class="form-group">
						<label for="passwd">密码</label>
						<input type="password" class="form-control" placeholder="密码" name="passwd" id="passwd" onblur="passwdvalidate(this)">
					  </div>
					  <div class="checkbox">
						<label for="autologin">
						  <input type="checkbox" name="autologin" id="autologin" value="true" checked="checked">免登录
						  <input type="hidden" name="autologin">
						</label>
					  </div>
					  <p><h5 id="passwdmsg" style="color:#FF6430;font-family:SimHei">${passwdmsg }</h5></p>					
						<div>
							<button type="submit" class="btn btn-lg btn-info">登录</button>
							<a href="<%=request.getContextPath()%>/revisepasswd"  class=" pull-right">忘记密码？修改</a>
							
						</div>
						
					
				</form>
			</div>
		</div>
	</div>
	
	<footer class="bs-footer">
        <p>&copy; xuernupt 2014</p>
    </footer>
</body>
</html>