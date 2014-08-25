<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="xuefn" uri="http://www.xuernupt.com/taglib" %>

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
				
                <li class="dropdown  active">
                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">${xuefn:decode(cookie.loginname.value ) }<b class="caret"></b></a>
                  <ul class="dropdown-menu">
					
					<li><a href="#">个人中心</a></li>
                    <li><a href="<%=request.getContextPath()%>/revisepasswd">修改密码</a></li>
					<li class="divider"></li>
                    <li><a href="<%=request.getContextPath()%>/logout">注销</a></li>
                    
                  </ul>
                </li>
			</ul>

        </div><!--/.navbar-collapse -->
      </div>
    </nav>








