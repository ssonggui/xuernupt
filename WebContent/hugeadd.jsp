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

    <title>学耳南邮--管理员</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/bootstrap/dist/css/jumbotron.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/bootstrap/dist/css/font-awesome.css" rel="stylesheet">
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

		.nav-stacked a{
			
			color:black;
		}
		.nav-pills > li.activee{
			
			background-color:#5cb85c;
		}
		.navbar-inverse{
			background-color:#563d7c;
		}

		form.padding,table.padding{
			padding-top:30px;
		}
		table.padding{
			padding-top:10px;
		}
		li.none{
			display:none;
		}
		h3{
			color:red;
		}
	</style>
	<script type="text/javascript">

	</script>

  </head>

  <body>
   <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
   
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
			<c:set value="3" var="rootactive" scope="request"/>
        		<li <c:if test="${rootactive=='1'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/root">查看会员</a></li>
        		<li <c:if test="${rootactive=='2'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/root/edit">编辑会员</a></li>
        		<li <c:if test="${rootactive=='3'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/root/add">增加会员</a></li>
        		<li <c:if test="${rootactive=='4'}">class="active" </c:if>><a  href="<%=request.getContextPath()%>/root/del">删除会员</a></li>
        	</ul>
			<ul class="nav navbar-nav navbar-right">
				
                <li class="dropdown active">
               <a href="#" class="dropdown-toggle background" data-toggle="dropdown">管理员：root<b class="caret"></b></a>
                  <ul class="dropdown-menu">
                    <li><a href="<%=request.getContextPath()%>/">退出</a></li>                    
                  </ul>
                </li>
                <li><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;</a></li>

			</ul>

        </div><!--/.navbar-collapse -->
  
    </nav>
	<div class="container">
	<div class="row">
	<div class="col-md-1"></div>
	
	<div class="col-md-10">
	<hr>
	<p><h3>${exlerrormsg }</h3></p>
		<form action="<%=request.getContextPath()%>/root/tohugeadd" method="post" enctype="multipart/form-data">
		    <div class="form-group">
			    <label for="InputFile">选择excel文件</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/root/addexample">示例</a>
			    <input type="file" id="InputFile" name="InputFile"/>
  			</div>
  			<button type="submit" class="btn btn-md btn-info">上传</button>
		</form>
	</div>
	
	</div>
	</div>
	



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->



  </body>
</html>
