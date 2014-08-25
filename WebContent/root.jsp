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

	</style>
	<script type="text/javascript">
		function setPara(field){
			$("#currentPage").value=field.value;
		}
		
		function edit(){
			var e = document.getElementById("del");
			e.action = "<%=request.getContextPath()%>/root/edit";
			e.submit();
		}
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
			<c:set value="1" var="rootactive" scope="request"/>
        		<li <c:if test="${rootactive=='1'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/root">查看会员</a></li>
        		<li <c:if test="${rootactive=='2'}">class="active" </c:if>><a onclick="edit()" href="#">编辑会员</a></li>
        		<li <c:if test="${rootactive=='3'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/root/add">增加会员</a></li>
        		<li <c:if test="${rootactive=='4'}">class="active" </c:if>><a onclick="document.getElementById('del').submit();" href="#">删除会员</a></li>
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
		<form action="<%=request.getContextPath()%>/root" method="post" id="go" class="padding">
             <div class="input-group">
                   <input type="text" name="name" class="form-control" placeholder="账户检索"/>
                       <span class="input-group-btn">
                         <button type='submit' name='seach' id='search-btn' class="btn btn-default">搜索</button>
                        </span>
             </div>
       </form>
        <hr>
		
		<table class="table table-bordered table-striped table-hover padding">
        <thead>
          <tr>
          	<th>#</th>
            <th>账户名</th>
            <th>密码</th>
            <th>邮箱</th>
            <th>身份证</th>
			<th>手机号</th>
          </tr>
        </thead>
        <tbody>
        
		<c:if test="${!empty userList}">
		
		<form method="post" action="<%=request.getContextPath()%>/root/del" id ="del">
		<c:forEach items="${userList }"  var="user"  >
          <tr>
          	<td><input type="checkbox" name="names" value="${user.name }"></td>
            <td>${user.name }</td>
            <td>${user.passwd }</td>
            <td>${user.email }</td>
            <td>${user.idcard }</td>
			<td>${user.telephone }</td>
          </tr>
		</c:forEach>
		
		</form>
		</c:if>
		
        </tbody>
      </table>
      <div class="row">
 
      	<div class="col-md-3">${page.totolrecord }条记录,共${page.pageNum }页
      	<form action="<%=request.getContextPath()%>/root" method="post" id="go">
      	
      	<span class="input-group">
      	
	      	 <select class="form-control" name="currentPage">
		        <c:forEach var="p" begin="1" end="${page.pageNum }" step="1">
		         <option value="${p-1 }" <c:if test="${page.currentPage==p-1 }">selected = "selected"</c:if>>第${p }页 </option>
		        </c:forEach>
	      	 </select>
	        
	        <span class="input-group-btn">
	         <button type='submit' class="btn btn-default">Go</button>
	        </span>
    	</span>
      	</form>
      	</div>
      	<div class="col-md-4"></div>
      	<div class="col-md-5">
<!--       		<ul class="pagination">
		        <li <c:if test="${!page.haspre }">class="disabled"</c:if>><button type="submit" onclick="setPara(this)" value="${page.currentPage-1 }" class="btn btn-md btn-warning">&laquo;</button></li>
		        <li <c:if test="${cpn+1>page.pageNum }">class="none"</c:if> <c:if test="${cpny==0 }">class="active"</c:if>><button type="submit" value="${cpns*5 }" onclick="setPara(this)" class="btn btn-md btn-info">${cpns*5+1 }</button></li>
		        <li <c:if test="${cpn+2>page.pageNum }">class="none"</c:if> <c:if test="${cpny==1 }">class="active"</c:if>><button type="submit" value="${cpns*5+1 }" onclick="setPara(this)" class="btn btn-md btn-info">${cpns*5+2 }</button></li>
		        <li <c:if test="${cpn+3>page.pageNum }">class="none"</c:if> <c:if test="${cpny==2 }">class="active"</c:if>><button type="submit" value="${cpns*5+2 }" onclick="setPara(this)" class="btn btn-md btn-info">${cpns*5+3 }</button></li>
				<li <c:if test="${cpn+4>page.pageNum }">class="none"</c:if> <c:if test="${cpny==3 }">class="active"</c:if>><button type="submit" value="${cpns*5+3 }" onclick="setPara(this)" class="btn btn-md btn-info">${cpns*5+4 }</button></li>
				<li <c:if test="${cpn+5>page.pageNum }">class="none"</c:if> <c:if test="${cpny==4 }">class="active"</c:if>><button type="submit" value="${cpns*5+4 }" onclick="setPara(this)" class="btn btn-md btn-info">${cpns*5+5 }</button></li>
		        <li <c:if test="${!page.hasnext }">class="disabled"</c:if>><button type="submit" onclick="setPara(this)" value="${page.currentPage+1 }" class="btn btn-md btn-warning">&raquo;</button></li>
      		</ul>
 -->
 			<ul class="pagination pull-right">
 			
 				<li <c:if test="${!page.haspre }">class="disabled"</c:if>><c:if test="${!page.haspre }"><span>&laquo;</span></c:if><c:if test="${page.haspre }"><a href="<%=request.getContextPath()%>/root?currentPage=${page.currentPage-1 }">&laquo;</a></c:if></li>
 				<c:forEach var="i" begin="${page.beginpage+1 }" end="${page.showpsize+page.beginpage }" step="1">
 				<li <c:if test="${page.currentPage==i-1 }">class="active"</c:if>><a href="<%=request.getContextPath()%>/root?currentPage=${i-1 }">${i }</a></li>
 				</c:forEach>
 				<li <c:if test="${!page.hasnext }">class="disabled"</c:if>><c:if test="${!page.hasnext }"><span>&raquo;</span></c:if><c:if test="${page.hasnext }"><a href="<%=request.getContextPath()%>/root?currentPage=${page.currentPage+1 }">&raquo;</a></c:if></li>
 				
 			</ul>
      		<!-- 明天  --- 重写  ul 还是换成 链接a  考虑 在模型Page 加入新属性，譬如 viewpagenum=${cpns*5+5 } 即是 在jsp 显示的页数（1--5）由后台返回 -->
      	</div>
      	
      	
      </div>
      
		</div>
	</div>
	</div>
	
	

   
      <footer class="bs-footer">
        <p>&copy; xuernupt 2014</p>
      </footer>
 


    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->



  </body>
</html>
