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
    <title>学耳南邮--topic</title>
    
        <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/bootstrap/dist/css/jumbotron.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/css/font-awesome.min.css" rel="stylesheet">
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

<script type="text/javascript">
	var reply = function reply(){
		if($("#content").val().length<5){
			alert("不能少于5个字");
			return;
		}
		if($("#content").val().length>499){
			alert("不能大于500个字");
			return;
		}
		
		$("#replyform").submit();
	}
</script>
</head>

	
<body >
   <c:set value="1" var="navactive" scope="request"/>
<c:if test="${cookie.loginname.value==null }">
<c:set value="0" var="replyhiden" scope="request"/>
	<c:import url="navbar.jsp"/>
  </c:if>
	<c:if test="${cookie.loginname.value!=null }">
	<c:set value="1" var="replyhiden" scope="request"/>
		<c:import url="cookienavbar.jsp"/>
    </c:if>
<% session.setAttribute("sessionpath", "/view/topic/"+(String)request.getAttribute("topicId") );%>
	<div class="container">
		<div class="row">
		<div class="col-md-8 col-md-offset-2 ">
		<br>
		<h3>${topic.title }</h3>
			<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-user">&nbsp;作者&nbsp;</i><c:if test="${topic.user_topic.name !=null }">${topic.user_topic.name }</c:if><c:if test="${topic.user_topic.name==null }">佚名</c:if>&nbsp;|&nbsp;发布时间：<fmt:formatDate  value="${topic.time}" pattern="yyyy年MM月dd日HH时"/></em>
			<small>
			<c:if test="${cookie.loginname.value!=null && topic.user_topic.name==cookie.loginname.value }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/edit/topic/${topic.id}"><i class="icon-pencil">修改</i></a></c:if>
			</small>
										
		<hr>
		${topic.content }
		</div>
		</div>
		<div class="row">
		
		<div class="col-md-8 col-md-offset-2 ">
		<hr>
		<p><c:if test="${replyhiden<1 }"><a href="#exa1" data-toggle="modal">登录</a></c:if>马上神评......</p>
		
		<form id="replyform" action="<%=request.getContextPath() %>/addtopicreply" method="post">
		<textarea id="content" name="content" <c:if test="${replyhiden<1 }">class="hidden"</c:if> class="form-control" rows="3"></textarea>
		<button type="button" id="bsubmit" <c:if test="${replyhiden<1 }">class="hidden"</c:if> class="btn btn-md btn-danger" onclick="reply()">评论</button>
		</form>
		<hr>
		
		</div>
		<div class="row">
		<div class="col-md-8 col-md-offset-2 ">
		<c:if test="${!empty topic.topicreply}">
		<c:forEach items="${topic.topicreply}" var="topicreply" >		
		<p>	${topicreply.content }
		</p>
					<small><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;---${topicreply.user_topicreply.name }---<fmt:formatDate  value="${topicreply.time }" pattern="yyyy年MM月dd日HH时"/></em></small>
		
		<hr>
		
		</c:forEach>
		</c:if>


		</div>
		
		</div>
		</div>

	</div>
	

</body>
</html>