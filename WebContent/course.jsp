<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
 	<link href="<%=request.getContextPath()%>/css/font-awesome.min.css" rel="stylesheet">
 	<link href="<%=request.getContextPath()%>/css/btstrapto.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/jquery-2.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/bootstrap/dist/js/bootstrap.js"></script>
<script src="<%=request.getContextPath()%>/bootstrap/dist/js/xuernupt.js"></script>
    <!-- Just for debugging purposes. Don't actually copy this line! -->
    <!--[if lt IE 9]><script src="../../docs-assets/js/ie8-responsive-file-warning.js"></script><![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.0/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
	 a {
	 	color: #780000;
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
	</style>
    <script type="text/javascript">
 		$(function(){
    		$("#jvmpf").bind('click',function(){
    			var begin = 3;
    			 var htmlval = "";
    			$.ajax(
    					{
    						type: "post",
    						url: "<%=request.getContextPath()%>/coursepage",
    						data: {begin:begin},
    						dataType:"json",
    						success:function(list){
       						
       						$.each(list, function(idx, obj){
  						 		htmlval += "<p><a href=\"<%=request.getContextPath()%>"+obj.url+"\"><h4>"+
   						 		"<i class='icon-share-alt'>&nbsp;</i>"+obj.title+"</h4></a></p>"+
   								"<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class='icon-user'>&nbsp;</i>"+obj.ownername+"&nbsp;|&nbsp;发布时间：<small>"+obj.time+"</small></em>";	
     						});
       							
       						 
       						 $("#jvmpage").html(htmlval);
       						}
    					
    					}
    			);
    		});
 		});
    </script>
  </head>
<% session.setAttribute("sessionpath", request.getServletPath()) ;%>
  <body data-spy="scroll" data-target="#coursenav" >
 <c:set value="1" var="navactive" scope="request"/>
  <c:if test="${cookie.loginname.value==null }">
	<c:import url="navbar.jsp"/>
  </c:if>
	<c:if test="${cookie.loginname.value!=null }">
		<c:import url="cookienavbar.jsp"/>
    </c:if>
    <!-- Main jumbotron for a primary marketing message or call to action -->


    <div class="container">
      <!-- Example row of columns -->

      <div class="row">
        <div class="col-md-3">
        <nav class="navbar  navbar-default navbar-static" role="navigation"  id="coursenav" data-spy="affix" >
			<div class="collapse navbar-collapse" >
				<ul class="nav nav-pills nav-stacked padding">
		
						<li><a href="#JVM">Java虚拟机</a></li>
						<li><a href="#J2SE">Java基础</a></li>
						<li><a href="#J2EE">JavaWeb</a></li>
						<li><a href="#SF">数据结构与算法</a></li>
						<li><a href="#network">计算机网络</a></li>
						<li><a href="#linux">Linux</a></li>
						<li><a href="#other">其他</a></li>
				</ul>
			</div>
        </nav>
        </div>

        <div class="col-md-9">
                      
        <a href="<%=request.getContextPath()%>/topiceditor" class="btn btn-lg btn-info btn-block"><i class=" icon-edit">&nbsp;</i>博客---记录一段过程,填补一段人生--</a>
       
        
        <div data-offset="0" class="scrollspy-example" >
			   <h2 id="JVM"><i class="icon-list">&nbsp;</i>JAVA虚拟机</h2>
			   <p>Java语言的一个非常重要的特点就是与平台的无关性。而使用Java虚拟机是实现这一特点的关键。一般的高级语言如果要在不同的平台上运行，至少需要编译成不同的目标代码。而引入Java语言虚拟机后，Java语言在不同平台上运行时不需要重新编译。Java语言使用Java虚拟机屏蔽了与具体平台相关的信息，使得Java语言编译程序只需生成在Java虚拟机上运行的目标代码（字节码），就可以在多种平台上不加修改地运行。Java虚拟机在执行字节码时，把字节码解释成具体平台上的机器指令执行。这就是Java的能够“一次编译，到处运行”的原因</p>
				<div id="jvmpage">
				<c:forEach items="${topics1 }" var="topic">				
					<p><a href="<%=request.getContextPath()%>${topic.url }${topic.id }"><h4><i class=" icon-share-alt">&nbsp;</i>${topic.title }</h4></a></p>
						<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-user">&nbsp;</i>${topic.user_topic.name }<c:if test="${topic.user_topic.name==null }">undefined</c:if>&nbsp;|&nbsp;发布时间：<small><fmt:formatDate  value="${topic.time}" pattern="yyyy年MM月dd日HH时"/></small></em>					
				</c:forEach>

				</div>
								
					<ul class="pager">
					  <li ><a  id="jvmpf" href="javascript:void(0);" ><i class="icon-angle-left"></i></a></li>
					  <li  id="jvmpn"><a  href="javascript:void(0);" ><i class="icon-angle-right"></i></a></li>
					</ul>
			    <h2 id="J2SE"><i class="icon-list">&nbsp;</i>Java基础</h2>
			    <p>
				  抽象类：规定一个或多个抽象方法的类别本身必须定义为abstract，抽象类只是用来派生子类，而不能用它来创建对象。
				final类：又称“最终类”，它只能用来创建对象，而不能被继承，与抽象类刚好相反，而且抽象类与最终类不能同时修饰同一个类。
				包：Java中的包是相关类和接口的集合，创建包须使用关键字package。
				多态类：在java中，对象变量是多态的。而java中不支持多重继承。
				接口：Java中的接口是一系列方法的声明，是一些方法特征的集合，一个接口只有方法的特征没有方法的实现，因此这些方法可以在不同的地方被不同的类实现，而这些实现可以具有不同的行为（功能）。
				Java中的每一个类都是从Object类扩展而来的。
				object类中的equal和toString方法。
				equal用于测试一个对象是否同另一个对象相等。
				toString返回一个代表该对象的字符串，每一个类都会从Object类继承该方法，有些类重写了该方法，以便返回当前状态的正确表示。
				（toString 方法是一个很重要的方法）
				通用编程：任何类类型的所有值都可以同object类型的变量来代替。
				封装：就是把数据和行为结合起在一个包中，并对对象使用者隐藏数据的实现过程，一个对象中的数据叫他的实例字段（instance field）。
				重载：当多个方法具有相同的名字而含有不同的参数时，便发生重载。编译器必须挑选出调用哪个方法进行编译。
				重写：也可称为方法的“覆盖”。在Java中，子类可继承父类中的方法，而不需要重新编写相同的方法。但有时子类并不想原封不动地继承父类的方法，而是想作一定的修改，这就需要采用方法的重写。值得注意的是，子类在重新定义父类已有的方法时，应保持与父类完全相同的方法头声明。
				数组列表：ArrayList动态数组列表，是一个类库，定义在java.util包中，可自动调节数组的大小。
				class类 object类中的getclass方法返回class类型的一个实例，程序启动时包含在main方法的类会被加载，虚拟机要加载他需要的所有类，每一个加载的类都要加载它需要的类。
			    </p>

				<c:forEach items="${topics2 }" var="topic">
					<p><a href="<%=request.getContextPath()%>${topic.url }${topic.id }"><h4><i class=" icon-share-alt">&nbsp;</i>${topic.title }</h4></a></p>
					<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-user">&nbsp;</i>${topic.user_topic.name }&nbsp;|&nbsp;发布时间：<small><fmt:formatDate  value="${topic.time}" pattern="yyyy年MM月dd日HH时"/></em></small>										
				</c:forEach>
			    
				<h2 id="J2EE"><i class="icon-list">&nbsp;</i>JavaWeb</h2>
				<p>
				J2EE是Java2平台企业版（Java 2 Platform,Enterprise Edition）
J2EE核心是一组技术规范与指南，其中所包含的各类组件、服务架构及技术层次，均有共同的标准及规格，让各种依循J2EE架构的不同平台之间，存在良好的兼容性，解决过去企业后端使用的信息产品彼此之间无法兼容，企业内部或外部难以互通的窘境。
J2EE组件和“标准的” Java类的不同点在于：它被装配在一个J2EE应用中，具有固定的格式并遵守J2EE规范，由J2EE服务器对其进行管理。J2EE规范是这样定义J2EE组件的：客户端应用程序和applet是运行在客户端的组件；Java Servlet和Java Server Pages (JSP) 是运行在服务器端的Web组件；Enterprise Java Bean (E JB )组件是运行在服务器端的业务组件。
				</p>
				<c:forEach items="${topics3 }" var="topic">
					<p><a href="<%=request.getContextPath()%>${topic.url }${topic.id }"><h4><i class=" icon-share-alt">&nbsp;</i>${topic.title }</h4></a></p>
						<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-user">&nbsp;</i>${topic.user_topic.name }&nbsp;|&nbsp;发布时间：<small><fmt:formatDate  value="${topic.time}" pattern="yyyy年MM月dd日HH时"/></em></small>										
				</c:forEach>
								
				<h2 id="SF"><i class="icon-list">&nbsp;</i>数据结构与算法</h2>
				<p>
				算法（Algorithm）是指解题方案的准确而完整的描述，是一系列解决问题的清晰指令，算法代表着用系统的方法描述解决问题的策略机制。也就是说，能够对一定规范的输入，在有限时间内获得所要求的输出。如果一个算法有缺陷，或不适合于某个问题，执行这个算法将不会解决这个问题。不同的算法可能用不同的时间、空间或效率来完成同样的任务。一个算法的优劣可以用空间复杂度与时间复杂度来衡量。
算法中的指令描述的是一个计算，当其运行时能从一个初始状态和（可能为空的）初始输入开始，经过一系列有限而清晰定义的状态，最终产生输出并停止于一个终态。一个状态到另一个状态的转移不一定是确定的。随机化算法在内的一些算法，包含了一些随机输入。
形式化算法的概念部分源自尝试解决希尔伯特提出的判定问题，并在其后尝试定义有效计算性或者有效方法中成形。这些尝试包括库尔特·哥德尔、Jacques Herbrand和斯蒂芬·科尔·克莱尼分别于1930年、1934年和1935年提出的递归函数，阿隆佐·邱奇于1936年提出的λ演算，1936年Emil Leon Post的Formulation 1和艾伦·图灵1937年提出的图灵机。即使在当前，依然常有直觉想法难以定义为形式化算法的情况。
				</p>
				<c:forEach items="${topics4 }" var="topic">
					<p><a href="<%=request.getContextPath()%>${topic.url }${topic.id }"><h4><i class=" icon-share-alt">&nbsp;</i>${topic.title }</h4></a></p>
						<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-user">&nbsp;</i>${topic.user_topic.name }&nbsp;|&nbsp;发布时间：<small><fmt:formatDate  value="${topic.time}" pattern="yyyy年MM月dd日HH时"/></em></small>									
				</c:forEach>
								
				<h2 id="network"><i class="icon-list">&nbsp;</i>计算机网络</h2>
				<p>
				按广义定义

关于计算机网络的最简单定义是：一些相互连接的、以共享资源为目的的、自治的计算机的集合。
另外，从逻辑功能上看，计算机网络是以传输信息为基础目的，用通信线路将多个计算机连接起来的计算机系统的集合，一个计算机网络组成包括传输介质和通信设备。
从用户角度看，计算机网络它是这样定义的：存在着一个能为用户自动管理的网络操作系统。由它调用完成用户所调用的资源，而整个网络像一个大的计算机系统一样，对用户是透明的。
一个比较通用的定义是：利用通信线路将地理上分散的、具有独立功能的计算机系统和通信设备按不同的形式连接起来，以功能完善的网络软件及协议实现资源共享和信息传递的系统。
从整体上来说计算机网络就是把分布在不同地理区域的计算机与专门的外部设备用通信线路互联成一个规模大、功能强的系统，从而使众多的计算机可以方便地互相传递信息，共享硬件、软件、数据信息等资源。简单来说，计算机网络就是由通信线路互相连接的许多自主工作的计算机构成的集合体。
按连接定义

计算机网络就是通过线路互连起来的、资质的计算机集合，确切的说就是将分布在不同地理位置上的具有独立工作能力的计算机、终端及其附属设备用通信设备和通信线路连接起来，并配置网络软件，以实现计算机资源共享的系统。
按需求定义

计算机网络就是由大量独立的、但相互连接起来的计算机来共同完成计算机任务。这些系统称为计算机网络（computer networks）
				</p>
				<c:forEach items="${topics5 }" var="topic">

					<p><a href="<%=request.getContextPath()%>${topic.url }${topic.id }"><h4><i class=" icon-share-alt">&nbsp;</i>${topic.title }</h4></a></p>
											<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-user">&nbsp;</i>${topic.user_topic.name }&nbsp;|&nbsp;发布时间：<small><fmt:formatDate  value="${topic.time}" pattern="yyyy年MM月dd日HH时"/></em></small>										
				</c:forEach>
								
				<h2 id="linux"><i class="icon-list">&nbsp;</i>Linux</h2>
				<p>
				Linux是一套免费使用和自由传播的类Unix操作系统，是一个基于POSIX和UNIX的多用户、多任务、支持多线程和多CPU的操作系统。它能运行主要的UNIX工具软件、应用程序和网络协议。它支持32位和64位硬件。Linux继承了Unix以网络为核心的设计思想，是一个性能稳定的多用户网络操作系统。
Linux操作系统诞生于1991 年的10 月5 日（这是第一次正式向外公布的时间）。Linux存在着许多不同的Linux版本，但它们都使用了Linux内核。Linux可安装在各种计算机硬件设备中，比如手机、平板电脑、路由器、视频游戏控制台、台式计算机、大型机和超级计算机。严格来讲，Linux这个词本身只表示Linux内核，但实际上人们已经习惯了用Linux来形容整个基于Linux内核，并且使用GNU 工程各种工具和数据库的操作系统。
				</p>
					<c:forEach items="${topics6 }" var="topic">
					<p><a href="<%=request.getContextPath()%>${topic.url }${topic.id }"><h4><i class=" icon-share-alt">&nbsp;</i>${topic.title }</h4></a></p>
										<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-user">&nbsp;</i>${topic.user_topic.name }&nbsp;|&nbsp;发布时间：<small><fmt:formatDate  value="${topic.time}" pattern="yyyy年MM月dd日HH时"/></em></small>					
				
				</c:forEach>
							
				<h2 id="other"><i class="icon-list">&nbsp;</i>其他</h2>
				<p>
				非学习，将生活
				</p>
				<p>
				电影，我生活中的必不可少的精神世界
				</p>
				<p>
				我曾经想当导演，那是在高二。有天晚上我对着唯一听我的室友，将了一个我自己编得故事。。。。。。
				</p>
				<p>
				然后他睡着了
				</p>
				<c:forEach items="${topics7 }" var="topic">
					<p><a href="<%=request.getContextPath()%>${topic.url }${topic.id }"><h4><i class=" icon-share-alt">&nbsp;</i>${topic.title }</h4></a></p>
										<em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="icon-user">&nbsp;</i>${topic.user_topic.name }&nbsp;|&nbsp;发布时间：<small><fmt:formatDate  value="${topic.time}" pattern="yyyy年MM月dd日HH时"/></em></small>					
				
				</c:forEach>				
				
								
			</div>
       </div>

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
