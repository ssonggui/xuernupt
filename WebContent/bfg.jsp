<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="xuefn" uri="http://www.xuernupt.com/taglib" %>
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
		$(function(){
			$("#content").keydown(function(){
				var f = $("#content").val().length > 37;
				if(f){
					 alert("限制在38个字符，跳转到可视化编辑模式" );
					 location.href  = "<%=request.getContextPath()%>/bfg/editor?precontent=" + $("#content").val() ;
				};

				
			});

		});
		var chooseCom = function chooseCom(){
			var e = document.getElementById("publish");
			e.action = "<%=request.getContextPath()%>/bfg";
			e.submit();
		}
		
		var search = function search(){
			if($("#content").val().length>0)
			location.href  = encodeURI("<%=request.getContextPath()%>/bfg/search?key=" + $("#content").val()) ;
		};
		var addfriend = function addfriend(field){
			location.href  = "<%=request.getContextPath()%>/bfg/bfg/addfriend?who=" + field.value ;
		};
		
		var delfriend = function delfriend(field){
			location.href  = "<%=request.getContextPath()%>/bfg/bfg/delfriend?who=" + field.value ;
		}
	</script>

</head>
<% session.setAttribute("sessionpath", request.getServletPath()) ;%>

<body class="home">
   <c:set value="2" var="navactive" scope="request"/>
  <c:if test="${cookie.loginname.value==null }">
	<c:import url="navbar.jsp"/>
  </c:if>
	<c:if test="${cookie.loginname.value!=null }">
		<c:import url="cookienavbar.jsp"/>
    </c:if>
	
	<div class="container">
		<div class="row">
			<div class="col-md-9 col-md-offset-1 ">
			
				<form id="publish" action="<%=request.getContextPath()%>/bfg/adddailyrecord" method="post">
				<div class="form-group has-success">
				<label class="control-label"><i class="icon-search"></i>&nbsp;搜索|发布&nbsp;<i class="icon-envelope-alt"></i></label>
				<div class="input-group input-group-lg">
				  <span class="input-group-btn"><button type="button" class="btn btn-md btn-warning" onclick="search()">搜索</button></span>
				  <input type="text" class="form-control" id="content" name="content" placeholder="女神，是个肮脏的词汇......">
				  
				  <span class="input-group-btn"><button type="submit" class="btn btn-md btn-success">发布</button></span>
				  
				</div>
				</div>
 				<div class="form-group">
				<label class="control-label">选择查看顺序</label>
				<label class="radio-inline">
				  <input type="radio" name="comparator" value="0" onclick="chooseCom()"> 随机
				</label>
				<label class="radio-inline">
				  <input type="radio" name="comparator" value="1" onclick="chooseCom()"> 最新
				</label>
				<label class="radio-inline">
				  <input type="radio" name="comparator" value="-1" onclick="chooseCom()"> 久远
				</label></div>
<!-- 		<div class="form-group has-success">
				<label class="control-label">发表说说</label>
				<div class="input-group input-group-lg">
				  
				  <input type="text" class="form-control" name="ownername" placeholder="女神，是个肮脏的词汇......">
				  <div class="input-group-btn">
				  <button class="btn btn-md btn-success dropdown-toggle" data-toggle="dropdown">发布<span class="caret"></span></button>
				   <ul class="dropdown-menu" role="menu">
			          <li><a href="<%=request.getContextPath()%>/bfg/adddailyrecord">发布</a></li>
			          
			          <li class="divider"></li>
			         <li><a href="#">搜搜</a></li>
			       </ul>
				  </div>
				
				</div>
				</div>	
 -->					
				</form>
			</div>
		</div>
		<div class="row">
		<div class="col-md-9 col-md-offset-1 ">
			<c:if test="${!empty dailyrecords}">
			<c:forEach items="${dailyrecords }" var="dailyrecord" varStatus="status">
			<c:if test="${flags[status.index]==0 }"><button type="button" title="自己" data-toggle='tooltip' data-placement="left" class="btn btn-md"><i class="icon-user-md"></i></button></c:if>
			<c:if test="${flags[status.index]==1 }"><button type="button" title="取消关注"  data-toggle='tooltip'data-placement="left" value="${dailyrecord.user.name }" onclick="delfriend(this)" class="btn btn-md btn-danger"><i class="icon-heart"></i></button></c:if>
			<c:if test="${flags[status.index]==-1 }"><button type="button" title="关注" data-toggle='tooltip' data-placement="left" value="${dailyrecord.user.name }" onclick="addfriend(this)" class="btn btn-md btn-info"><i class="icon-heart-empty"></i></button></c:if>
			
			@${xuefn:decode(dailyrecord.user.name ) }&nbsp;|
			发布时间：<small><em><fmt:formatDate  value="${dailyrecord.time}" pattern="yyyy年MM月dd日"/>
			 </em></small>
			<p class="lead"><a href="<%=request.getContextPath()%>/bfg/show/${dailyrecord.id }"><c:out value="${fn:substring(dailyrecord.content, 0, 38)}" /></a></p>
			</c:forEach>
			</c:if>
		</div>
		</div>
		<div class="row">
		<div class="col-md-8 col-me-offset-2">
		<form></form>
		</div>
		</div>
	</div>
<script>
   $(function () { $("[data-toggle='tooltip']").tooltip(); });
</script>	

</body>
</html>