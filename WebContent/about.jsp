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
	 
	 .scrollspy-example 
        { 
		  position: relative;

		  margin-top: 20px;
		  
        }
      .nav-stacked.padding{
      	padding-top:30px;
      	padding-bottom:30px;
      }

	.carousel-control{display:none}

	</style>
    
  </head>
<% session.setAttribute("sessionpath", request.getServletPath()) ;%>
  <body>
 <c:set value="4" var="navactive" scope="request"/>
  <c:if test="${cookie.loginname.value==null }">
	<c:import url="navbar.jsp"/>
  </c:if>
	<c:if test="${cookie.loginname.value!=null }">
		<c:import url="cookienavbar.jsp"/>
    </c:if>
    <!-- Main jumbotron for a primary marketing message or call to action -->


    <div class="container-fluid">
      <!-- Example row of columns -->

	    <div id="carousel-example-captions" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-captions" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-captions" data-slide-to="1"></li>
          <li data-target="#carousel-example-captions" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
          <div class="item active">
            <img src="./img/about_lb.jpg" alt="前端">
            <div class="carousel-caption">
              <h3>前端</h3>
              <p>Bootstrap提供了优雅的HTML和CSS规范，它由动态CSS语言LESS写成，与CSS框架Blueprint存在很多相似之处。Bootstrap推出后颇受欢迎，一直是GitHub上的热门开源项目。</p>
            </div>
          </div>
          <div class="item">
            <img src="<%=request.getContextPath()%>/img/about_lh.jpg" alt="后台">
            <div class="carousel-caption">
              <h3>后台</h3>
              <p>SpringMVC是非常优秀的MVC框架，由其是在3.0版本发布后，现在有越来越多的团队选择了Spring3 MVC了。Spring3 MVC结构简单，应了那句话简单就是美，而且他强大不失灵活，性能也很优秀。</p>
            </div>
          </div>
          <div class="item">
            <img src="<%=request.getContextPath()%>/img/about_mg.jpg" alt="作者">
            <div class="carousel-caption">
              <h3>作者</h3>
              <p>宋亚南，南京邮电大学通信与信息系统专业学生。</p>
            </div>
          </div>
        </div>
         <a class="left carousel-control" href="#carousel-example-captions" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-captions" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
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
