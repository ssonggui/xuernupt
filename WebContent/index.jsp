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
    <link rel="shortcut icon" href="<%=request.getContextPath() %>/img/logo.png">

    <title>学耳南邮</title>

    <!-- Bootstrap core CSS -->
    <link href="<%=request.getContextPath() %>/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
 	<link href="<%=request.getContextPath() %>/bootstrap/dist/css/jumbotron.css" rel="stylesheet">
 	<link href="<%=request.getContextPath() %>/css/btstrapto.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="<%=request.getContextPath() %>/bootstrap/dist/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath() %>/bootstrap/dist/js/bootstrap.js"></script>

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
  
  <c:if test="${cookie.loginname.value==null }">
	<c:import url="navbar.jsp"/>
   </c:if>
	<c:if test="${cookie.loginname.value!=null }">
		<c:import url="cookienavbar.jsp"/>
    </c:if>
    <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron home">
      <div class="container">
        <h1>学耳南邮</h1>
        <p>战船千艘,俱沉沦于岩壑;渔舟一叶,惊出没于波澜</p>
        <p><a class="btn btn-primary btn-lg" href="<%=request.getContextPath() %>/course" role="button">更多 &raquo;</a></p>
      </div>
    </div>

    <div class="container">
      <!-- Example row of columns -->
      <div class="row">
        <div class="col-md-6">
          <h2>信息论</h2>
          <p>信息论是运用概率论与数理统计的方法研究信息、信息熵、通信系统、数据传输、密码学、数据压缩等问题的应用数学学科。信息论将信息的传递作为一种统计现象来考虑，给出了估算通信信道容量的方法。信息传输和信息压缩是信息论研究中的两大领域. </p>
          <p><a class="btn btn-default" href="http://baike.baidu.com/view/15076.htm?fr=aladdin" target="_blank" role="button">更多 &raquo;</a></p>
        </div>
        <div class="col-md-3">
          <h2>卢米埃/UME</h2>
          <p>卢米埃在南京紫峰大厦那里，感觉上比较高大上，其实效果很一般，3D效果明显不如UME。 </p>
          <p><a class="btn btn-default" href="http://www.lumiai.com" target="_blank">更多 &raquo;</a></p>
       </div>
        <div class="col-md-3">
          <h2>StackOverFlow</h2>
          <p>Stack Overflow是一个与程序相关的IT技术问答网站。用户可以在网站免费提交问题，浏览问题，索引相关内容，在创建主页的时候使用简单的HTML。在问题页面，我们不会弹出任何广告，销售信息，JavaScript 窗口等。</p>
          <p><a class="btn btn-default" href="http://stackoverflow.com/" target="_blank" role="button">更多 &raquo;</a></p>
        </div>
      </div>

      <hr>
<div class="row">


<div class="col-md-4">

    <!-- sample modal content -->
    <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title" id="myModalLabel">简历</h4>
          </div>
          <div class="modal-body">
            <h3>基本信息</h3>
            <p>宋亚南，河南人，本科南昌大学，硕士就读南京邮电大学。</p>
			<p>爱好编程，看电影。</p>
			<p>自评：热心，认真，能扛。</p>
			<p>论文：发表2篇。实习：2个单位。项目：本站</p>
            <h3>态度</h3>
            <p>本站采用springMVC+bootstrap</p>
            <p>从无到有，从只懂J2SE到一手搭建J2EE项目，收获的不仅是一点点技术，更多的是把想法变成了现实，把遇到了困难一一克服，知道了自己的工作态度。</p>
            <h4>2张图片</h4>
            <p> 点击即可
            <a href="javascript:void(null)" id="tip1" data-toggle="popover" tabindex="0" data-trigger="focus" data-placement="top" data-html="true" 
            data-original-title="二维码" 
            data-content='<img src="<%=request.getContextPath()%>/img/root.png" class="img-responsive" alt="Responsive image" class="img-thumbnail">' 
            >
            本站管理员入口</a>与 <a href="javascript:void(null)" id="tip2" data-toggle="popover" tabindex="0" data-trigger="focus" data-placement="top"  data-html="true"  title="没看到？甭失望！"
            data-content='<img src="<%=request.getContextPath()%>/img/HE.jpg" class="img-responsive" alt="Responsive image" class="img-thumbnail">' 
            >
            本尊</a> 
           		
           	</p>
         </div>
          <div class="modal-footer">
            <button type="button" class="btn  btn-warning" data-dismiss="modal">关闭</button>
          </div>
		</div>
	</div>
    </div><!-- /.modal -->

    <div style="padding-bottom: 24px;">
      <button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
        触发一个世界
      </button>
    </div><!-- /example -->



</div>

</div>
      <footer class="bs-footer">
        <p>&copy; xuernupt 2014</p>
      </footer>
    </div> <!-- /container -->


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->

<script>
   $(function () { $("[data-toggle='popover']").popover();});
</script>

  </body>
</html>
