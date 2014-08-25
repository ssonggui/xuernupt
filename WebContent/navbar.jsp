<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <script type="text/javascript">           
            	$("#examp").popover();
            	$("#tip1").tooltip();
            	$("#tip2").tooltip();
        </script> 
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
								field.value="用户名不存在";
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
<% session.setAttribute("sessionpath", request.getServletPath()) ;%>



    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">


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
        		<li <c:if test="${navactive=='1'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/course">课程动脉</a></li>
        		<li <c:if test="${navactive=='2'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/bfg">凤逑凰</a></li>
        		<li <c:if test="${navactive=='3'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/WeChat">微信</a></li>
        		<li <c:if test="${navactive=='4'}">class="active" </c:if>><a href="<%=request.getContextPath()%>/about">关于</a></li>
        	</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#exa1" data-toggle="modal">登录</a></li>


				<li><a href="<%=request.getContextPath()%>/Rg">注册</a></li>
			</ul>

        </div><!--/.navbar-collapse -->
      </div>
    </nav>






<div id="exa1" class="modal fade in" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
       <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
              <button class="close" data-dismiss="modal" aria-hidden="true">×</button>
              <h3 class="modal-title" id="myModalLabel1">登录您的账户</h3>
            </div>
			
			<form action="<%=request.getContextPath()%>/checkpasswd" role="form" method="post" id="login">
            <div class="modal-body">

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
				  <input type="checkbox" name="autologin" id="autologin" checked="checked">免登录
				</label>
			  </div>
				
	        
            </div>
            <div class="modal-footer">
              <button type="submit" class="btn  btn-success btn-lg btn-block">登录</button>
             
            </div>
			</form>	
            </div>
</div>
</div>







