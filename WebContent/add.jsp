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
	  $(document).ready(function(){
		         //增加<tr/>
		         $("#but").click(function(){
		        	 var _len = $("#tab tr").length+1;
		        	 var llen = _len-1;
		            $("#tab").append("<tr id="+_len+">"
		                                 +"<td><input type='text' id='name"+_len+"' name='users[" +llen+ "].name'/></td>"
										 +"<td><input type='text' id='passwd"+_len+"' name='users[" +llen+ "].passwd'/></td>"
										 +"<td><input type='text' id='email"+_len+"' name='users[" +llen+ "].email'/></td>"
										 +"<td><input type='text' id='idcard"+_len+"' name='users[" +llen+ "].idcard'/></td>"
										 +"<td><input type='text' id='telephone"+_len+"' name='users[" +llen+ "].telephone'/></td>"
										 +"<td><button type='button' onclick='deltr("+_len+")' class='btn btn-md'><span class='glyphicon glyphicon-trash'></span></button></td>"
		                            	 +"</tr>");            
		        });    
		     });
		     
	  var deltr =function(index)
	   {

	       var _len = $("#tab tr").length;
			  if(_len==1){
				  alert("您至少需添加一个账户");
				  return;
			  }
	        $("tr[id='"+index+"']").remove();//删除当前行
	        for(var i=index+1,j=_len;i<=j;i++)
	        {
	        	var l = i-1;
	        	var ll = l-1;
	            var nextName = $("#name"+i).val();
	            var nextPasswd = $("#passwd"+i).val();
	            var nextEmail = $("#email"+i).val();
	            var nextIdcard = $("#idcard"+i).val();
	            var nextTelep = $("#telephone"+i).val();
	            
	            $("tr[id=\'"+i+"\']")
	                .replaceWith("<tr id="+l+">"
                             +"<td><input type='text' id='name"+l+"' name='users[" +ll+ "].name' value='"+ nextName +"'/></td>"
							 +"<td><input type='text' id='passwd"+l+"' name='users[" +ll+ "].passwd' value='"+nextPasswd+"'/></td>"
							 +"<td><input type='text' id='email"+l+"' name='users[" +ll+ "].email' value='"+nextEmail+"'/></td>"
							 +"<td><input type='text' id='idcard"+l+"' name='users[" +ll+ "].idcard' value='"+nextIdcard+"'/></td>"
							 +"<td><input type='text' id='telephone"+l+"' name='users[" +ll+ "].telephone' value='"+nextTelep+"'/></td>"
							 +"<td><button type='button' onclick='deltr("+l+")' class='btn btn-md'><span class='glyphicon glyphicon-trash'></span></button></td>"
                       	 +"</tr>"); 
	        }    
	        
	   };
	  
	 var rreset = function(){
		  var len = $("#tab tr").length;

		  for(var i=1;i<=len;i++){
	            var ll = i-1;
	            $("tr[id=\'"+i+"\']")
	                .replaceWith("<tr id="+i+">"
                             +"<td><input type='text' id='name"+i+"' name='users[" +ll+ "].name' value=''/></td>"
							 +"<td><input type='text' id='passwd"+i+"' name='users[" +ll+ "].passwd' value=''/></td>"
							 +"<td><input type='text' id='email"+i+"' name='users[" +ll+ "].email' value=''/></td>"
							 +"<td><input type='text' id='idcard"+i+"' name='users[" +ll+ "].idcard' value=''/></td>"
							 +"<td><input type='text' id='telephone"+i+"' name='users[" +ll+ "].telephone' value=''/></td>"
							 +"<td><button type='button' onclick='deltr("+i+")' class='btn btn-md'><span class='glyphicon glyphicon-trash'></span></button></td>"
                       	 +"</tr>"); 
			  
		  }//       			<td><button type="button" onclick="deltr(${i+1 })" class="btn btn-md"><span class="glyphicon glyphicon-trash"></span></button></td>

	  }
	 
	 var checksub = function(){
		 var len = $("#tab tr").length;
		 for(var i=1;i<=len;i++){
			 if($("#name"+i).val()==""||$("#name"+i).val()==null){
				 alert("第"+i+"行中的账户名不能为空！！！");
				 return;
			 }

			 if($("#passwd"+i).val()==""||$("#name"+i).val()==null){
				 alert("第"+i+"行中的密码不能为空！！！");
				 return;
			 }
			 if($("#email"+i).val()==""||$("#name"+i).val()==null){
				 alert("第"+i+"行中的邮箱不能为空！！！");
				 return;
			 }
			 if($("#idcard"+i).val()==""||$("#name"+i).val()==null){
				 alert("第"+i+"行中的身份证不能为空！！！");
				 return;
			 }
		 }
		var e = document.getElementById("addform");
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
			<c:set value="3" var="rootactive" scope="request"/>
        		<li <c:if test="${rootactive=='1'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/root">查看会员</a></li>
        		<li <c:if test="${rootactive=='2'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/root/edit">编辑会员</a></li>
        		<li <c:if test="${rootactive=='3'}">class="active" </c:if>><a href="<#">增加会员</a></li>
        		<li <c:if test="${rootactive=='4'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/root/del">删除会员</a></li>
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
		<div class="clo-md-1"></div>
		<div class="col-md-10">
		<hr>
		<p>大批量添加账户，<a href="<%=request.getContextPath()%>/root/hugeadd">Excel上传</a></p>
        <hr>
        <fieldset id="fieldset">
        
        <form action="<%=request.getContextPath()%>/root/toadd" id="addform" method="post">
        
       <table class="table table-bordered table-striped table-hover padding">
     
        <thead>
          <tr>
          	
            <th>账户名</th>
            <th>密码</th>
            <th>邮箱</th>
            <th>身份证</th>
			<th>手机号</th>
			<th>#</th>
          </tr>
        </thead>
       <tbody id="tab">
	
       		<c:forEach var="i" begin="0" end="4" step="1">

       		<tr id="${i+1 }">
       			<td><input type="text" id="name${i+1 }" name="users[${i }].name" /></td>
       			<td><input type="text" id="passwd${i+1 }" name="users[${i }].passwd" /></td>
       			<td><input type="text" id="email${i+1 }" name="users[${i }].email" /></td>
       			<td><input type="text" id="idcard${i+1 }" name="users[${i }].idcard" /></td>
       			<td><input type="text" id="telephone${i+1 }" name="users[${i }].telephone" /></td>
       			
       			<td><button type="button" onclick="deltr(${i+1 })" class="btn btn-md"><span class="glyphicon glyphicon-trash"></span></button></td>
       			
       		</tr>
       		
       		</c:forEach>
       </tbody>
     
       </table>
       
       <button type="button" id="checksubmit" class="btn btn-warning" onclick="checksub()" >提交</button>
     	 &nbsp;&nbsp;
       <input type="button" class="btn btn-danger" onclick="rreset()" value="重置"/>
       
        <button id="but" type="button" class="btn btn-info pull-right">添加</button>
       </form>
       </fieldset>
	</div>
	
	</div>
	</div>
	



    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->



  </body>
</html>
