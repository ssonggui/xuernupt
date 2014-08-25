<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
    <title>学耳南邮--topic</title>
    
        <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath()%>/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/bootstrap/dist/css/jumbotron.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/css/font-awesome.min.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/css/btstrapto.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/bootstrap.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/jquery.hotkeys.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/google-code-prettify/prettify.js"></script>
    <link href="<%=request.getContextPath()%>/bootstrap/dist/css/wysiwyg.css" rel="stylesheet">
	<script src="<%=request.getContextPath()%>/bootstrap/dist/js/bootstrap-wysiwyg.js"></script>
    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->

	<style type="text/css">
	.jumbotron {
	  background-color: #CC9966;
	}
	</style>
	
</head>
<% session.setAttribute("sessionpath", request.getServletPath()) ;%>

<body class="home">
   <c:set value="1" var="navactive" scope="request"/>
  <c:if test="${cookie.loginname.value==null }">
	<c:import url="navbar.jsp"/>
  </c:if>
	<c:if test="${cookie.loginname.value!=null }">
		<c:import url="cookienavbar.jsp"/>
    </c:if>
	
	<div class="container">
	<form action="<%=request.getContextPath()%>/updatetopic/${topic.id}" method="post">
	<div class="row">
	<div class="col-md-10 col-md-offset-1">
	<br>
		<div class="form-group">
			

			<label for="forum">分类</label>
			     <span>
       			 <select name="forum" id="forum">
	       			 <option value="1">JVM</option>
	       			 <option value="2">J2SE</option>
	       			 <option value="3">J2EE</option>
	       			 <option value="4">算法</option>
	       			 <option value="5">网络</option>
	       			 <option value="6">Linux</option>
	       			 <option value="7">其他</option>
       			 </select>
       			 </span> 
			
			<input type="text" class="form-control " placeholder="${topic.title }(题目不可修改)" name="title" disabled>
			
		</div>
	</div>
	</div>
<div class="row">
<div class="col-md-12 ">
			<div class="jumbotron">
			<div class="btn-toolbar" data-role="editor-toolbar" data-target="#editor">
			      <div class="btn-group">
			        <a class="btn btn-success dropdown-toggle" data-toggle="dropdown" title="字体"><i class="icon-font"></i><b class="caret"></b></a>
			          <ul class="dropdown-menu">
			          </ul>
			        </div>
			      <div class="btn-group">
			        <a class="btn btn-success dropdown-toggle" data-toggle="dropdown" title="字体大小"><i class="icon-text-height"></i>&nbsp;<b class="caret"></b></a>
			          <ul class="dropdown-menu">
					  <li><a data-edit="fontSize 7"><font size="7">超大</font></a></li>
			          <li><a data-edit="fontSize 5"><font size="5">大</font></a></li>
			          <li><a data-edit="fontSize 3"><font size="3">中</font></a></li>
			          <li><a data-edit="fontSize 1"><font size="1">小</font></a></li>
			          </ul>
			      </div>
			      <div class="btn-group">
			        <a class="btn btn-success" data-edit="bold" title="加粗 (Ctrl/Cmd+B)"><i class="icon-bold"></i></a>
			        <a class="btn btn-success" data-edit="italic" title="斜体 (Ctrl/Cmd+I)"><i class="icon-italic"></i></a>
			        <a class="btn btn-success" data-edit="strikethrough" title="删除线"><i class="icon-strikethrough"></i></a>
			        <a class="btn btn-success" data-edit="underline" title="底线 (Ctrl/Cmd+U)"><i class="icon-underline"></i></a>
			      </div>
			      <div class="btn-group">
			        <a class="btn btn-success" data-edit="insertunorderedlist" title="列表"><i class="icon-list-ul"></i></a>
			        <a class="btn btn-success" data-edit="insertorderedlist" title="数字列表"><i class="icon-list-ol"></i></a>
			        <a class="btn btn-success" data-edit="outdent" title="缩退  (Shift+Tab)"><i class="icon-indent-left"></i></a>
			        <a class="btn btn-success" data-edit="indent" title="缩进  (Tab)"><i class="icon-indent-right"></i></a>
			      </div>
			      <div class="btn-group">
			        <a class="btn btn-success" data-edit="justifyleft" title="左对齐  (Ctrl/Cmd+L)"><i class="icon-align-left"></i></a>
			        <a class="btn btn-success" data-edit="justifycenter" title="居中  (Ctrl/Cmd+E)"><i class="icon-align-center"></i></a>
			        <a class="btn btn-success" data-edit="justifyright" title="右对齐  (Ctrl/Cmd+R)"><i class="icon-align-right"></i></a>
			        <a class="btn btn-success" data-edit="justifyfull" title="调整 (Ctrl/Cmd+J)"><i class="icon-align-justify"></i></a>
			      </div>
			      <div class="btn-group">
					<a class="btn btn-success dropdown-toggle" data-toggle="dropdown" title="链接"><i class="icon-link"></i></a>
					<div class="dropdown-menu input-append">
						    <input class="span2" placeholder="URL" type="text" data-edit="createLink"/>
						    <button class="btn btn-success" type="button">添加</button>
			        </div>
			        <a class="btn btn-success" data-edit="unlink" title="撤销链接"><i class="icon-cut"></i></a>
			
			      </div>
			      
			      <div class="btn-group">
			        <a class="btn btn-success" title="插入图片" id="pictureBtn"><i class="icon-picture"></i></a>
			        <input type="file" data-role="magic-overlay" data-target="#pictureBtn" data-edit="insertImage" />
			      </div>
			      <div class="btn-group">
			        <a class="btn btn-success" data-edit="undo" title="撤销 (Ctrl/Cmd+Z)"><i class="icon-undo"></i></a>
			        <a class="btn btn-success" data-edit="redo" title="重重 (Ctrl/Cmd+Y)"><i class="icon-repeat"></i></a>
			      </div>			
			</div>
			
			<div id="editor">${topic.content }</div>
			<textarea id="content" name="content" class="hidden"></textarea>
			<button id="btnSave" type="submit" class="btn btn-primary">修改</button>
			<a href="<%=request.getContextPath()%>/view/topic/${topic.id}" class="btn btn-info pull-right">返回</a>
			</div>
</div>
</div>
	</form>
	</div>
	
<script>
  $(function(){
    function initToolbarBootstrapBindings() {
      var fonts = ['Serif', 'Times','Times New Roman','Microsoft YaHei','Tahoma','Helvetica','Arial','SimHei','SimSun','FangSong','KaiTi' ],
            fontTarget = $('[title=字体]').siblings('.dropdown-menu');
      $.each(fonts, function (idx, fontName) {
          fontTarget.append($('<li><a data-edit="fontName ' + fontName +'" style="font-family:\''+ fontName +'\'">'+fontName + '</a></li>'));
      });
      $('a[title]').tooltip({container:'body'});
    	$('.dropdown-menu input').click(function() {return false;})
		    .change(function () {$(this).parent('.dropdown-menu').siblings('.dropdown-toggle').dropdown('toggle');})
        .keydown('esc', function () {this.value='';$(this).change();});

      $('[data-role=magic-overlay]').each(function () { 
        var overlay = $(this), target = $(overlay.data('target')); 
        overlay.css('opacity', 0).css('position', 'absolute').offset(target.offset()).width(target.outerWidth()).height(target.outerHeight());
      });
      $('#voiceBtn').hide();
    };
    initToolbarBootstrapBindings();  
    $('#editor').wysiwyg();
    $('#btnSave').bind('click', function () {
        $("#content").val($("#editor").html());

    });
    window.prettyPrint && prettyPrint();
  });
</script>
</body>
</html>